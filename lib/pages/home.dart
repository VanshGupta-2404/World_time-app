import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  Map data = {};

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context)  {
    debugShowCheckedModeBanner: false;


    data = data.isNotEmpty? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage = data['isDaytime']?'day2.png':'night2.png';
    Color bgColor = data['isDaytime']?Colors.blue:Colors.black;


      //padding: const EdgeInsets.fromLTRB(0.0,80.0,0,0);
      return Scaffold(
        backgroundColor:bgColor ,
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              children:<Widget> [
                ElevatedButton.icon(
            onPressed: ()async{
             dynamic result= await Navigator.pushNamed(context, '/location');
             setState(() {
               data = {
                 'time': result['time'],
                 'location': result['location'],
                 'flag':result['flag'],
                 'isDaytime': result['isDaytime']
               };
             });
            },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location'),
                ),
              SizedBox(height: 30.0),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 32.0,
                      letterSpacing: 2.0
                    ),
                  )
                ],

          ),
               SizedBox(height: 2.0),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 42.0,
                )),



              ],
            ),
        ),
      ),

      ),);


  }
}
