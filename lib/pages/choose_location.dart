import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe%2FLondon'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe%2FBerlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa%2FCairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa%2FNairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America%2FChicago'),
    WorldTime(location: 'New_York', flag: 'usa.png', url: 'America%2FNew_York'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia%2FSeoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia%2FJakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //Navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      // body: Text('Choose Location screen'),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
             child: ListTile(
               onTap: () {
                 updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
            ),
          );
        },
      ),
    );
  }
}
