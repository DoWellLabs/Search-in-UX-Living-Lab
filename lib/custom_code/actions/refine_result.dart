// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'dart:core';
//import "package:latlong/latlong.dart";
import '../../flutter_flow/custom_functions.dart' as fun;
import 'dart:math';

Future<List<dynamic>> refineResult(List<dynamic> coordList, double outerRadius,
    double innerRadius, LatLng origin) async {
  List<dynamic> retJson = [];
  for (int i = 0; i < coordList.length; i++) {
    dynamic item = coordList[i];
    List<String> itemString = item["location_coord"].split(",");
    LatLng coord =
        LatLng(double.parse(itemString[0]), double.parse(itemString[1]));
    double lat1 = coord.latitude * pi / 180;
    double lat2 = origin.latitude * pi / 180;
    double lng1 = coord.longitude * pi / 180;
    double lng2 = origin.longitude * pi / 180;
    double deltaLat = lat2 - lat1;
    double deltaLng = lng2 - lng1;
    double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1) * cos(lat2) * sin(deltaLng / 2) * sin(deltaLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = 6371 * c;
    i++;
    if (distance > 0 && distance <= outerRadius / 1000) {
      retJson.add(item);
    }
  }
  return retJson;
}
