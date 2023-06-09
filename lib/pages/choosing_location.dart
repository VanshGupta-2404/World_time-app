import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Worldtime> locations = [
    Worldtime(url: 'Europe/London', location: 'London',flag: 'london.png'),
    Worldtime(url: 'Africa/Cairo', location: 'Cairo',flag: 'india.png'),
    Worldtime(url: 'Asia/Seoul', location: 'Seoul',flag: 'china.png'),
    Worldtime(url: 'Asia/Jakarta', location: 'Jakarta',flag: 'nepal.png'),
    Worldtime(url: 'Europe/Berlin', location: 'Berlin',flag: 'ukraine.png'),
    Worldtime(url: 'America/Chicago', location: 'Chicago',flag: 'chicago.png'),
    Worldtime(url: 'America/Toronto', location: 'Toronto',flag: 'toronto.png'),

  ];



  void updateTime(index) async{
    Worldtime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'url': instance.url,
      'isDaytime': instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: Text('Choose Location'),
      ),
      body: ListView.builder(itemCount: locations.length,
      itemBuilder: (context,index){
        return Card(
          child: ListTile(
            onTap: (){
              updateTime(index);
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ),
        );
      })
    );
  }
}
