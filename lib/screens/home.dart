import 'package:flutter/material.dart';
import 'package:flutter_trip_list_animations/shared/screen_tile.dart';
import 'package:flutter_trip_list_animations/shared/trip_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            SizedBox(
              height: 100,
              child: ScreenTitle(text: 'Flutter Trips'),
            ),
            Expanded(
              child: TripList(),
            )
            //Sandbox(),
          ],
        ),
      ),
    );
  }
}
