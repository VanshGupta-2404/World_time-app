import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

//String time = 'loading';

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {




  Future<void> setupWorldTime() async {
    Worldtime instance = Worldtime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushNamed(context, '/home', arguments:{
      'location': instance.location,
    'flag': instance.flag,
      'time' : instance.time,
    'url': instance.url,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Scaffold(
      backgroundColor: Colors.black,
    body:  Center(
      child: SpinKitFadingCube(
        size: 60.0,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(

            decoration: BoxDecoration(

              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    ),
    );


  }
}

