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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homepage_new_copy_model.dart';
export 'homepage_new_copy_model.dart';

class HomepageNewCopyWidget extends StatefulWidget {
  const HomepageNewCopyWidget({Key? key}) : super(key: key);

  @override
  _HomepageNewCopyWidgetState createState() => _HomepageNewCopyWidgetState();
}

class _HomepageNewCopyWidgetState extends State<HomepageNewCopyWidget> {
  late HomepageNewCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageNewCopyModel());

    _model.categoryFieldController ??= TextEditingController();
    _model.categoryFieldFocusNode ??= FocusNode();

    _model.mobileEmailController ??= TextEditingController();
    _model.mobileEmailFocusNode ??= FocusNode();

    _model.categoryFieldDesktopController ??= TextEditingController();
    _model.categoryFieldDesktopFocusNode ??= FocusNode();

    _model.desktopEmailController ??= TextEditingController();
    _model.desktopEmailFocusNode ??= FocusNode();

    _model.categoryFieldTabletController ??= TextEditingController();
    _model.categoryFieldTabletFocusNode ??= FocusNode();

    _model.tabletEmailController ??= TextEditingController();
    _model.tabletEmailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: CountrylistCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final homepageNewCopyCountrylistResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.attach_email_outlined,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 20.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        Text(
                          'Email',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await actions.openUrl(
                          'https://docs.google.com/document/d/18Co8FctBwE_J3UWqMkRlHcs5NwuybSWY/edit?usp=sharing&ouid=105407328130149319692&rtpof=true&sd=true',
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.cookie_outlined,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 20.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Text(
                            'Privacy Policy',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await actions.openUrl(
                          'https://uxlivinglab.org',
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.info_outlined,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 20.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Text(
                            'UX Living Lab',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                        await actions.exitApp();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.logout_rounded,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 20.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Text(
                            'Exit',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Scan_To_Pay.png',
                        width: 200.0,
                        height: 270.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl:
                            'https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fsearch-livinglab.flutterflow.app%2F&labelColor=%23d9e3f0&countColor=%2337d67a&style=flat&labelStyle=upper',
                        width: 150.0,
                        height: 40.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/mobile_1076x723.png',
                              ).image,
                            ),
                          ),
                          child: Stack(
                            children: [
                              if (((_model.countryDropdownMobileValue != null &&
                                          _model.countryDropdownMobileValue !=
                                              '') &&
                                      (_model.locdationDropdownMobileValue !=
                                              null &&
                                          _model.locdationDropdownMobileValue !=
                                              '')) &&
                                  responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.4,
                                  child: custom_widgets.MyMapWidget(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.4,
                                    radius2: valueOrDefault<double>(
                                      _model.sliderMobileValue,
                                      2000.0,
                                    ),
                                    clearmap: FFAppState().refreshed,
                                    iOSGoogleMapsApiKey:
                                        'AIzaSyDEqiaEt34c4HZR1STbcbxuedTMF0qZp_c',
                                    androidGoogleMapsApiKey:
                                        'AIzaSyDEqiaEt34c4HZR1STbcbxuedTMF0qZp_c',
                                    webGoogleMapsApiKey:
                                        'AIzaSyDpGygMEesMI1tucBfXILDD-JiZv54D5Mg',
                                    origin: functions.getLatLngFromCityListJson(
                                        _model.locdationDropdownMobileValue!,
                                        FFAppState().cityList.toList()),
                                    locationList: FFAppState().locationList,
                                    isNewClick: FFAppState().isNewClick,
                                    gotoCoord: FFAppState().gotoCoord,
                                  ),
                                ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.menu_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        desktop: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/1080x1920.png',
                              ).image,
                            ),
                          ),
                          child: Stack(
                            children: [
                              if (((_model.countryDropdownTabletValue != null &&
                                          _model.countryDropdownTabletValue !=
                                              '') &&
                                      (_model.locdationDropdownTabletValue !=
                                              null &&
                                          _model.locdationDropdownTabletValue !=
                                              '')) &&
                                  responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    desktop: false,
                                  ))
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: custom_widgets.MyMapWidget(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    radius2: valueOrDefault<double>(
                                      _model.slideTabletValue,
                                      2000.0,
                                    ),
                                    clearmap: FFAppState().refreshed,
                                    iOSGoogleMapsApiKey:
                                        'AIzaSyDEqiaEt34c4HZR1STbcbxuedTMF0qZp_c',
                                    androidGoogleMapsApiKey:
                                        'AIzaSyDEqiaEt34c4HZR1STbcbxuedTMF0qZp_c',
                                    webGoogleMapsApiKey:
                                        'AIzaSyDpGygMEesMI1tucBfXILDD-JiZv54D5Mg',
                                    origin: functions.getLatLngFromCityListJson(
                                        _model.locdationDropdownTabletValue!,
                                        FFAppState().cityList.toList()),
                                    locationList: FFAppState().locationList,
                                    isNewClick: FFAppState().isNewClick,
                                    gotoCoord: FFAppState().gotoCoord,
                                  ),
                                ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.menu_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'assets/images/1080x1920.png',
                              ).image,
                            ),
                          ),
                          child: Stack(
                            children: [
                              if (((_model.countryDropdownDesktopValue !=
                                              null &&
                                          _model.countryDropdownDesktopValue !=
                                              '') &&
                                      (_model.locdationDropdownDesktopValue !=
                                              null &&
                                          _model.locdationDropdownDesktopValue !=
                                              '')) &&
                                  responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: custom_widgets.MyMapWidget(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    radius2: valueOrDefault<double>(
                                      _model.sliderDesktopValue,
                                      2000.0,
                                    ),
                                    clearmap: FFAppState().refreshed,
                                    iOSGoogleMapsApiKey:
                                        'AIzaSyDEqiaEt34c4HZR1STbcbxuedTMF0qZp_c',
                                    androidGoogleMapsApiKey:
                                        'AIzaSyDEqiaEt34c4HZR1STbcbxuedTMF0qZp_c',
                                    webGoogleMapsApiKey:
                                        'AIzaSyDpGygMEesMI1tucBfXILDD-JiZv54D5Mg',
                                    origin: functions.getLatLngFromCityListJson(
                                        _model.locdationDropdownDesktopValue!,
                                        FFAppState().cityList.toList()),
                                    locationList: FFAppState().locationList,
                                    isNewClick: FFAppState().isNewClick,
                                    gotoCoord: FFAppState().gotoCoord,
                                  ),
                                ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 8.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.menu_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ],
                          ),
                        ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (!FFAppState().refreshed)
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Limited to ${functions.listLength(FFAppState().locationList.toList()).toString()}  Results',
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (FFAppConstants.isvisible)
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.cloud_download_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 24.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {},
                                              ),
                                            if (FFAppConstants.isvisible)
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.refresh,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {},
                                              ),
                                            if (FFAppConstants.isvisible)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.search_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed: () async {},
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 8.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (!FFAppState().refreshed)
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Text(
                                                'Limited to ${functions.listLength(FFAppState().locationList.toList()).toString()}  Results',
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (FFAppConstants.isvisible)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons
                                                        .cloud_download_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed: () async {},
                                                ),
                                              if (FFAppConstants.isvisible)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.refresh,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {},
                                                ),
                                              if (FFAppConstants.isvisible)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.search_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      size: 24.0,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed: () async {},
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 8.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (!FFAppState().refreshed)
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Limited to ${functions.listLength(FFAppState().locationList.toList()).toString()}  Results',
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (FFAppConstants.isvisible)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons
                                                        .cloud_download_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed: () async {},
                                                ),
                                              if (FFAppConstants.isvisible)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.refresh,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      _model
                                                          .categoryFieldDesktopController
                                                          ?.clear();
                                                    });
                                                    setState(() {
                                                      _model.sliderDesktopValue =
                                                          0.0;
                                                    });
                                                    setState(() {
                                                      FFAppState().refreshed =
                                                          true;
                                                    });
                                                  },
                                                ),
                                              if (FFAppConstants.isvisible)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.search_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      size: 24.0,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed: () async {},
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (((getJsonField(
                                                  (_model.getLocationResult
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.succesful_results''',
                                                ) !=
                                                null) &&
                                            (FFAppState().refreshed != true)) &&
                                        responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 329.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final locations = FFAppState()
                                                  .locationList
                                                  .toList();
                                              if (locations.isEmpty) {
                                                return Center(
                                                  child:
                                                      EmptyLocatioListWidget(),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: locations.length,
                                                itemBuilder:
                                                    (context, locationsIndex) {
                                                  final locationsItem =
                                                      locations[locationsIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                    .gotoCoord =
                                                                functions
                                                                    .getLatLngFromFullString(
                                                                        getJsonField(
                                                              locationsItem,
                                                              r'''$.location_coord''',
                                                            ).toString());
                                                            FFAppState()
                                                                    .isNewClick =
                                                                true;
                                                          });
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Container(
                                                            width: 305.0,
                                                            height: 315.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        358.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        if (getJsonField(
                                                                              locationsItem,
                                                                              r'''$.photo_reference''',
                                                                            ) !=
                                                                            'None')
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 700),
                                                                              fadeOutDuration: Duration(milliseconds: 700),
                                                                              imageUrl: 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=358&photo_reference=${getJsonField(
                                                                                locationsItem,
                                                                                r'''$.photo_reference''',
                                                                              ).toString()}&key=AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                                                              width: 358.0,
                                                                              fit: BoxFit.cover,
                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: 358.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            locationsItem,
                                                                            r'''$.place_name''',
                                                                          ).toString().maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future:
                                                                              CalculateDistanceCall.call(
                                                                            origins:
                                                                                GetCoordinatesAPINewCall.originLatLng(
                                                                              (_model.getCordinateResult?.jsonBody ?? ''),
                                                                            ),
                                                                            destinations:
                                                                                getJsonField(
                                                                              locationsItem,
                                                                              r'''$.location_coord''',
                                                                            ).toString(),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return DistancePlaceholderWidget();
                                                                            }
                                                                            final distanceCalculateDistanceResponse =
                                                                                snapshot.data!;
                                                                            return Text(
                                                                              'Driving distance: ${getJsonField(
                                                                                distanceCalculateDistanceResponse.jsonBody,
                                                                                r'''$.rows[:].elements[:].distance.text''',
                                                                              ).toString()}'
                                                                                  .maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.location_on_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.address''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 2,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.globe,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.website''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.phone_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.phone''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().isLoading &&
                                        responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 15.0),
                                        child: Container(
                                          width: 80.0,
                                          height: 80.0,
                                          child: custom_widgets
                                              .LoadingIndicatorBuilder(
                                            width: 80.0,
                                            height: 80.0,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (((getJsonField(
                                                  (_model.getLocationResultTablet
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.succesful_results''',
                                                ) !=
                                                null) &&
                                            (FFAppState().refreshed != true)) &&
                                        responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          desktop: false,
                                        ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 329.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final locations =
                                                  GetNearbyLocationsCall
                                                          .locationList(
                                                        (_model.getLocationResultTablet
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toList() ??
                                                      [];
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: locations.length,
                                                itemBuilder:
                                                    (context, locationsIndex) {
                                                  final locationsItem =
                                                      locations[locationsIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                    .gotoCoord =
                                                                functions
                                                                    .getLatLngFromFullString(
                                                                        getJsonField(
                                                              locationsItem,
                                                              r'''$.location_coord''',
                                                            ).toString());
                                                            FFAppState()
                                                                    .isNewClick =
                                                                true;
                                                          });
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Container(
                                                            width: 305.0,
                                                            height: 315.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        358.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        if (getJsonField(
                                                                              locationsItem,
                                                                              r'''$.photo_reference''',
                                                                            ) !=
                                                                            'None')
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 700),
                                                                              fadeOutDuration: Duration(milliseconds: 700),
                                                                              imageUrl: 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=358&photo_reference=${getJsonField(
                                                                                locationsItem,
                                                                                r'''$.photo_reference''',
                                                                              ).toString()}&key=AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                                                              width: 358.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            locationsItem,
                                                                            r'''$.place_name''',
                                                                          ).toString().maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future:
                                                                              CalculateDistanceCall.call(
                                                                            origins:
                                                                                GetCoordinatesAPINewCall.originLatLng(
                                                                              (_model.getCordinateResultTablet?.jsonBody ?? ''),
                                                                            ),
                                                                            destinations:
                                                                                getJsonField(
                                                                              locationsItem,
                                                                              r'''$.location_coord''',
                                                                            ).toString(),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return DistancePlaceholderWidget();
                                                                            }
                                                                            final distanceCalculateDistanceResponse =
                                                                                snapshot.data!;
                                                                            return Text(
                                                                              'Driving distance: ${getJsonField(
                                                                                distanceCalculateDistanceResponse.jsonBody,
                                                                                r'''$.rows[:].elements[:].distance.text''',
                                                                              ).toString()}'
                                                                                  .maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.location_on_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.address''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 2,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.globe,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.website''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.phone_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.phone''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().isLoading &&
                                        responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          desktop: false,
                                        ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 15.0),
                                        child: Container(
                                          width: 90.0,
                                          height: 90.0,
                                          child: custom_widgets
                                              .LoadingIndicatorBuilder(
                                            width: 90.0,
                                            height: 90.0,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (((getJsonField(
                                                  (_model.getLocationResultDesktop
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.succesful_results''',
                                                ) !=
                                                null) &&
                                            (FFAppState().refreshed != true)) &&
                                        responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 329.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final locations = FFAppState()
                                                  .locationList
                                                  .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: locations.length,
                                                itemBuilder:
                                                    (context, locationsIndex) {
                                                  final locationsItem =
                                                      locations[locationsIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                    .gotoCoord =
                                                                functions
                                                                    .getLatLngFromFullString(
                                                                        getJsonField(
                                                              locationsItem,
                                                              r'''$.location_coord''',
                                                            ).toString());
                                                            FFAppState()
                                                                    .isNewClick =
                                                                true;
                                                          });
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Container(
                                                            width: 305.0,
                                                            height: 315.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        358.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        if (getJsonField(
                                                                              locationsItem,
                                                                              r'''$.photo_reference''',
                                                                            ) !=
                                                                            'None')
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(8.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 700),
                                                                              fadeOutDuration: Duration(milliseconds: 700),
                                                                              imageUrl: 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=358&photo_reference=${getJsonField(
                                                                                locationsItem,
                                                                                r'''$.photo_reference''',
                                                                              ).toString()}&key=AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                                                              width: 358.0,
                                                                              fit: BoxFit.cover,
                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: 358.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            locationsItem,
                                                                            r'''$.place_name''',
                                                                          ).toString().maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future:
                                                                              CalculateDistanceCall.call(
                                                                            origins:
                                                                                GetCoordinatesAPINewCall.originLatLng(
                                                                              (_model.getCordinateResultDesktop?.jsonBody ?? ''),
                                                                            ),
                                                                            destinations:
                                                                                getJsonField(
                                                                              locationsItem,
                                                                              r'''$.location_coord''',
                                                                            ).toString(),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return DistancePlaceholderWidget();
                                                                            }
                                                                            final distanceCalculateDistanceResponse =
                                                                                snapshot.data!;
                                                                            return Text(
                                                                              'Driving distance: ${getJsonField(
                                                                                distanceCalculateDistanceResponse.jsonBody,
                                                                                r'''$.rows[:].elements[:].distance.text''',
                                                                              ).toString()}'
                                                                                  .maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.location_on_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.address''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 2,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.globe,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                locationsItem,
                                                                                r'''$.website''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 26,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.phone_sharp,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 20.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              locationsItem,
                                                                              r'''$.phone''',
                                                                            ).toString().maybeHandleOverflow(
                                                                                  maxChars: 26,
                                                                                  replacement: '…',
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().isLoading &&
                                        responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 15.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          child: custom_widgets
                                              .LoadingIndicatorBuilder(
                                            width: 100.0,
                                            height: 100.0,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE9E9EB),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .countryDropdownMobileValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: (getJsonField(
                                                  homepageNewCopyCountrylistResponse
                                                      .jsonBody,
                                                  r'''$.data[:].countries''',
                                                  true,
                                                ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .countryDropdownMobileValue =
                                                      val);
                                                  if (_model.countryDropdownMobileValue !=
                                                          null &&
                                                      _model.countryDropdownMobileValue !=
                                                          '') {
                                                    setState(() {
                                                      _model
                                                          .locdationDropdownMobileValueController
                                                          ?.reset();
                                                      _model
                                                          .locdationDropdownTabletValueController
                                                          ?.reset();
                                                      _model
                                                          .locdationDropdownDesktopValueController
                                                          ?.reset();
                                                    });
                                                    setState(() {
                                                      FFAppState()
                                                              .isGettingCities =
                                                          true;
                                                      FFAppState().cityList =
                                                          [];
                                                      FFAppState()
                                                          .CityNameList = [];
                                                      FFAppState().refreshed =
                                                          false;
                                                    });
                                                    _model.getCitiesResponse =
                                                        await GetCitiesCall
                                                            .call(
                                                      country: _model
                                                          .countryDropdownMobileValue,
                                                    );
                                                    if ((_model
                                                            .getCitiesResponse
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        FFAppState()
                                                                .CityNameList =
                                                            GetCitiesCall
                                                                    .citiesName(
                                                          (_model.getCitiesResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .toList()
                                                                .cast<String>();
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Unable to get cities.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }

                                                    setState(() {
                                                      FFAppState()
                                                              .isGettingCities =
                                                          false;
                                                      FFAppState().cityList =
                                                          GetCitiesCall
                                                                  .cityList(
                                                        (_model.getCitiesResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                    });
                                                  }

                                                  setState(() {});
                                                },
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 50.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                          lineHeight: 1.2,
                                                        ),
                                                hintText: 'Country',
                                                searchHintText:
                                                    'Search for country',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                disabled:
                                                    FFAppState().isLoading,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              ),
                                              if (FFAppState()
                                                      .isGettingCities ==
                                                  false)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .locdationDropdownMobileValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: FFAppState()
                                                        .CityNameList,
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .locdationDropdownMobileValue =
                                                          val);
                                                      setState(() {
                                                        FFAppState().gotoCoord =
                                                            functions.getLatLngFromCityListJson(
                                                                _model
                                                                    .locdationDropdownMobileValue!,
                                                                FFAppState()
                                                                    .cityList
                                                                    .toList());
                                                        FFAppState()
                                                            .isNewClick = true;
                                                      });
                                                    },
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 50.0,
                                                    searchHintTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                            ),
                                                    searchTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                          lineHeight: 1.2,
                                                        ),
                                                    hintText: 'Location',
                                                    searchHintText:
                                                        'Search for location',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    disabled:
                                                        FFAppState().isLoading,
                                                    isSearchable: true,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .isGettingCities &&
                                                  responsiveVisibility(
                                                    context: context,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 15.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: custom_widgets
                                                        .LoadingIndicatorBuilder(
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .categoryFieldController,
                                                  focusNode: _model
                                                      .categoryFieldFocusNode,
                                                  autofocus: true,
                                                  readOnly:
                                                      FFAppState().isLoading,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Category',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                                    alignLabelWithHint: false,
                                                    hintText:
                                                        'Enter prefered category  e.g Park',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  validator: _model
                                                      .categoryFieldControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        'Distance from centre:',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14.0,
                                                            ),
                                                      ),
                                                    ),
                                                    if (_model
                                                            .sliderMobileValue !=
                                                        null)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions
                                                                    .formatDistanceinKMandMiles(
                                                                        _model
                                                                            .sliderMobileValue),
                                                                '10',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: SliderTheme(
                                                    data: SliderThemeData(
                                                      showValueIndicator:
                                                          ShowValueIndicator
                                                              .always,
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Slider(
                                                        activeColor:
                                                            Color(0xFF21633D),
                                                        inactiveColor:
                                                            Colors.white,
                                                        min: 0.0,
                                                        max: 10000.0,
                                                        value: _model
                                                                .sliderMobileValue ??=
                                                            0.0,
                                                        label: _model
                                                            .sliderMobileValue
                                                            .toString(),
                                                        onChanged:
                                                            FFAppState()
                                                                    .isLoading
                                                                ? null
                                                                : (newValue) {
                                                                    newValue = double.parse(
                                                                        newValue
                                                                            .toStringAsFixed(6));
                                                                    setState(() =>
                                                                        _model.sliderMobileValue =
                                                                            newValue);
                                                                  },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Form(
                                                key: _model.formKey2,
                                                autovalidateMode:
                                                    AutovalidateMode.always,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .mobileEmailController,
                                                    focusNode: _model
                                                        .mobileEmailFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.mobileEmailController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () async {
                                                        if (_model.formKey2
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey2
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        _model.apiResultmar =
                                                            await UserEmailInfoCall
                                                                .call(
                                                          email: _model
                                                              .mobileEmailController
                                                              .text,
                                                        );
                                                        if ((_model.apiResultmar
                                                                ?.succeeded ??
                                                            true)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .occurences =
                                                                getJsonField(
                                                              (_model.apiResultmar
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.occurrences''',
                                                            );
                                                          });
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                .occurences = 0;
                                                          });
                                                        }

                                                        setState(() {});
                                                      },
                                                    ),
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintText: 'Enter Email',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: _model
                                                        .mobileEmailControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            scaffoldKey
                                                                .currentState!
                                                                .openDrawer();
                                                          },
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFE9E9EB),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.menu,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Menu',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if ((getJsonField(
                                                                        (_model.getLocationResult?.jsonBody ??
                                                                            ''),
                                                                        r'''$.succesful_results''',
                                                                      ) !=
                                                                      null) &&
                                                                  (FFAppState()
                                                                          .refreshed !=
                                                                      true)) {
                                                                _model.lN25CopyMobile =
                                                                    await CalculateDistanceCall
                                                                        .call(
                                                                  origins:
                                                                      GetCoordinatesAPINewCall
                                                                          .originLatLng(
                                                                    (_model.getCordinateResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  destinations: functions.joinCoords(functions
                                                                      .sublist(
                                                                          25,
                                                                          50,
                                                                          GetNearbyLocationsCall.coordinates(
                                                                            (_model.getLocationResult?.jsonBody ??
                                                                                ''),
                                                                          )!
                                                                              .toList())
                                                                      .toList()),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                _model.lL25CopyMobile =
                                                                    await CalculateDistanceCall
                                                                        .call(
                                                                  origins:
                                                                      GetCoordinatesAPINewCall
                                                                          .originLatLng(
                                                                    (_model.getCordinateResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  destinations: functions.joinCoords(functions
                                                                      .sublist(
                                                                          25,
                                                                          50,
                                                                          GetNearbyLocationsCall.coordinates(
                                                                            (_model.getLocationResult?.jsonBody ??
                                                                                ''),
                                                                          )!
                                                                              .toList())
                                                                      .toList()),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            EmailWidget(
                                                                          locations:
                                                                              FFAppState().locationList,
                                                                          query: _model
                                                                              .categoryFieldController
                                                                              .text,
                                                                          location:
                                                                              _model.locdationDropdownMobileValue!,
                                                                          distances: functions.joinLists(
                                                                              List.generate(
                                                                                  random_data.randomInteger(0, 0),
                                                                                  (index) => random_data.randomString(
                                                                                        0,
                                                                                        0,
                                                                                        true,
                                                                                        false,
                                                                                        false,
                                                                                      )).toList(),
                                                                              CalculateDistanceCall.distance(
                                                                                (_model.lN25CopyMobile?.jsonBody ?? ''),
                                                                              )!
                                                                                  .toList(),
                                                                              CalculateDistanceCall.distance(
                                                                                (_model.lL25CopyMobile?.jsonBody ?? ''),
                                                                              )!
                                                                                  .toList())!,
                                                                          distance:
                                                                              _model.sliderMobileValue!,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'No content to download, submit location query then try again.',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                            },
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFE9E9EB),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .cloud_download_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Download',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model
                                                                  .locdationDropdownMobileValueController
                                                                  ?.reset();
                                                              _model
                                                                  .countryDropdownMobileValueController
                                                                  ?.reset();
                                                            });
                                                            setState(() {
                                                              _model
                                                                  .categoryFieldController
                                                                  ?.clear();
                                                            });
                                                            setState(() {
                                                              _model.sliderMobileValue =
                                                                  0.0;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                      .refreshed =
                                                                  true;
                                                              FFAppState()
                                                                  .CityNameList = [];
                                                              FFAppState()
                                                                  .locationList = [];
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFE9E9EB),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .refresh_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Refresh',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if ((FFAppState()
                                                                    .occurences >=
                                                                0) &&
                                                            (FFAppState()
                                                                    .occurences <=
                                                                6))
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if ((_model.countryDropdownMobileValue != null && _model.countryDropdownMobileValue != '') &&
                                                                  (_model.locdationDropdownMobileValue !=
                                                                          null &&
                                                                      _model.locdationDropdownMobileValue !=
                                                                          '') &&
                                                                  ((_model.categoryFieldController.text !=
                                                                              null &&
                                                                          _model.categoryFieldController.text !=
                                                                              '') &&
                                                                      (_model.sliderMobileValue !=
                                                                          0.0))) {
                                                                if (_model.formKey2
                                                                            .currentState ==
                                                                        null ||
                                                                    !_model
                                                                        .formKey2
                                                                        .currentState!
                                                                        .validate()) {
                                                                  return;
                                                                }
                                                                setState(() {
                                                                  FFAppState()
                                                                          .isLoading =
                                                                      true;
                                                                });
                                                                setState(() {
                                                                  FFAppState()
                                                                          .refreshed =
                                                                      true;
                                                                  FFAppState()
                                                                          .originLatLng =
                                                                      null;
                                                                  FFAppState()
                                                                      .locationList = [];
                                                                });
                                                                _model.userInfoResonseMobile =
                                                                    await UserEmailInfoCall
                                                                        .call(
                                                                  email: _model
                                                                      .mobileEmailController
                                                                      .text,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .userInfoResonseMobile
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .occurences =
                                                                        getJsonField(
                                                                      (_model.userInfoResonseMobile
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.occurrences''',
                                                                    );
                                                                  });
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        FFAppState()
                                                                            .occurences
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  if (FFAppState()
                                                                          .occurences ==
                                                                      0) {
                                                                    _model.apiResultzun =
                                                                        await RegisterAnUserCall
                                                                            .call(
                                                                      email: _model
                                                                          .mobileEmailController
                                                                          .text,
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model
                                                                            .apiResultzun
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            (_model.apiResultzun?.bodyText ??
                                                                                ''),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Registration Failed',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    }
                                                                  }
                                                                  _model.getCordinateResult =
                                                                      await GetCoordinatesAPINewCall
                                                                          .call(
                                                                    country: _model
                                                                        .countryDropdownMobileValue,
                                                                    city: _model
                                                                        .locdationDropdownMobileValue,
                                                                    query: _model
                                                                        .categoryFieldController
                                                                        .text,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .occurences =
                                                                        FFAppState().occurences +
                                                                            1;
                                                                  });
                                                                  _model.updateUserInfoMobile =
                                                                      await ExperiencedServiceUserDetailsCall
                                                                          .call(
                                                                    email: _model
                                                                        .mobileEmailController
                                                                        .text,
                                                                    occurrences:
                                                                        FFAppState()
                                                                            .occurences,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .updateUserInfoMobile
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.updateUserInfoMobile?.bodyText ??
                                                                              ''),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'updating user usage Failed',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }

                                                                  if ((getJsonField(
                                                                            (_model.getCordinateResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.data''',
                                                                          ) !=
                                                                          null) &&
                                                                      (_model.sliderMobileValue !=
                                                                          null)) {
                                                                    _model.nearbyLocationsIdResult =
                                                                        await GetNearbyLocationsIdCall
                                                                            .call(
                                                                      radius1:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        random_data.randomInteger(
                                                                            0,
                                                                            0),
                                                                        0,
                                                                      ),
                                                                      radius2: functions.toInt(_model
                                                                          .sliderMobileValue!
                                                                          .toString()),
                                                                      centerLon:
                                                                          GetCoordinatesAPINewCall
                                                                              .longitude(
                                                                        (_model.getCordinateResult?.jsonBody ??
                                                                            ''),
                                                                      )?.toString(),
                                                                      queryString: _model
                                                                          .categoryFieldController
                                                                          .text,
                                                                      centerLat:
                                                                          GetCoordinatesAPINewCall
                                                                              .latitude(
                                                                        (_model.getCordinateResult?.jsonBody ??
                                                                            ''),
                                                                      )?.toString(),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model
                                                                            .nearbyLocationsIdResult
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.getLocationResult =
                                                                          await GetNearbyLocationsCall
                                                                              .call(
                                                                        placeIdsJson:
                                                                            getJsonField(
                                                                          (_model.nearbyLocationsIdResult?.jsonBody ??
                                                                              ''),
                                                                          r'''$.place_id_list''',
                                                                        ),
                                                                        centerCoord:
                                                                            GetCoordinatesAPINewCall.originLatLng(
                                                                          (_model.getCordinateResult?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model
                                                                              .getLocationResult
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        if (GetNearbyLocationsCall.locationList(
                                                                              (_model.getLocationResult?.jsonBody ?? ''),
                                                                            )?.length !=
                                                                            0) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Items ready for download!',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        }
                                                                        _model.refineResult =
                                                                            await actions.refineResult(
                                                                          GetNearbyLocationsCall.locationList(
                                                                            (_model.getLocationResult?.jsonBody ??
                                                                                ''),
                                                                          )!
                                                                              .toList(),
                                                                          _model
                                                                              .sliderMobileValue!,
                                                                          0.0,
                                                                          functions.getLatLng(
                                                                              GetCoordinatesAPINewCall.latitude(
                                                                                (_model.getCordinateResult?.jsonBody ?? ''),
                                                                              )!
                                                                                  .toString(),
                                                                              GetCoordinatesAPINewCall.longitude(
                                                                                (_model.getCordinateResult?.jsonBody ?? ''),
                                                                              )!
                                                                                  .toString()),
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        setState(
                                                                            () {
                                                                          FFAppState().isLoading =
                                                                              false;
                                                                          FFAppState().locationList = _model
                                                                              .refineResult!
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                          FFAppState().originLatLng = functions.getLatLng(
                                                                              GetCoordinatesAPINewCall.latitude(
                                                                                (_model.getCordinateResult?.jsonBody ?? ''),
                                                                              )!
                                                                                  .toString(),
                                                                              GetCoordinatesAPINewCall.longitude(
                                                                                (_model.getCordinateResult?.jsonBody ?? ''),
                                                                              )!
                                                                                  .toString());
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          FFAppState().refreshed =
                                                                              false;
                                                                        });
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Search results here',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                        _model.apiResultq0s =
                                                                            await ExperiencedUserDataBaseCall.call(
                                                                          email: _model
                                                                              .mobileEmailController
                                                                              .text,
                                                                          content:
                                                                              _model.countryDropdownMobileValue,
                                                                          title: _model
                                                                              .categoryFieldController
                                                                              .text,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if ((_model.apiResultq0s?.succeeded ??
                                                                            true)) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                (_model.apiResultq0s?.bodyText ?? ''),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                (_model.apiResultq0s?.bodyText ?? ''),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        }

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Message'),
                                                                              content: Text('Failed to get nearby locations,try again.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Dismiss'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          FFAppState().isLoading =
                                                                              false;
                                                                        });
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                    } else {
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Nearby  location search failed'),
                                                                          content:
                                                                              Text('Could not get location coordinates, try again'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .isLoading =
                                                                          false;
                                                                    });
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        (_model.userInfoResonseMobile?.bodyText ??
                                                                            ''),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Please set the  country, location and  category with define distance before searching',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                            },
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFE9E9EB),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .search_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Search',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (FFAppState().occurences >=
                                                      3)
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await launchURL(
                                                            'https://buy.stripe.com/8wMcNf4MKcp55tm6oC');
                                                      },
                                                      child: Container(
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFE9E9EB),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .handHoldingUsd,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Contribute',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE9E9EB),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 0.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .countryDropdownDesktopValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: (getJsonField(
                                                  homepageNewCopyCountrylistResponse
                                                      .jsonBody,
                                                  r'''$.data[:].countries''',
                                                  true,
                                                ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .countryDropdownDesktopValue =
                                                      val);
                                                  if (_model.countryDropdownDesktopValue !=
                                                          null &&
                                                      _model.countryDropdownDesktopValue !=
                                                          '') {
                                                    setState(() {
                                                      _model
                                                          .locdationDropdownTabletValueController
                                                          ?.reset();
                                                      _model
                                                          .locdationDropdownDesktopValueController
                                                          ?.reset();
                                                      _model
                                                          .locdationDropdownMobileValueController
                                                          ?.reset();
                                                    });
                                                    setState(() {
                                                      FFAppState()
                                                              .isGettingCities =
                                                          true;
                                                    });
                                                    _model.getCitiesResponseDesktop =
                                                        await GetCitiesCall
                                                            .call(
                                                      country: _model
                                                          .countryDropdownDesktopValue,
                                                    );
                                                    if ((_model
                                                            .getCitiesResponseDesktop
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        FFAppState()
                                                                .CityNameList =
                                                            GetCitiesCall
                                                                    .citiesName(
                                                          (_model.getCitiesResponseDesktop
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .toList()
                                                                .cast<String>();
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Unable to get cities.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }

                                                    setState(() {
                                                      FFAppState()
                                                              .isGettingCities =
                                                          false;
                                                      FFAppState().cityList =
                                                          GetCitiesCall
                                                                  .cityList(
                                                        (_model.getCitiesResponseDesktop
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                    });
                                                  }

                                                  setState(() {});
                                                },
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 50.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                          lineHeight: 1.2,
                                                        ),
                                                hintText: 'Country',
                                                searchHintText:
                                                    'Search for country',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                            if (FFAppState().isGettingCities ==
                                                false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .locdationDropdownDesktopValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  options:
                                                      FFAppState().CityNameList,
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .locdationDropdownDesktopValue =
                                                        val);
                                                    setState(() {
                                                      FFAppState().gotoCoord = functions
                                                          .getLatLngFromCityListJson(
                                                              _model
                                                                  .locdationDropdownDesktopValue!,
                                                              FFAppState()
                                                                  .cityList
                                                                  .toList());
                                                      FFAppState().isNewClick =
                                                          true;
                                                    });
                                                  },
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 50.0,
                                                  searchHintTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16.0,
                                                          ),
                                                  searchTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        lineHeight: 1.2,
                                                      ),
                                                  hintText: 'Location',
                                                  searchHintText:
                                                      'Search for location',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  borderWidth: 2.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isSearchable: true,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            if (FFAppState().isGettingCities &&
                                                responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 15.0),
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: custom_widgets
                                                      .LoadingIndicatorBuilder(
                                                    width: 50.0,
                                                    height: 50.0,
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .categoryFieldDesktopController,
                                                focusNode: _model
                                                    .categoryFieldDesktopFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Category',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                      ),
                                                  alignLabelWithHint: false,
                                                  hintText:
                                                      'Enter prefered category  e.g Park',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .categoryFieldDesktopControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Distance from centre:',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model
                                                          .sliderDesktopValue !=
                                                      null)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .formatDistanceinKMandMiles(
                                                                    _model
                                                                        .sliderDesktopValue),
                                                            '10',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            if (_model.locdationDropdownDesktopValue !=
                                                    null &&
                                                _model.locdationDropdownDesktopValue !=
                                                    '')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: SliderTheme(
                                                    data: SliderThemeData(
                                                      showValueIndicator:
                                                          ShowValueIndicator
                                                              .always,
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Slider(
                                                        activeColor:
                                                            Color(0xFF21633D),
                                                        inactiveColor:
                                                            Colors.white,
                                                        min: 0.0,
                                                        max: 10000.0,
                                                        value: _model
                                                                .sliderDesktopValue ??=
                                                            0.0,
                                                        label: _model
                                                            .sliderDesktopValue
                                                            .toString(),
                                                        onChanged: (newValue) {
                                                          newValue = double
                                                              .parse(newValue
                                                                  .toStringAsFixed(
                                                                      6));
                                                          setState(() => _model
                                                                  .sliderDesktopValue =
                                                              newValue);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Form(
                                              key: _model.formKey1,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .desktopEmailController,
                                                  focusNode: _model
                                                      .desktopEmailFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.desktopEmailController',
                                                    Duration(milliseconds: 100),
                                                    () async {
                                                      if (_model.formKey1
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey1
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      _model.apiResultw1b =
                                                          await UserEmailInfoCall
                                                              .call(
                                                        email: _model
                                                            .desktopEmailController
                                                            .text,
                                                      );
                                                      if ((_model.apiResultw1b
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          FFAppState()
                                                                  .occurences =
                                                              getJsonField(
                                                            (_model.apiResultw1b
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.occurrences''',
                                                          );
                                                        });
                                                      } else {
                                                        setState(() {
                                                          FFAppState()
                                                              .occurences = 0;
                                                        });
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintText: 'Enter Email',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  validator: _model
                                                      .desktopEmailControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      scaffoldKey.currentState!
                                                          .openDrawer();
                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9EB),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.menu,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 28.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Menu',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        20.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if ((getJsonField(
                                                                  (_model.getLocationResultDesktop
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.succesful_results''',
                                                                ) !=
                                                                null) &&
                                                            (FFAppState()
                                                                    .refreshed !=
                                                                true)) {
                                                          _model.lN25CopyDesktop =
                                                              await CalculateDistanceCall
                                                                  .call(
                                                            origins:
                                                                GetCoordinatesAPINewCall
                                                                    .originLatLng(
                                                              (_model.getCordinateResultDesktop
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            destinations: functions
                                                                .joinCoords(functions
                                                                    .sublist(
                                                                        0,
                                                                        25,
                                                                        GetNearbyLocationsCall.coordinates(
                                                                          (_model.getLocationResultDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toList())
                                                                    .toList()),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          _model.lL25CopyDesktop =
                                                              await CalculateDistanceCall
                                                                  .call(
                                                            origins:
                                                                GetCoordinatesAPINewCall
                                                                    .originLatLng(
                                                              (_model.getCordinateResultDesktop
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            destinations: functions
                                                                .joinCoords(functions
                                                                    .sublist(
                                                                        25,
                                                                        50,
                                                                        GetNearbyLocationsCall.coordinates(
                                                                          (_model.getLocationResultDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toList())
                                                                    .toList()),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      EmailWidget(
                                                                    locations:
                                                                        FFAppState()
                                                                            .locationList,
                                                                    query: _model
                                                                        .categoryFieldDesktopController
                                                                        .text,
                                                                    location: _model
                                                                        .locdationDropdownDesktopValue!,
                                                                    distances: functions.joinLists(
                                                                        List.generate(random_data.randomInteger(0, 0), (index) => random_data.randomName(true, false)).toList(),
                                                                        CalculateDistanceCall.distance(
                                                                          (_model.lN25CopyDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toList(),
                                                                        CalculateDistanceCall.distance(
                                                                          (_model.lL25CopyDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toList())!,
                                                                    distance: _model
                                                                        .sliderDesktopValue!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'No content to download, submit location query then try again.',
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFE9E9EB),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .cloud_download_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Download',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          20.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model
                                                            .countryDropdownDesktopValueController
                                                            ?.reset();
                                                        _model
                                                            .locdationDropdownDesktopValueController
                                                            ?.reset();
                                                      });
                                                      setState(() {
                                                        _model
                                                            .categoryFieldDesktopController
                                                            ?.clear();
                                                      });
                                                      setState(() {
                                                        _model.sliderDesktopValue =
                                                            0.0;
                                                      });
                                                      setState(() {
                                                        FFAppState().refreshed =
                                                            true;
                                                        FFAppState()
                                                            .CityNameList = [];
                                                        FFAppState()
                                                            .locationList = [];
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9EB),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .refresh_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 28.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Refresh',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        20.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (FFAppState().occurences <=
                                                      6)
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if ((_model.countryDropdownDesktopValue != null && _model.countryDropdownDesktopValue != '') &&
                                                            (_model.locdationDropdownDesktopValue !=
                                                                    null &&
                                                                _model.locdationDropdownDesktopValue !=
                                                                    '') &&
                                                            ((_model.categoryFieldDesktopController
                                                                            .text !=
                                                                        null &&
                                                                    _model.categoryFieldDesktopController
                                                                            .text !=
                                                                        '') &&
                                                                (_model.sliderDesktopValue !=
                                                                    0.0))) {
                                                          if (_model.formKey1
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey1
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          setState(() {
                                                            FFAppState()
                                                                    .isLoading =
                                                                true;
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                    .refreshed =
                                                                true;
                                                            FFAppState()
                                                                    .originLatLng =
                                                                null;
                                                            FFAppState()
                                                                .locationList = [];
                                                          });
                                                          _model.userInfoResponseDesktop =
                                                              await UserEmailInfoCall
                                                                  .call(
                                                            email: _model
                                                                .desktopEmailController
                                                                .text,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .userInfoResponseDesktop
                                                                  ?.succeeded ??
                                                              true)) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .occurences =
                                                                  getJsonField(
                                                                (_model.userInfoResponseDesktop
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.occurrences''',
                                                              );
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  FFAppState()
                                                                      .occurences
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            if (FFAppState()
                                                                    .occurences ==
                                                                0) {
                                                              _model.apiResult7af =
                                                                  await RegisterAnUserCall
                                                                      .call(
                                                                email: _model
                                                                    .desktopEmailController
                                                                    .text,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .apiResult7af
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      (_model.apiResult7af
                                                                              ?.bodyText ??
                                                                          ''),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Registration Failed',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                            setState(() {
                                                              FFAppState()
                                                                      .occurences =
                                                                  FFAppState()
                                                                          .occurences +
                                                                      1;
                                                            });
                                                            _model.updateUserUsageDesktop =
                                                                await UpdateUserUsageCall
                                                                    .call(
                                                              email: FFAppState()
                                                                  .occurences
                                                                  .toString(),
                                                              occurrences:
                                                                  FFAppState()
                                                                      .occurences,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .updateUserUsageDesktop
                                                                    ?.succeeded ??
                                                                true)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (_model.updateUserUsageDesktop
                                                                            ?.bodyText ??
                                                                        ''),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Update Failed',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            }

                                                            _model.getCordinateResultDesktop =
                                                                await GetCoordinatesAPINewCall
                                                                    .call(
                                                              country: functions
                                                                  .getcountry(_model
                                                                      .countryDropdownDesktopValue),
                                                              city: functions
                                                                  .getCity(_model
                                                                      .locdationDropdownDesktopValue),
                                                              query: _model
                                                                  .categoryFieldDesktopController
                                                                  .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((getJsonField(
                                                                      (_model.getCordinateResultDesktop
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data''',
                                                                    ) !=
                                                                    null) &&
                                                                (_model.sliderDesktopValue !=
                                                                    null)) {
                                                              _model.nearbyLocationsIdDesktop =
                                                                  await GetNearbyLocationsIdCall
                                                                      .call(
                                                                radius1:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  random_data
                                                                      .randomInteger(
                                                                          0, 0),
                                                                  0,
                                                                ),
                                                                radius2: functions
                                                                    .toInt(_model
                                                                        .sliderDesktopValue!
                                                                        .toString()),
                                                                centerLon:
                                                                    GetCoordinatesAPINewCall
                                                                        .longitude(
                                                                  (_model.getCordinateResultDesktop
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toString(),
                                                                queryString: _model
                                                                    .categoryFieldDesktopController
                                                                    .text,
                                                                centerLat:
                                                                    GetCoordinatesAPINewCall
                                                                        .latitude(
                                                                  (_model.getCordinateResultDesktop
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toString(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .nearbyLocationsIdDesktop
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.getLocationResultDesktop =
                                                                    await GetNearbyLocationsCall
                                                                        .call(
                                                                  placeIdsJson:
                                                                      getJsonField(
                                                                    (_model.nearbyLocationsIdDesktop
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.place_id_list''',
                                                                  ),
                                                                  centerCoord:
                                                                      GetCoordinatesAPINewCall
                                                                          .originLatLng(
                                                                    (_model.getCordinateResultDesktop
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .getLocationResultDesktop
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  if (!functions
                                                                      .isListEmpty(
                                                                          GetNearbyLocationsCall.locationList(
                                                                    (_model.getLocationResultDesktop
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                              .toList())) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Items ready for download!',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }
                                                                  _model.refineResultDesktop =
                                                                      await actions
                                                                          .refineResult(
                                                                    GetNearbyLocationsCall
                                                                            .locationList(
                                                                      (_model.getLocationResultDesktop
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                        .toList(),
                                                                    _model
                                                                        .sliderDesktopValue!,
                                                                    0.0,
                                                                    functions.getLatLng(
                                                                        GetCoordinatesAPINewCall.latitude(
                                                                          (_model.getCordinateResultDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString(),
                                                                        GetCoordinatesAPINewCall.longitude(
                                                                          (_model.getCordinateResultDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString()),
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .isLoading =
                                                                        false;
                                                                    FFAppState().locationList = _model
                                                                        .refineResultDesktop!
                                                                        .toList()
                                                                        .cast<
                                                                            dynamic>();
                                                                    FFAppState().originLatLng = functions.getLatLng(
                                                                        GetCoordinatesAPINewCall.latitude(
                                                                          (_model.getCordinateResultDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString(),
                                                                        GetCoordinatesAPINewCall.longitude(
                                                                          (_model.getCordinateResultDesktop?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString());
                                                                  });
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .refreshed =
                                                                        false;
                                                                  });
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'search results here',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  _model.userDetailUpdatedDesktop =
                                                                      await ExperiencedUserDataBaseCall
                                                                          .call(
                                                                    email: _model
                                                                        .desktopEmailController
                                                                        .text,
                                                                    content: _model
                                                                        .countryDropdownDesktopValue,
                                                                    title: _model
                                                                        .categoryFieldDesktopController
                                                                        .text,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .userDetailUpdatedDesktop
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.userDetailUpdatedDesktop?.bodyText ??
                                                                              ''),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.userDetailUpdatedDesktop?.bodyText ??
                                                                              ''),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Nearby search failed'),
                                                                        content:
                                                                            Text('Failed to get nearby locations,try again.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Dismiss'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Failed'),
                                                                    content: Text(
                                                                        'Could not get location coordinates, please ensure that the slider is set'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  (_model.userInfoResponseDesktop
                                                                          ?.bodyText ??
                                                                      ''),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Please set the  country, location and  category with define distance before searching',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFE9E9EB),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .search_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Search',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          20.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  if (FFAppState().occurences >=
                                                      3)
                                                    Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9EB),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .handHoldingUsd,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 28.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Contribute',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        20.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 5.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE9E9EB),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .countryDropdownTabletValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: (getJsonField(
                                                homepageNewCopyCountrylistResponse
                                                    .jsonBody,
                                                r'''$.data[:].countries''',
                                                true,
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()!,
                                              onChanged: (val) async {
                                                setState(() => _model
                                                        .countryDropdownTabletValue =
                                                    val);
                                                if (_model.countryDropdownTabletValue !=
                                                        null &&
                                                    _model.countryDropdownTabletValue !=
                                                        '') {
                                                  setState(() {
                                                    _model
                                                        .locdationDropdownTabletValueController
                                                        ?.reset();
                                                    _model
                                                        .locdationDropdownDesktopValueController
                                                        ?.reset();
                                                    _model
                                                        .locdationDropdownMobileValueController
                                                        ?.reset();
                                                  });
                                                  setState(() {
                                                    FFAppState()
                                                        .isGettingCities = true;
                                                  });
                                                  _model.getCitiesResponseTablet =
                                                      await GetCitiesCall.call(
                                                    country: _model
                                                        .countryDropdownTabletValue,
                                                  );
                                                  if ((_model
                                                          .getCitiesResponseTablet
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      FFAppState()
                                                              .CityNameList =
                                                          GetCitiesCall
                                                                  .citiesName(
                                                        (_model.getCitiesResponseTablet
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                              .toList()
                                                              .cast<String>();
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Unable to get cities.',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {
                                                    FFAppState()
                                                            .isGettingCities =
                                                        false;
                                                    FFAppState().cityList =
                                                        GetCitiesCall.cityList(
                                                      (_model.getCitiesResponseTablet
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<dynamic>();
                                                  });
                                                }

                                                setState(() {});
                                              },
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 42.0,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        lineHeight: 1.2,
                                                      ),
                                              hintText: 'Country',
                                              searchHintText:
                                                  'Search for country',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                          if (!FFAppState().isGettingCities)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 0.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .locdationDropdownTabletValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options:
                                                    FFAppState().CityNameList,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .locdationDropdownTabletValue =
                                                      val);
                                                  setState(() {
                                                    FFAppState().isNewClick =
                                                        true;
                                                    FFAppState().gotoCoord = functions
                                                        .getLatLngFromCityListJson(
                                                            _model
                                                                .locdationDropdownTabletValue!,
                                                            FFAppState()
                                                                .cityList
                                                                .toList());
                                                  });
                                                },
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 42.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                          lineHeight: 1.2,
                                                        ),
                                                hintText: 'Location',
                                                searchHintText:
                                                    'Search for location',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          if (FFAppState().isGettingCities &&
                                              responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                desktop: false,
                                              ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                child: custom_widgets
                                                    .LoadingIndicatorBuilder(
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .categoryFieldTabletController,
                                              focusNode: _model
                                                  .categoryFieldTabletFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Category',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                                alignLabelWithHint: false,
                                                hintText:
                                                    'Enter prefered category  e.g Park',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent2,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            0.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .categoryFieldTabletControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Distance from centre:',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.slideTabletValue !=
                                                    null)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .formatDistanceinKMandMiles(
                                                                  _model
                                                                      .slideTabletValue),
                                                          '10',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.locdationDropdownTabletValue !=
                                                  null &&
                                              _model.locdationDropdownTabletValue !=
                                                  '')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: SliderTheme(
                                                  data: SliderThemeData(
                                                    showValueIndicator:
                                                        ShowValueIndicator
                                                            .always,
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: Slider(
                                                      activeColor:
                                                          Color(0xFF21633D),
                                                      inactiveColor:
                                                          Colors.white,
                                                      min: 0.0,
                                                      max: 10000.0,
                                                      value: _model
                                                              .slideTabletValue ??=
                                                          0.0,
                                                      label: _model
                                                          .slideTabletValue
                                                          .toString(),
                                                      onChanged: (newValue) {
                                                        newValue = double.parse(
                                                            newValue
                                                                .toStringAsFixed(
                                                                    6));
                                                        setState(() => _model
                                                                .slideTabletValue =
                                                            newValue);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Form(
                                            key: _model.formKey3,
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .tabletEmailController,
                                                focusNode:
                                                    _model.tabletEmailFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.tabletEmailController',
                                                  Duration(milliseconds: 100),
                                                  () async {
                                                    if (_model.formKey3
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey3
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    _model.apiResultc9c =
                                                        await UserEmailInfoCall
                                                            .call(
                                                      email: _model
                                                          .tabletEmailController
                                                          .text,
                                                    );
                                                    if ((_model.apiResultc9c
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        FFAppState()
                                                                .occurences =
                                                            getJsonField(
                                                          (_model.apiResultc9c
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.occurrences''',
                                                        );
                                                      });
                                                    } else {
                                                      setState(() {
                                                        FFAppState()
                                                            .occurences = 0;
                                                      });
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintText: 'Enter Email',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: _model
                                                    .tabletEmailControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 8.0, 5.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    scaffoldKey.currentState!
                                                        .openDrawer();
                                                  },
                                                  child: Container(
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFE9E9EB),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.menu,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Menu',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      if ((getJsonField(
                                                                (_model.getLocationResultTablet
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.succesful_results''',
                                                              ) !=
                                                              null) &&
                                                          (FFAppState()
                                                                  .refreshed !=
                                                              true)) {
                                                        _model.lN25CopyTablet =
                                                            await CalculateDistanceCall
                                                                .call(
                                                          origins:
                                                              GetCoordinatesAPINewCall
                                                                  .originLatLng(
                                                            (_model.getCordinateResultTablet
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          destinations: functions
                                                              .joinCoords(functions
                                                                  .sublist(
                                                                      0,
                                                                      25,
                                                                      GetNearbyLocationsCall.coordinates(
                                                                        (_model.getLocationResultTablet?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                          .toList())
                                                                  .toList()),
                                                        );
                                                        _shouldSetState = true;
                                                        _model.lL25CopyTablet =
                                                            await CalculateDistanceCall
                                                                .call(
                                                          origins:
                                                              GetCoordinatesAPINewCall
                                                                  .originLatLng(
                                                            (_model.getCordinateResultTablet
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          destinations: functions
                                                              .joinCoords(functions
                                                                  .sublist(
                                                                      25,
                                                                      50,
                                                                      GetNearbyLocationsCall.coordinates(
                                                                        (_model.getLocationResultTablet?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                          .toList())
                                                                  .toList()),
                                                        );
                                                        _shouldSetState = true;
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    EmailWidget(
                                                                  locations:
                                                                      FFAppState()
                                                                          .locationList,
                                                                  query: _model
                                                                      .categoryFieldTabletController
                                                                      .text,
                                                                  location: _model
                                                                      .locdationDropdownMobileValue!,
                                                                  distances: functions.joinLists(
                                                                      List.generate(random_data.randomInteger(0, 0), (index) => random_data.randomName(true, false)).toList(),
                                                                      CalculateDistanceCall.distance(
                                                                        (_model.lN25CopyTablet?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                          .toList(),
                                                                      CalculateDistanceCall.distance(
                                                                        (_model.lL25CopyTablet?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                          .toList())!,
                                                                  distance: _model
                                                                      .sliderMobileValue!,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'No content to download, submit location query then try again.',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9EB),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .cloud_download_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 28.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Download',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model
                                                          .locdationDropdownTabletValueController
                                                          ?.reset();
                                                      _model
                                                          .countryDropdownTabletValueController
                                                          ?.reset();
                                                    });
                                                    setState(() {
                                                      _model
                                                          .categoryFieldTabletController
                                                          ?.clear();
                                                    });
                                                    setState(() {
                                                      _model.slideTabletValue =
                                                          0.0;
                                                    });
                                                    setState(() {
                                                      FFAppState().refreshed =
                                                          true;
                                                      FFAppState()
                                                          .CityNameList = [];
                                                      FFAppState()
                                                          .locationList = [];
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFE9E9EB),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .refresh_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 28.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Refresh',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (FFAppState().occurences <=
                                                    6)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      if ((_model.countryDropdownTabletValue != null && _model.countryDropdownTabletValue != '') &&
                                                          (_model.locdationDropdownTabletValue !=
                                                                  null &&
                                                              _model.locdationDropdownTabletValue !=
                                                                  '') &&
                                                          ((_model.categoryFieldTabletController
                                                                          .text !=
                                                                      null &&
                                                                  _model.categoryFieldTabletController
                                                                          .text !=
                                                                      '') &&
                                                              (_model.slideTabletValue !=
                                                                  0.0))) {
                                                        if (_model.formKey3
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey3
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        setState(() {
                                                          FFAppState()
                                                              .isLoading = true;
                                                        });
                                                        _model.userInfoResponse =
                                                            await UserEmailInfoCall
                                                                .call(
                                                          email: _model
                                                              .tabletEmailController
                                                              .text,
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .userInfoResponse
                                                                ?.succeeded ??
                                                            true)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .occurences =
                                                                getJsonField(
                                                              (_model.userInfoResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.occurrences''',
                                                            );
                                                          });
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                FFAppState()
                                                                    .occurences
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          if (FFAppState()
                                                                  .occurences ==
                                                              0) {
                                                            _model.apiResultwq3 =
                                                                await RegisterAnUserCall
                                                                    .call(
                                                              email: _model
                                                                  .tabletEmailController
                                                                  .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultwq3
                                                                    ?.succeeded ??
                                                                true)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (_model.apiResultwq3
                                                                            ?.bodyText ??
                                                                        ''),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Registration Failed',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  FFAppState()
                                                                      .occurences
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }

                                                          setState(() {
                                                            FFAppState()
                                                                    .refreshed =
                                                                true;
                                                            FFAppState()
                                                                    .originLatLng =
                                                                null;
                                                            FFAppState()
                                                                .locationList = [];
                                                          });
                                                          if ((FFAppState()
                                                                      .occurences >=
                                                                  0) &&
                                                              (FFAppState()
                                                                      .occurences <=
                                                                  6)) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .occurences =
                                                                  FFAppState()
                                                                          .occurences +
                                                                      1;
                                                            });
                                                            _model.updatedUserInfo =
                                                                await ExperiencedServiceUserDetailsCall
                                                                    .call(
                                                              email: _model
                                                                  .tabletEmailController
                                                                  .text,
                                                              occurrences:
                                                                  FFAppState()
                                                                      .occurences,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .updatedUserInfo
                                                                    ?.succeeded ??
                                                                true)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    (_model.updatedUserInfo
                                                                            ?.bodyText ??
                                                                        ''),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'updating user infor failed',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            }

                                                            _model.getCordinateResultTablet =
                                                                await GetCoordinatesAPINewCall
                                                                    .call(
                                                              country: functions
                                                                  .getcountry(_model
                                                                      .countryDropdownTabletValue),
                                                              city: functions
                                                                  .getCity(_model
                                                                      .locdationDropdownTabletValue),
                                                              query: _model
                                                                  .categoryFieldTabletController
                                                                  .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'coordinates api called',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            if ((getJsonField(
                                                                      (_model.getCordinateResultTablet
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data''',
                                                                    ) !=
                                                                    null) &&
                                                                (_model.slideTabletValue !=
                                                                    null)) {
                                                              _model.nearbyLocationsIdTablet =
                                                                  await GetNearbyLocationsIdCall
                                                                      .call(
                                                                radius1:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  random_data
                                                                      .randomInteger(
                                                                          0, 0),
                                                                  0,
                                                                ),
                                                                radius2: functions
                                                                    .toInt(_model
                                                                        .slideTabletValue!
                                                                        .toString()),
                                                                centerLon:
                                                                    GetCoordinatesAPINewCall
                                                                        .longitude(
                                                                  (_model.getCordinateResultTablet
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toString(),
                                                                queryString: _model
                                                                    .categoryFieldTabletController
                                                                    .text,
                                                                centerLat:
                                                                    GetCoordinatesAPINewCall
                                                                        .latitude(
                                                                  (_model.getCordinateResultTablet
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toString(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'get nearby api called',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                              if ((_model
                                                                      .nearbyLocationsIdTablet
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.getLocationResultTablet =
                                                                    await GetNearbyLocationsCall
                                                                        .call(
                                                                  placeIdsJson:
                                                                      getJsonField(
                                                                    (_model.nearbyLocationsIdTablet
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.place_id_list''',
                                                                  ),
                                                                  centerCoord:
                                                                      GetCoordinatesAPINewCall
                                                                          .originLatLng(
                                                                    (_model.getCordinateResultTablet
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'get nearby location called',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                if ((_model
                                                                        .getLocationResultTablet
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  if (functions.isListEmpty(
                                                                      GetNearbyLocationsCall
                                                                              .locationList(
                                                                    (_model.getLocationResultTablet
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                          .toList())) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'list is empty',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Items ready for download!',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }

                                                                  _model.refineResultTablet =
                                                                      await actions
                                                                          .refineResult(
                                                                    GetNearbyLocationsCall
                                                                            .locationList(
                                                                      (_model.getLocationResultTablet
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                        .toList(),
                                                                    _model
                                                                        .slideTabletValue!,
                                                                    0.0,
                                                                    functions.getLatLng(
                                                                        GetCoordinatesAPINewCall.latitude(
                                                                          (_model.getCordinateResultTablet?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString(),
                                                                        GetCoordinatesAPINewCall.longitude(
                                                                          (_model.getCordinateResultTablet?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString()),
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .isLoading =
                                                                        false;
                                                                    FFAppState().locationList = _model
                                                                        .refineResultTablet!
                                                                        .toList()
                                                                        .cast<
                                                                            dynamic>();
                                                                    FFAppState().originLatLng = functions.getLatLng(
                                                                        GetCoordinatesAPINewCall.latitude(
                                                                          (_model.getCordinateResultTablet?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString(),
                                                                        GetCoordinatesAPINewCall.longitude(
                                                                          (_model.getCordinateResultTablet?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .toString());
                                                                  });
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'search results here',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  _model.userDetailsUpdated =
                                                                      await ExperiencedUserDataBaseCall
                                                                          .call(
                                                                    email: _model
                                                                        .tabletEmailController
                                                                        .text,
                                                                    content: _model
                                                                        .countryDropdownTabletValue,
                                                                    title: _model
                                                                        .categoryFieldTabletController
                                                                        .text,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .userDetailsUpdated
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.userDetailsUpdated?.bodyText ??
                                                                              ''),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          (_model.userDetailsUpdated?.bodyText ??
                                                                              ''),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Nearby search failed'),
                                                                        content:
                                                                            Text('Failed to get nearby locations,try again.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Dismiss'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Failed'),
                                                                    content: Text(
                                                                        'Could not get location coordinates, please ensure that the slider is set'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                (_model.userInfoResponse
                                                                        ?.bodyText ??
                                                                    ''),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Please set the  country, location and  category with define distance before searching',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9EB),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .search_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 28.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Search',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState().occurences >=
                                                    7)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await launchURL(
                                                          'https://buy.stripe.com/8wMcNf4MKcp55tm6oC');
                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9EB),
                                                      ),
                                                      child: Visibility(
                                                        visible: FFAppState()
                                                                .occurences >=
                                                            3,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .handHoldingUsd,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Contribute',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
