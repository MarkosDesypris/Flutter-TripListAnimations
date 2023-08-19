import 'package:flutter/material.dart';
import 'package:flutter_trip_list_animations/models/trip_model.dart';
import 'package:flutter_trip_list_animations/shared/heart.dart';
import 'package:ipsum/ipsum.dart' as ipsum;

class Details extends StatelessWidget {
  final Trip trip;

  const Details({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  child: Hero(
                tag: 'location-img-${trip.img}',
                child: Image.asset(
                  'assets/images/${trip.img}',
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              )),
              const SizedBox(height: 30),
              ListTile(
                title: Text(
                  trip.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
                subtitle: Text(
                  '${trip.nights} night stay for only \$${trip.price}',
                  style: const TextStyle(letterSpacing: 1),
                ),
                trailing: Heart(),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  ipsum.Ipsum().paragraphs(1),
                  style: TextStyle(color: Colors.grey[600], height: 1.4),
                ),
              ),
            ],
          ),
        ));
  }
}
