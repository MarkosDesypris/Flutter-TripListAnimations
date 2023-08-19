import 'package:flutter/material.dart';
import 'package:flutter_trip_list_animations/models/trip_model.dart';
import 'package:flutter_trip_list_animations/screens/details.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _offset = Tween(
    begin: Offset(1, 0),
    end: Offset(0, 0),
  );

  @override
  void initState() {
    super.initState();
    // A Way to Run this method only when the build method has ran!
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _addTrips();
      },
    );
  }

  void _addTrips() {
    // get data from db
    List<Trip> _trips = [
      Trip(
          title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    for (Trip trip in _trips) {
      _tripTiles.add(_buildTile(trip));
      _listKey.currentState!.insertItem(
        _tripTiles.length - 1,
        duration: Duration(milliseconds: 900 + _tripTiles.length * 100),
      );
    }
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(trip: trip),
          ),
        );
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${trip.nights} nights',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue[300],
            ),
          ),
          Text(
            trip.title,
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'assets/images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _tripTiles.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _tripTiles[index],
          );
        });
  }
}
