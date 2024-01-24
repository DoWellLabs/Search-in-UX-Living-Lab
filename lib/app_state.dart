import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _refreshed = true;
  bool get refreshed => _refreshed;
  set refreshed(bool _value) {
    _refreshed = _value;
  }

  String _locationName = '';
  String get locationName => _locationName;
  set locationName(String _value) {
    _locationName = _value;
  }

  String _countryName = '';
  String get countryName => _countryName;
  set countryName(String _value) {
    _countryName = _value;
  }

  List<String> _CityNameList = [];
  List<String> get CityNameList => _CityNameList;
  set CityNameList(List<String> _value) {
    _CityNameList = _value;
  }

  void addToCityNameList(String _value) {
    _CityNameList.add(_value);
  }

  void removeFromCityNameList(String _value) {
    _CityNameList.remove(_value);
  }

  void removeAtIndexFromCityNameList(int _index) {
    _CityNameList.removeAt(_index);
  }

  void updateCityNameListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _CityNameList[_index] = updateFn(_CityNameList[_index]);
  }

  void insertAtIndexInCityNameList(int _index, String _value) {
    _CityNameList.insert(_index, _value);
  }

  LatLng? _location = LatLng(34.344222, 45.1422);
  LatLng? get location => _location;
  set location(LatLng? _value) {
    _location = _value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool _value) {
    _isLoading = _value;
  }

  List<dynamic> _locationList = [];
  List<dynamic> get locationList => _locationList;
  set locationList(List<dynamic> _value) {
    _locationList = _value;
  }

  void addToLocationList(dynamic _value) {
    _locationList.add(_value);
  }

  void removeFromLocationList(dynamic _value) {
    _locationList.remove(_value);
  }

  void removeAtIndexFromLocationList(int _index) {
    _locationList.removeAt(_index);
  }

  void updateLocationListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _locationList[_index] = updateFn(_locationList[_index]);
  }

  void insertAtIndexInLocationList(int _index, dynamic _value) {
    _locationList.insert(_index, _value);
  }

  LatLng? _originLatLng;
  LatLng? get originLatLng => _originLatLng;
  set originLatLng(LatLng? _value) {
    _originLatLng = _value;
  }

  int _clickedIndex = 0;
  int get clickedIndex => _clickedIndex;
  set clickedIndex(int _value) {
    _clickedIndex = _value;
  }

  bool _isGettingCities = false;
  bool get isGettingCities => _isGettingCities;
  set isGettingCities(bool _value) {
    _isGettingCities = _value;
  }

  List<dynamic> _cityList = [];
  List<dynamic> get cityList => _cityList;
  set cityList(List<dynamic> _value) {
    _cityList = _value;
  }

  void addToCityList(dynamic _value) {
    _cityList.add(_value);
  }

  void removeFromCityList(dynamic _value) {
    _cityList.remove(_value);
  }

  void removeAtIndexFromCityList(int _index) {
    _cityList.removeAt(_index);
  }

  void updateCityListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _cityList[_index] = updateFn(_cityList[_index]);
  }

  void insertAtIndexInCityList(int _index, dynamic _value) {
    _cityList.insert(_index, _value);
  }

  LatLng? _gotoCoord;
  LatLng? get gotoCoord => _gotoCoord;
  set gotoCoord(LatLng? _value) {
    _gotoCoord = _value;
  }

  bool _isNewClick = false;
  bool get isNewClick => _isNewClick;
  set isNewClick(bool _value) {
    _isNewClick = _value;
  }

  int _occurences = 0;
  int get occurences => _occurences;
  set occurences(int _value) {
    _occurences = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
