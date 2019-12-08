/* import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String text = 'This is where location will go';

  StreamSubscription<Position> subscription;
  Stream locationStream;

  Stream<Position> getLocation() {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .asStream();
  }

  void subscribe() {
    locationStream = getLocation();
    subscription = locationStream.listen((position) {
      setState(() {
        text = position.toString();
      });
    });
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            subscribe();
          },
          child: Text(text),
        ),
      ),
    );
  }
} */
