// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'dart:async';

class LivingLabMap extends StatefulWidget {
  const LivingLabMap({
    Key? key,
    this.width,
    this.height,
    required this.target,
    required this.center,
    required this.radius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng target;
  final LatLng center;
  final double radius;

  @override
  _LivingLabMapState createState() => _LivingLabMapState();
}

class _LivingLabMapState extends State<LivingLabMap> {
  final Completer<gm.GoogleMapController> _mapController =
      Completer<gm.GoogleMapController>();

  late List<gm.Marker> markers;

  @override
  void initState() {
    super.initState();
    markers = [
      // gm.Marker(
      //   markerId: gm.MarkerId('Center'), // A unique ID for the marker
      //   position: gm.LatLng(widget.center.latitude,
      //       widget.center.longitude), // The location coordinates
      //   icon: gm.BitmapDescriptor.defaultMarker, // Marker icon (optional)
      // ),
      gm.Marker(
        markerId: gm.MarkerId('Location'), // A unique ID for the marker
        position: gm.LatLng(widget.target.latitude,
            widget.target.longitude), // The location coordinates
        icon: gm.BitmapDescriptor.defaultMarkerWithHue(
            gm.BitmapDescriptor.hueBlue), // Marker icon (optional)
      ),
    ];
  }
  // Add more markers as needed...

  @override
  Widget build(BuildContext context) {
    return Container(
      child: gm.GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _mapController.complete(controller);
          });
        },
        initialCameraPosition: gm.CameraPosition(
          target: gm.LatLng(widget.target.latitude,
              widget.target.longitude), // Set your initial map coordinates
          zoom: 12.0, // Adjust the zoom level as needed
        ),
        markers: Set<gm.Marker>.of(markers),
        circles: <gm.Circle>{
          gm.Circle(
            circleId:
                gm.CircleId("geofence_circle"), // A unique ID for the circle
            center: gm.LatLng(
                widget.center.latitude,
                widget.center
                    .longitude), // Center of the circle (same as map's center)
            radius: widget.radius, // Radius in meters (adjust as needed)
            fillColor: Colors.blue.withOpacity(0.3), // Fill color of the circle
            strokeColor: Colors.blue, // Stroke color of the circle
            strokeWidth: 2, // Stroke width
          ),
        },
      ),
    );
  }
}
