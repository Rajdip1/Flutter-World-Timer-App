import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for ui
  late String time; //time in that location
  late String flag; //flags of locations
  late String url; //location url for api endpoint
  late bool isDaytime; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      // make request
      Response response = await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //get property from data
      String? datetime = data['dateTime'];
      String? dayofweek = data['dayOfWeek'];
      // print(datetime);
      // print(dayofweek);

      //create date time object
      DateTime now = DateTime.parse(datetime!);
      // now.add(Duration(hours: ))

      //set the time property
      // time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('Caught error: $e');
      // time = 'Could not get time';
    }
  }
}
