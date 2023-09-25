import '/backend/api_requests/api_calls.dart';
import '/components/distance_placeholder_widget.dart';
import '/components/dropdown_placeholder_widget.dart';
import '/components/email_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NearbyLocationsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (CheckCredSys)] action in NearbyLocations widget.
  ApiCallResponse? creditsResults;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for sQueryDropdown widget.
  String? sQueryDropdownValue;
  FormFieldController<String>? sQueryDropdownValueController;
  // State field(s) for sLocationDropdown widget.
  String? sLocationDropdownValue;
  FormFieldController<String>? sLocationDropdownValueController;
  // State field(s) for sSliderRadius widget.
  double? sSliderRadiusValue;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // State field(s) for QueryDropdown widget.
  String? queryDropdownValue;
  FormFieldController<String>? queryDropdownValueController;
  // State field(s) for LocationDropdown widget.
  String? locationDropdownValue;
  FormFieldController<String>? locationDropdownValueController;
  // State field(s) for SliderRadius2 widget.
  double? sliderRadius2Value;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in IconButton widget.
  ApiCallResponse? lFirst25;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in IconButton widget.
  ApiCallResponse? lNext25;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in IconButton widget.
  ApiCallResponse? lLast25;
  // Stores action output result for [Backend Call - API (GetCoordinates)] action in IconButton widget.
  ApiCallResponse? coordinateResult;
  // Stores action output result for [Backend Call - API (GetNearbyLocationsId)] action in IconButton widget.
  ApiCallResponse? locationsIdResult;
  // Stores action output result for [Backend Call - API (GetNearbyLocations)] action in IconButton widget.
  ApiCallResponse? locationsResult;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in IconButton widget.
  ApiCallResponse? first25;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in IconButton widget.
  ApiCallResponse? next25;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in IconButton widget.
  ApiCallResponse? last5;
  // Stores action output result for [Backend Call - API (GetCoordinates)] action in IconButton widget.
  ApiCallResponse? locationCoordinateResult;
  // Stores action output result for [Backend Call - API (GetNearbyLocationsId)] action in IconButton widget.
  ApiCallResponse? placeIdsResult;
  // Stores action output result for [Backend Call - API (GetNearbyLocations)] action in IconButton widget.
  ApiCallResponse? nearbyLocationResult;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Row widget.
  ApiCallResponse? lEmailFirst25;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Row widget.
  ApiCallResponse? lEmailNext25;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Row widget.
  ApiCallResponse? lEmailLast25;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
