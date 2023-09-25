// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert' show utf8;
import 'package:download/download.dart';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';

Future downloadCsv(List<dynamic> docs, List<String> distances, String email,
    String searchWord, String searchLocation, String distanceRange) async {
  get(int index, List list) {
    try {
      return list[index];
    } on RangeError {
      return null;
    }
  }

  // //Set Metadata
  // List metadata = [
  //   "Date of Search",
  //   "Time of search",
  //   "User Name",
  //   "User Email",
  //   "Search Word",
  //   "Search Location",
  //   "From Distance",
  //   "To Distance"
  // ];
  DateTime now = new DateTime.now();
  DateFormat date = DateFormat.yMMMMd('en_US');
  DateFormat time = DateFormat('Hms');

  // List<String> metadataValues = [
  //   date.format(now),
  //   time.format(now)
  //   "UxLivingLab",
  //   email,
  //   searchWord,
  //   searchLocation,
  //   "0 meters",
  //   "$distance meters"
  // ];

  // Set the header
  List header = [
    "Date of Search",
    "Time of search",
    "User Name",
    "User Email",
    "Search Word",
    "Search Location",
    "From Distance",
    "To Distance",
    "Name",
    "Category",
    "Address",
    "Distance from City Center",
    "Day Hours",
    "Phone Number",
    "Website",
  ];

  List<List<dynamic>> fileContent = [];
  fileContent.add(header);

  docs.asMap().forEach((index, record) {
    record as Map;
    String dayHours;
    if (record['day_hours'] is String) {
      dayHours = record['day_hours'] as String;
    } else {
      var dh = record['day_hours'] as List;
      dayHours = dh.join(',\n');
    }
    String category = record['category'].join(',\n');
    var distance = get(index, distances).toString();

    List row = [
      date.format(now),
      time.format(now),
      "UxLivingLab",
      email,
      searchWord,
      searchLocation,
      "0 meters",
      "$distanceRange meters",
      "${record['place_name']}".toString(),
      category.toString(),
      "${record['address']}".toString(),
      distance,
      dayHours.toString(),
      "${record['phone']}".toString(),
      "${record['website']}".toString(),
    ];
    fileContent.add(row);
  });

  final fileName = "NearbyPlaces.csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var csvFile = ListToCsvConverter().convert(fileContent);

  final stream = Stream.fromIterable(csvFile.codeUnits);
  return download(stream, fileName);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
