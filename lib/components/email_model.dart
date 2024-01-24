import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'email_widget.dart' show EmailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailModel extends FlutterFlowModel<EmailWidget> {
  ///  Local state fields for this component.

  bool? subscribeToNewsLetter;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for toEmail widget.
  FocusNode? toEmailFocusNode;
  TextEditingController? toEmailController;
  String? Function(BuildContext, String?)? toEmailControllerValidator;
  String? _toEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (DowellSendEmail)] action in EmailButton widget.
  ApiCallResponse? sendEmailResult;
  // Stores action output result for [Backend Call - API (DowellSendEmail)] action in EmailButton widget.
  ApiCallResponse? sendCopyEmailResult;
  // Stores action output result for [Backend Call - API (SubscribeToNewsLetter)] action in EmailButton widget.
  ApiCallResponse? apiResultc4k;
  // Stores action output result for [Backend Call - API (DowellSendEmail)] action in PayLaterButton widget.
  ApiCallResponse? pEmail;
  // Stores action output result for [Backend Call - API (DowellSendEmail)] action in PayLaterButton widget.
  ApiCallResponse? dEmail;
  // Stores action output result for [Backend Call - API (SubscribeToNewsLetter)] action in PayLaterButton widget.
  ApiCallResponse? apiResultc;
  // State field(s) for NewsletterCheckbox widget.
  bool? newsletterCheckboxValue;
  // Stores action output result for [Backend Call - API (MakePayment)] action in contribute widget.
  ApiCallResponse? paymentResults;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    toEmailControllerValidator = _toEmailControllerValidator;
  }

  void dispose() {
    toEmailFocusNode?.dispose();
    toEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
