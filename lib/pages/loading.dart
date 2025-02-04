import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';
  // String location = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'India', flag: 'germany.png', url: 'Asia%2FKolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      //passing all data or property to this rout to next rout means loading --> home
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
    // print(instance.time);
    // print(instance.location);

    // setState(() {
    //   time = instance.time;
    //   location = instance.location;
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
