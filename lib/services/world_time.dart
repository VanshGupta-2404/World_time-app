import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class Worldtime {
  String location;
  String time="";
  String flag;
  String url;
  late bool isDaytime;
  Worldtime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async {

    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    //print(data['title']);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDaytime= now.hour>6 && now.hour<20? true:false;
    time = DateFormat.jm().format(now);
    //print(now);
    //time = now.toString();
  }

}