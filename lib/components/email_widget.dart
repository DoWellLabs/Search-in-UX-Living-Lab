import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_model.dart';
export 'email_model.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget({
    Key? key,
    required this.locations,
    this.query,
    required this.location,
    required this.distances,
    required this.distance,
  }) : super(key: key);

  final List<dynamic>? locations;
  final String? query;
  final String? location;
  final List<String>? distances;
  final double? distance;

  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  late EmailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailModel());

    _model.toEmailController ??= TextEditingController();
    _model.toEmailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return MediaQuery.sizeOf(context).width;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return (MediaQuery.sizeOf(context).width * 0.85);
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return (MediaQuery.sizeOf(context).width * 0.65);
        } else {
          return (MediaQuery.sizeOf(context).width * 0.35);
        }
      }(),
      height: 295.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Container(
                      width: 200.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _model.toEmailController,
                              focusNode: _model.toEmailFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'To Email',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF14181B),
                                    ),
                                hintText: 'Enter your/friends email address',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF14181B),
                                      fontWeight: FontWeight.w300,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                prefixIcon: Icon(
                                  Icons.attach_email_sharp,
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF14181B),
                                  ),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Color(0xFF570861),
                              validator: _model.toEmailControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.sendEmailResult =
                              await DowellSendEmailCall.call(
                            toEmail: _model.toEmailController.text,
                            toName: functions.getNameFromEmail(
                                _model.toEmailController.text),
                            message: functions.formatJsonToEmailBody(
                                widget.locations!.toList(),
                                'The search result for ${widget.query} in ${widget.location} within ${widget.distance?.toString()} meters, ${widget.locations?.length?.toString()}  results found.  Thank you ${_model.toEmailController.text} for using DoWell UX Living Lab. Search results limited to maximum 60.',
                                widget.distances?.toList(),
                                _model.toEmailController.text,
                                widget.query!,
                                widget.location!,
                                widget.distance!.toString()),
                          );
                          _model.sendCopyEmailResult =
                              await DowellSendEmailCall.call(
                            toEmail: 'dowell@dowellresearch.uk',
                            toName: 'Dowell Research',
                            message: functions.formatJsonToEmailBody(
                                widget.locations!.toList(),
                                'The search result for ${widget.query} in ${widget.location} within ${widget.distance?.toString()} meters, ${widget.locations?.length?.toString()}  results found.  Thank you ${_model.toEmailController.text} for using DoWell UX Living Lab. Search results limited to maximum 60.',
                                widget.distances?.toList(),
                                _model.toEmailController.text,
                                widget.query!,
                                widget.location!,
                                widget.distance!.toString()),
                          );
                          if (_model.newsletterCheckboxValue!) {
                            _model.apiResultc4k =
                                await SubscribeToNewsLetterCall.call(
                              subscriberEmail: _model.toEmailController.text,
                            );
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Newsletter Subscription'),
                                  content:
                                      Text(SubscribeToNewsLetterCall.message(
                                    (_model.apiResultc4k?.jsonBody ?? ''),
                                  )!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Email Sent Status'),
                                content: Text(DowellSendEmailCall.message(
                                  (_model.sendEmailResult?.jsonBody ?? ''),
                                )!),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          Navigator.pop(context);

                          setState(() {});
                        },
                        text: 'Send to email',
                        options: FFButtonOptions(
                          width: 160.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                          await actions.downloadCsv(
                            widget.locations!.toList(),
                            widget.distances!.toList(),
                            _model.toEmailController.text,
                            widget.query!,
                            widget.location!,
                            widget.distance!.toString(),
                          );
                          _model.pEmail = await DowellSendEmailCall.call(
                            toEmail: _model.toEmailController.text,
                            toName: functions.getNameFromEmail(
                                _model.toEmailController.text),
                            message:
                                'You have downloaded the search result successfully to ${_model.toEmailController.text} for ${widget.query} in ${widget.location} within ${widget.distance?.toString()} meters, ${widget.locations?.length?.toString()}  results found.  Thank you for using DoWell UX Living Lab. Search results limited to maximum 60.',
                          );
                          _model.dEmail = await DowellSendEmailCall.call(
                            toEmail: 'dowell@dowellresearch.uk',
                            toName: 'Dowell Research',
                            message: functions.formatJsonToEmailBody(
                                widget.locations!.toList(),
                                'You have downloaded the search result successfully to ${_model.toEmailController.text} for ${widget.query} in ${widget.location} within ${widget.distance?.toString()} meters, ${widget.locations?.length?.toString()}  results found.  Thank you for using DoWell UX Living Lab. Search results limited to maximum 60.',
                                widget.distances?.toList(),
                                _model.toEmailController.text,
                                widget.query!,
                                widget.location!,
                                widget.distance!.toString()),
                          );
                          if (_model.newsletterCheckboxValue!) {
                            _model.apiResultc =
                                await SubscribeToNewsLetterCall.call(
                              subscriberEmail: _model.toEmailController.text,
                            );
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Newsletter Subscription'),
                                  content:
                                      Text(SubscribeToNewsLetterCall.message(
                                    (_model.apiResultc4k?.jsonBody ?? ''),
                                  )!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          setState(() {});
                        },
                        text: 'Download',
                        options: FFButtonOptions(
                          width: 170.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: GoogleFonts.getFont(
                            'Poppins',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            height: 1.2,
                          ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor: Color(0xFF57636C),
                        ),
                        child: Checkbox(
                          value: _model.newsletterCheckboxValue ??= false,
                          onChanged: (newValue) async {
                            setState(() =>
                                _model.newsletterCheckboxValue = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: Colors.white,
                        ),
                      ),
                      Text(
                        'Subscribe to Newsletter',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF57636C),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      if (isWeb) {
                        await actions.openUrl(
                          'https://checkout.stripe.com/c/pay/cs_live_a1kzZsDzM3hZvJa3qbUHSGkArXqzbQrdC3Guvz5uGOR4UvJqvFbagQraFh#fidkdWxOYHwnPyd1blppbHNgWjA0S2ZtfXBDZzM1S21VdGdvN2M3XUlBckdJaXA2XGZfV1UwZnc9UW1nS2R8RE1Vb1M9aF9WX0Y3c3ZjRl02U3JWNWIzQ2FISEpENGJDVHVGQ0FvQk1KU1Y8NTVvdmAxcmhWXycpJ3VpbGtuQH11anZgYUxhJz8nPXJINDM9Ylw8ZzFEM1BqMWJsJyknd2BjYHd3YHdKd2xibGsnPydtcXF1dj8qKmFqcmBpaXdgdmBkd2ZtK3BuKid4JSUl',
                        );
                      } else {
                        _model.paymentResults = await MakePaymentCall.call(
                          product: 'Search LivingLab Maps',
                          price: 12,
                          currencyCode: 'INR',
                        );
                        if ((_model.paymentResults?.succeeded ?? true)) {
                          context.pushNamed(
                            'LivingLabWebView',
                            queryParameters: {
                              'url': serializeParam(
                                MakePaymentCall.detailsPageUrl(
                                  (_model.paymentResults?.jsonBody ?? ''),
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                      }

                      Navigator.pop(context);

                      setState(() {});
                    },
                    text: 'Contribute',
                    options: FFButtonOptions(
                      width: 170.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      hoverColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      hoverTextColor: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
