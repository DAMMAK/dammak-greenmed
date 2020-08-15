import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Direction extends StatefulWidget {
  @override
  _DirectionState createState() => _DirectionState();
}

class _DirectionState extends State<Direction> {
  GoogleMapController mapController;
  MapType _currentMapType = MapType.normal;
  Marker marker;
  Location location = Location();

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: _currentMapType,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
      ),
    );
  }
}
