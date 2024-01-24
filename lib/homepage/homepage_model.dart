import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for sCountryDropdown widget.
  String? sCountryDropdownValue1;
  FormFieldController<String>? sCountryDropdownValueController1;
  // State field(s) for sLocationDropdown widget.
  String? sLocationDropdownValue1;
  FormFieldController<String>? sLocationDropdownValueController1;
  // State field(s) for sQueryDropdown widget.
  String? sQueryDropdownValue1;
  FormFieldController<String>? sQueryDropdownValueController1;
  // State field(s) for sSliderRadius widget.
  double? sSliderRadiusValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for sCountryDropdown widget.
  String? sCountryDropdownValue2;
  FormFieldController<String>? sCountryDropdownValueController2;
  // State field(s) for sLocationDropdown widget.
  String? sLocationDropdownValue2;
  FormFieldController<String>? sLocationDropdownValueController2;
  // State field(s) for sQueryDropdown widget.
  String? sQueryDropdownValue2;
  FormFieldController<String>? sQueryDropdownValueController2;
  // State field(s) for sSliderRadius widget.
  double? sSliderRadiusValue2;
  // State field(s) for sCountryDropdown widget.
  String? sCountryDropdownValue3;
  FormFieldController<String>? sCountryDropdownValueController3;
  // State field(s) for sLocationDropdown widget.
  String? sLocationDropdownValue3;
  FormFieldController<String>? sLocationDropdownValueController3;
  // State field(s) for sQueryDropdown widget.
  String? sQueryDropdownValue3;
  FormFieldController<String>? sQueryDropdownValueController3;
  // State field(s) for sSliderRadius widget.
  double? sSliderRadiusValue3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
