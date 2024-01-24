import '/backend/api_requests/api_calls.dart';
import '/components/distance_placeholder_widget.dart';
import '/components/email_widget.dart';
import '/components/empty_locatio_list_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'homepage_new_copy_widget.dart' show HomepageNewCopyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomepageNewCopyModel extends FlutterFlowModel<HomepageNewCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for CountryDropdownMobile widget.
  String? countryDropdownMobileValue;
  FormFieldController<String>? countryDropdownMobileValueController;
  // Stores action output result for [Backend Call - API (GetCities)] action in CountryDropdownMobile widget.
  ApiCallResponse? getCitiesResponse;
  // State field(s) for LocdationDropdownMobile widget.
  String? locdationDropdownMobileValue;
  FormFieldController<String>? locdationDropdownMobileValueController;
  // State field(s) for categoryField widget.
  FocusNode? categoryFieldFocusNode;
  TextEditingController? categoryFieldController;
  String? Function(BuildContext, String?)? categoryFieldControllerValidator;
  // State field(s) for sliderMobile widget.
  double? sliderMobileValue;
  // State field(s) for MobileEmail widget.
  FocusNode? mobileEmailFocusNode;
  TextEditingController? mobileEmailController;
  String? Function(BuildContext, String?)? mobileEmailControllerValidator;
  String? _mobileEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid Email';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (User Email Info)] action in MobileEmail widget.
  ApiCallResponse? apiResultmar;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Container widget.
  ApiCallResponse? lN25CopyMobile;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Container widget.
  ApiCallResponse? lL25CopyMobile;
  // Stores action output result for [Backend Call - API (User Email Info)] action in Container widget.
  ApiCallResponse? userInfoResonseMobile;
  // Stores action output result for [Backend Call - API (Register an User)] action in Container widget.
  ApiCallResponse? apiResultzun;
  // Stores action output result for [Backend Call - API (get coordinates API  new)] action in Container widget.
  ApiCallResponse? getCordinateResult;
  // Stores action output result for [Backend Call - API (Experienced service User details)] action in Container widget.
  ApiCallResponse? updateUserInfoMobile;
  // Stores action output result for [Backend Call - API (GetNearbyLocationsId)] action in Container widget.
  ApiCallResponse? nearbyLocationsIdResult;
  // Stores action output result for [Backend Call - API (GetNearbyLocations)] action in Container widget.
  ApiCallResponse? getLocationResult;
  // Stores action output result for [Custom Action - refineResult] action in Container widget.
  List<dynamic>? refineResult;
  // Stores action output result for [Backend Call - API (Experienced User DataBase)] action in Container widget.
  ApiCallResponse? apiResultq0s;
  // State field(s) for CountryDropdownDesktop widget.
  String? countryDropdownDesktopValue;
  FormFieldController<String>? countryDropdownDesktopValueController;
  // Stores action output result for [Backend Call - API (GetCities)] action in CountryDropdownDesktop widget.
  ApiCallResponse? getCitiesResponseDesktop;
  // State field(s) for LocdationDropdownDesktop widget.
  String? locdationDropdownDesktopValue;
  FormFieldController<String>? locdationDropdownDesktopValueController;
  // State field(s) for categoryFieldDesktop widget.
  FocusNode? categoryFieldDesktopFocusNode;
  TextEditingController? categoryFieldDesktopController;
  String? Function(BuildContext, String?)?
      categoryFieldDesktopControllerValidator;
  // State field(s) for sliderDesktop widget.
  double? sliderDesktopValue;
  // State field(s) for DesktopEmail widget.
  FocusNode? desktopEmailFocusNode;
  TextEditingController? desktopEmailController;
  String? Function(BuildContext, String?)? desktopEmailControllerValidator;
  String? _desktopEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (User Email Info)] action in DesktopEmail widget.
  ApiCallResponse? apiResultw1b;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Container widget.
  ApiCallResponse? lN25CopyDesktop;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Container widget.
  ApiCallResponse? lL25CopyDesktop;
  // Stores action output result for [Backend Call - API (User Email Info)] action in Container widget.
  ApiCallResponse? userInfoResponseDesktop;
  // Stores action output result for [Backend Call - API (Register an User)] action in Container widget.
  ApiCallResponse? apiResult7af;
  // Stores action output result for [Backend Call - API (Update User Usage)] action in Container widget.
  ApiCallResponse? updateUserUsageDesktop;
  // Stores action output result for [Backend Call - API (get coordinates API  new)] action in Container widget.
  ApiCallResponse? getCordinateResultDesktop;
  // Stores action output result for [Backend Call - API (GetNearbyLocationsId)] action in Container widget.
  ApiCallResponse? nearbyLocationsIdDesktop;
  // Stores action output result for [Backend Call - API (GetNearbyLocations)] action in Container widget.
  ApiCallResponse? getLocationResultDesktop;
  // Stores action output result for [Custom Action - refineResult] action in Container widget.
  List<dynamic>? refineResultDesktop;
  // Stores action output result for [Backend Call - API (Experienced User DataBase)] action in Container widget.
  ApiCallResponse? userDetailUpdatedDesktop;
  // State field(s) for CountryDropdownTablet widget.
  String? countryDropdownTabletValue;
  FormFieldController<String>? countryDropdownTabletValueController;
  // Stores action output result for [Backend Call - API (GetCities)] action in CountryDropdownTablet widget.
  ApiCallResponse? getCitiesResponseTablet;
  // State field(s) for LocdationDropdownTablet widget.
  String? locdationDropdownTabletValue;
  FormFieldController<String>? locdationDropdownTabletValueController;
  // State field(s) for categoryFieldTablet widget.
  FocusNode? categoryFieldTabletFocusNode;
  TextEditingController? categoryFieldTabletController;
  String? Function(BuildContext, String?)?
      categoryFieldTabletControllerValidator;
  // State field(s) for slideTablet widget.
  double? slideTabletValue;
  // State field(s) for TabletEmail widget.
  FocusNode? tabletEmailFocusNode;
  TextEditingController? tabletEmailController;
  String? Function(BuildContext, String?)? tabletEmailControllerValidator;
  String? _tabletEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid Email';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (User Email Info)] action in TabletEmail widget.
  ApiCallResponse? apiResultc9c;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Container widget.
  ApiCallResponse? lN25CopyTablet;
  // Stores action output result for [Backend Call - API (CalculateDistance)] action in Container widget.
  ApiCallResponse? lL25CopyTablet;
  // Stores action output result for [Backend Call - API (User Email Info)] action in Container widget.
  ApiCallResponse? userInfoResponse;
  // Stores action output result for [Backend Call - API (Register an User)] action in Container widget.
  ApiCallResponse? apiResultwq3;
  // Stores action output result for [Backend Call - API (Experienced service User details)] action in Container widget.
  ApiCallResponse? updatedUserInfo;
  // Stores action output result for [Backend Call - API (get coordinates API  new)] action in Container widget.
  ApiCallResponse? getCordinateResultTablet;
  // Stores action output result for [Backend Call - API (GetNearbyLocationsId)] action in Container widget.
  ApiCallResponse? nearbyLocationsIdTablet;
  // Stores action output result for [Backend Call - API (GetNearbyLocations)] action in Container widget.
  ApiCallResponse? getLocationResultTablet;
  // Stores action output result for [Custom Action - refineResult] action in Container widget.
  List<dynamic>? refineResultTablet;
  // Stores action output result for [Backend Call - API (Experienced User DataBase)] action in Container widget.
  ApiCallResponse? userDetailsUpdated;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mobileEmailControllerValidator = _mobileEmailControllerValidator;
    desktopEmailControllerValidator = _desktopEmailControllerValidator;
    tabletEmailControllerValidator = _tabletEmailControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    categoryFieldFocusNode?.dispose();
    categoryFieldController?.dispose();

    mobileEmailFocusNode?.dispose();
    mobileEmailController?.dispose();

    categoryFieldDesktopFocusNode?.dispose();
    categoryFieldDesktopController?.dispose();

    desktopEmailFocusNode?.dispose();
    desktopEmailController?.dispose();

    categoryFieldTabletFocusNode?.dispose();
    categoryFieldTabletController?.dispose();

    tabletEmailFocusNode?.dispose();
    tabletEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
