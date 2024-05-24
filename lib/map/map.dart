import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MapSample extends StatefulWidget {
  MapSample({super.key,});
  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  CameraPosition kGooglePlex = CameraPosition(target: LatLng(9.0054, 38.7657), zoom: 15.4746,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
