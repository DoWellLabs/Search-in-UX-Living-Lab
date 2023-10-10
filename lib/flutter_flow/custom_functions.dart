import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? getDistanceInMeters(double? havDistance) {
  return "${havDistance?.ceilToDouble()} meters";
}

String formatCoords(String coords) {
  List<String> coordsList = coords.split('');
  if (coordsList.length < 9) {
    return coordsList.sublist(0, 2).join();
  }
  var flist = coordsList.sublist(0, coordsList.length - 4);
  return flist.join();
}

String formatLng(String lng) {
  List<String> coordsList = lng.split('');
  if (coordsList.length < 9) {
    return coordsList.sublist(0, 2).join();
  }
  var flist = coordsList.sublist(0, coordsList.length - 4);
  return flist.join();
}

bool isListEmpty(List<dynamic> list) {
  debugPrint("checking list : ${list}");
  if (list.elementAt(0) == "null") {
    return true;
  }
  return list.isEmpty;
}

String formatJsonToEmailBody(
  List<dynamic> data,
  String message,
  List<String>? distances,
  String email,
  String searchWord,
  String searchLocation,
  String distanceRange,
) {
  get(int index, List list) {
    try {
      return list[index];
    } on RangeError {
      return null;
    }
  }

  //Set Metadata

  DateTime now = new DateTime.now();
  DateFormat date = DateFormat.yMMMMd('en_US');
  DateFormat time = DateFormat('Hms');

  // format a list of json to string so that it can be send in email body
  // print(data);
  var html =
      '<html> <body> <header> <h4>$message</h4> </header><table style=\\"border-collapse: collapse;\\"> <colgroup><col width=\\"8%\\"><col width=\\"5%\\"><col width=\\"5%\\"><col width=\\"8%\\"><col width=\\"5%\\"><col width=\\"5%\\"><col width=\\"8%\\"><col width=\\"8%\\"><col width=\\"10%\\"><col width=\\"7%\\"><col width=\\"10%\\"><col width=\\"10%\\"><col width=\\"6%\\"><col width=\\"5%\\"></colgroup> <tr><th style=\\"border: 1px solid black; padding: 8px;\\">Date of Search</th><th style=\\"border: 1px solid black; padding: 8px;\\">Time of search</th><th style=\\"border: 1px solid black; padding: 8px;\\">User Name</th><th style=\\"border: 1px solid black; padding: 8px;\\">User Email</th><th style=\\"border: 1px solid black; padding: 8px;\\">Search Word</th><th style=\\"border: 1px solid black; padding: 8px;\\">Search Location</th><th style=\\"border: 1px solid black; padding: 8px;\\">From Distance</th><th style=\\"border: 1px solid black; padding: 8px;\\">To Distance</th><th style=\\"border: 1px solid black; padding: 8px;\\">Name</th> <th style=\\"border: 1px solid black; padding: 8px;\\">Distance from City Center</th><th style=\\"border: 1px solid black; padding: 8px;\\">Opening Days/Hours</th> <th style=\\"border: 1px solid black; padding: 8px;\\">Website</th> <th style=\\"border: 1px solid black; padding: 8px;\\">Phone Number</th> <th style=\\"border: 1px solid black; padding: 8px;\\">Rating</th></tr>';
  int index = 0;
  for (var value in data) {
    var mvalue = value as Map<dynamic, dynamic>;
    String name = mvalue['place_name'].toString();
    String dHours = "<ul>";
    if (mvalue['day_hours'] is String) {
      dHours = mvalue['day_hours'] as String;
    } else {
      List dHoursList = mvalue['day_hours'] as List;
      for (var dh in dHoursList) {
        dHours += "<li>$dh</li>";
      }
      dHours += "</ul>";
    }
    String distance =
        distances == null ? "None" : get(index, distances).toString();
    String website = mvalue['website'].toString();
    String phone = mvalue['phone'].toString();
    String rating = mvalue['rating'].toString();

    html +=
        '<tr><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">${date.format(now)}</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">${time.format(now)}</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">UxLivingLab</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">$email</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">$searchWord</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">$searchLocation</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">0 meters</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">$distanceRange meters</td><td style=\\"border: 1px solid black; padding: 8px; text-align: center;\\">$name</td><td style=\\"border: 1px solid black; padding: 8px;\\">$distance</td> <td style=\\"border: 1px solid black; padding: 8px;\\">$dHours</td> <td style=\\"border: 1px solid black; padding: 8px;\\">$website</td><td style=\\"border: 1px solid black; padding: 8px;\\">$phone</td><td style=\\"border: 1px solid black; padding: 8px;\\">$rating</td></tr>';
    index++;
  }
  html += "</table> </body></html>";
  return html;
}

String getNameFromEmail(String email) {
  // get the name from email address
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  // Split the email address by the "@" symbol
  List<String> parts = email.split("@");

  // If the email has the correct format
  if (parts.length == 2) {
    // Get the part before the "@" symbol
    String namePart = parts[0];

    // Split the name part by periods (.) and underscores (_)
    List<String> nameParts = namePart.split(RegExp("[._]"));

    if (nameParts.length >= 2) {
      // Capitalize the first letter of each name part
      List<String> capitalizedParts =
          nameParts.map((part) => capitalize(part)).toList();

      // Join the capitalized parts with spaces
      String fullName = capitalizedParts.join(" ");

      return fullName;
    }
  }

  // Return the original email if it doesn't match the expected format
  return email;
}

int toInt(String value) {
  // Convert a string to int and if double find ceil
  try {
    double doubleValue = double.parse(value);
    return doubleValue.ceil();
  } catch (e) {
    return 0;
  }
}

int listLength(List<dynamic> list) {
  if (list.length == Null) {
    return 0;
  }

  return list.length;
}

String joinCoords(List<String> coordinates) {
  return coordinates.join('|');
}

List<String> sublist(
  int startIndex,
  int endIndex,
  List<String> list,
) {
  // get the sublist of a list
  return list.sublist(startIndex > list.length ? list.length : startIndex,
      endIndex > list.length ? list.length : endIndex);
}

List<String>? joinLists(
  List<String>? list1,
  List<String>? list2,
  List<String>? list3,
) {
  // join 3 lists to 1 with each adding to the end

  return [...?list1, ...?list2, ...?list3];
}

double distanceWithLocation(
  String centerCoordinate,
  double lat2,
  double lon2,
) {
  double _toRadians(double degrees) => degrees * math.pi / 180;
  double lat1 = 0;
  double lon1 = 0;

  num _haversin(double radians) => math.pow(math.sin(radians / 2), 2);

  const r = 6372.8; // Earth radius in kilometers

  final dLat = _toRadians(lat2 - lat1);
  final dLon = _toRadians(lon2 - lon1);
  final lat1Radians = _toRadians(lat1);
  final lat2Radians = _toRadians(lat2);

  final a = _haversin(dLat) +
      math.cos(lat1Radians) * math.cos(lat2Radians) * _haversin(dLon);
  final c = 2 * math.asin(math.sqrt(a));

  return r * c;
}

LatLng getLatLng(
  String lat,
  String lng,
) {
  // join lat and lng strings and return a LatLng

  return LatLng(double.parse(lat), double.parse(lng));
}

LatLng latLngFromLocation(String latLng) {
  var lCoord = latLng.split(",");
  String lat = lCoord.first;
  String lng = lCoord.last;
  return LatLng(double.parse(lat), double.parse(lng));
}
