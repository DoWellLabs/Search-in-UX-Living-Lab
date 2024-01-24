// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

//import 'package:do_well_maps/flutter_flow/flutter_flow_google_map.dart';
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MarkerModel {
  final latlng.LatLng coord;
  final String address;
  final String name;
  final String id;
  final int index;

  const MarkerModel(
      {required this.coord,
      required this.address,
      required this.name,
      required this.id,
      required this.index});
}

class MyMapWidget extends StatefulWidget {
  const MyMapWidget(
      {Key? key,
      this.width,
      this.height,
      this.origin,
      this.isNewClick = false,
      this.gotoCoord,
      required this.radius2,
      this.locationList,
      required this.clearmap,
      required this.iOSGoogleMapsApiKey,
      required this.androidGoogleMapsApiKey,
      required this.webGoogleMapsApiKey})
      : super(key: key);

  final double? width;
  final double? height;
  final LatLng? origin;
  final LatLng? gotoCoord;
  final double? radius2;

  final List<dynamic>? locationList;
  final bool isNewClick;
  final bool clearmap;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;

  @override
  _MyMapWidget createState() => _MyMapWidget();
}

class _MyMapWidget extends State<MyMapWidget> {
  GoogleMapController? _controller;
  List<MarkerModel> cordinates = [];

  Set<Marker> markers = new Set();
  Set<Marker> draggableMarkers = new Set();

  //late var placepicked;
  //late var selectedlocatn;
  late BitmapDescriptor pinLocationIcon;

  String get googleMapsApiKey {
    if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  @override
  void initState() {
    getIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    formatLocation(widget.locationList);
    if (widget.isNewClick && widget.gotoCoord != null) {
      goToLocation(
          lat: widget.gotoCoord!.latitude, lng: widget.gotoCoord!.longitude);
    }
    debugPrint("::: from the google mapping:::0 ");
    return Stack(children: [
      Container(
          width: widget.width,
          height: widget.height,
          child: GoogleMap(
            zoomControlsEnabled: false,
            tiltGesturesEnabled: true,
            //  polylines: Set.from(polyline),
            initialCameraPosition: CameraPosition(
                target: latlng.LatLng(
                    widget.origin!.latitude, widget.origin!.longitude),
                bearing: 180.0,
                tilt: 30.0),
            circles: Set.from([
              Circle(
                  circleId: CircleId("circleId"),
                  center: latlng.LatLng(
                      widget.origin!.latitude, widget.origin!.longitude),
                  radius: widget.radius2!,
                  strokeWidth: 2,
                  strokeColor: Color.fromARGB(255, 3, 124, 7),
                  fillColor: const Color.fromARGB(115, 33, 149, 243)),
            ]),
            markers: getmarkers(
              latlng.LatLng(widget.origin!.latitude, widget.origin!.longitude),
              widget.clearmap,
              context,
            ).toSet(),
            myLocationEnabled: true,

            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller = controller;

                _controller?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                      zoom: 14,
                      bearing: 180.0,
                      tilt: 30.0,
                    ),
                  ),
                );
              });
            },
          )),
    ]);
  }

  Future<void> goToLocation({required double lat, required double lng}) async {
    print(
        "::::: goto coord is called what is up:::: constroller $_controller :::lat $lat ::: lng :::$lng");
    CameraPosition position = CameraPosition(
      target: latlng.LatLng(lat, lng),
      zoom: 14,
      bearing: 180.0,
      tilt: 30.0,
    );
    // final GoogleMapController controller = await _controller!.Future;
    FFAppState().isNewClick = false;
    FFAppState().gotoCoord = null;
    await _controller?.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  void formatLocation(List<dynamic>? locationList) {
    if (locationList == null || locationList.isEmpty) {
      print("::::: the formation empty is running::::");
      return;
    }
    List<MarkerModel> listofObject = [];
    int count = 0;
    locationList.forEach((item) {
      List<String> itemString = item["location_coord"].split(",");
      latlng.LatLng coord = latlng.LatLng(
          double.parse(itemString[0]), double.parse(itemString[1]));
      listofObject.add(MarkerModel(
        coord: coord,
        name: item["place_name"],
        address: item["address"],
        id: item["placeId"],
        index: count,
      ));
      count++;
    });
    cordinates = listofObject;
  }

  var markerIcon;
  getIcon() async {
    final File markerImageFile = await DefaultCacheManager().getSingleFile(
        "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/experiments-v2-bk50u5/assets/x5i3ohggyd4r/map-pin.png");

    Uint8List markerImageBytes = await markerImageFile.readAsBytes();

    markerIcon = BitmapDescriptor.fromBytes(markerImageBytes);
  }

  Set<Marker> getmarkers(
      latlng.LatLng origin, bool clearmap, BuildContext context) {
    debugPrint(
        "from the getmarkers section checking the clearmarker value:::0:: $clearmap :::");
    if (clearmap) {
      debugPrint(
          "from the getmarkers section checking the clearmarker value:::1:: $clearmap :::");
      removeMarker();
      markers.add(Marker(
        markerId: MarkerId("Starting_id"),
        position: latlng.LatLng(
            origin.latitude, origin.longitude), //position of marker
        infoWindow: InfoWindow(title: "Standing Point"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));
      goToLocation(lat: origin.latitude, lng: origin.longitude);
    } else {
      debugPrint(
          "from the getmarkers section checking the clearmarker value:::10:: $clearmap :::");

      if (markers.length > 1) {
        removeMarker();
      }

      markers.add(Marker(
        markerId: MarkerId("Starting_id"),
        position: latlng.LatLng(
            origin.latitude, origin.longitude), //position of marker
        infoWindow: InfoWindow(title: "Standing Point"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));

      if (cordinates.isNotEmpty) {
        for (var i = 0; i < cordinates.length; i++) {
          MarkerModel dataInfo = cordinates[i];
          markers.add(Marker(
              markerId: MarkerId(dataInfo.id),
              position: latlng.LatLng(dataInfo.coord.latitude,
                  dataInfo.coord.longitude), //position of marker
              infoWindow: InfoWindow(title: dataInfo.name),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              onTap: () async {
                //logic for direction api request

                // _computePath(
                //     latlng.LatLng(origin!.latitude, origin!.longitude),
                //     latlng.LatLng(
                //         dataInfo.coord.latitude, dataInfo.coord.longitude));
              }));
        }
        debugPrint("G Markers $markers");
      }
    }
    setState(() {});
    return markers;
  }

  removeMarker() {
    // if (markers.length > 1) {
    //   final firstMarker = markers.first;
    //   markers.clear();
    //   markers.add(firstMarker);
    // }

    markers = {};

    setState(() {});
  }
}
