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
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nearby_locations_model.dart';
export 'nearby_locations_model.dart';

class NearbyLocationsWidget extends StatefulWidget {
  const NearbyLocationsWidget({Key? key}) : super(key: key);

  @override
  _NearbyLocationsWidgetState createState() => _NearbyLocationsWidgetState();
}

class _NearbyLocationsWidgetState extends State<NearbyLocationsWidget> {
  late NearbyLocationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NearbyLocationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().refreshed = true;
      });
      _model.creditsResults = await CheckCredSysCall.call();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF3BB06C),
        drawer: Container(
          width: 303.0,
          child: Drawer(
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
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
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
                Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (((getJsonField(
                                      (_model.locationsResult?.jsonBody ?? ''),
                                      r'''$.succesful_results''',
                                    ) !=
                                    null) ||
                                (getJsonField(
                                      (_model.locationsResult?.jsonBody ?? ''),
                                      r'''$.succesful_results''',
                                    ) !=
                                    null)) &&
                            (FFAppState().refreshed != true)) {
                          _model.lEmailFirst25 =
                              await CalculateDistanceCall.call(
                            origins: getJsonField(
                                      (_model.locationsIdResult?.jsonBody ??
                                          ''),
                                      r'''$.place_id_list''',
                                    ) !=
                                    null
                                ? GetNearbyLocationsIdCall.centerCoordinate(
                                    (_model.locationsIdResult?.jsonBody ?? ''),
                                  ).toString()
                                : GetNearbyLocationsIdCall.centerCoordinate(
                                    (_model.locationsIdResultCopy?.jsonBody ??
                                        ''),
                                  ).toString(),
                            destinations: functions.joinCoords(getJsonField(
                                      (_model.locationsResult?.jsonBody ?? ''),
                                      r'''$.succesful_results''',
                                    ) !=
                                    null
                                ? (GetNearbyLocationsCall.locationList(
                                    (_model.locationsResult?.jsonBody ?? ''),
                                  ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()!
                                    .take(25)
                                    .toList()
                                    .map((e) => e.toString())
                                    .toList()
                                : (GetNearbyLocationsCall.locationList(
                                    (_model.locationsResultCopy?.jsonBody ??
                                        ''),
                                  ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()!
                                    .take(25)
                                    .toList()
                                    .map((e) => e.toString())
                                    .toList()),
                          );
                          _model.lEmailNext25 =
                              await CalculateDistanceCall.call(
                            origins: getJsonField(
                                      (_model.locationsIdResult?.jsonBody ??
                                          ''),
                                      r'''$.place_id_list''',
                                    ) !=
                                    null
                                ? GetNearbyLocationsIdCall.centerCoordinate(
                                    (_model.locationsIdResult?.jsonBody ?? ''),
                                  ).toString()
                                : GetNearbyLocationsIdCall.centerCoordinate(
                                    (_model.locationsIdResultCopy?.jsonBody ??
                                        ''),
                                  ).toString(),
                            destinations: functions.joinCoords(functions
                                .sublist(
                                    25,
                                    50,
                                    getJsonField(
                                              (_model.locationsResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.succesful_results''',
                                            ) !=
                                            null
                                        ? (GetNearbyLocationsCall.coordinates(
                                            (_model.locationsResult?.jsonBody ??
                                                ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()!
                                        : (GetNearbyLocationsCall.coordinates(
                                            (_model.locationsResultCopy
                                                    ?.jsonBody ??
                                                ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()!
                                            .toList())
                                .toList()),
                          );
                          _model.lEmailLast25 =
                              await CalculateDistanceCall.call(
                            origins: getJsonField(
                                      (_model.locationsIdResult?.jsonBody ??
                                          ''),
                                      r'''$.place_id_list''',
                                    ) !=
                                    null
                                ? GetNearbyLocationsIdCall.centerCoordinate(
                                    (_model.locationsIdResult?.jsonBody ?? ''),
                                  ).toString()
                                : GetNearbyLocationsIdCall.centerCoordinate(
                                    (_model.locationsIdResultCopy?.jsonBody ??
                                        ''),
                                  ).toString(),
                            destinations: functions.joinCoords(functions
                                .sublist(
                                    50,
                                    75,
                                    getJsonField(
                                              (_model.locationsResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.succesful_results''',
                                            ) !=
                                            null
                                        ? (GetNearbyLocationsCall.coordinates(
                                            (_model.locationsResult?.jsonBody ??
                                                ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()!
                                        : (GetNearbyLocationsCall.coordinates(
                                            (_model.locationsResultCopy
                                                    ?.jsonBody ??
                                                ''),
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()!
                                            .toList())
                                .toList()),
                          );
                          await showAlignedDialog(
                            context: context,
                            isGlobal: true,
                            avoidOverflow: false,
                            targetAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: EmailWidget(
                                    locations: getJsonField(
                                              (_model.locationsResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.succesful_results''',
                                            ) !=
                                            null
                                        ? GetNearbyLocationsCall.locationList(
                                            (_model.locationsResult?.jsonBody ??
                                                ''),
                                          )!
                                        : GetNearbyLocationsCall.locationList(
                                            (_model.locationsResult?.jsonBody ??
                                                ''),
                                          )!,
                                    query: _model.queryDropdownValue == null ||
                                            _model.queryDropdownValue == ''
                                        ? _model.sQueryDropdownValue
                                        : _model.queryDropdownValue,
                                    location: _model.locationDropdownValue ==
                                                null ||
                                            _model.locationDropdownValue == ''
                                        ? _model.sLocationDropdownValue!
                                        : _model.locationDropdownValue!,
                                    distances: functions.joinLists(
                                        (CalculateDistanceCall.distance(
                                          (_model.lEmailFirst25?.jsonBody ??
                                              ''),
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()
                                            ?.toList(),
                                        (CalculateDistanceCall.distance(
                                          (_model.lEmailNext25?.jsonBody ?? ''),
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()
                                            ?.toList(),
                                        (CalculateDistanceCall.distance(
                                          (_model.lEmailLast25?.jsonBody ?? ''),
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()
                                            ?.toList())!,
                                    distance: _model.sSliderRadiusValue != null
                                        ? _model.sSliderRadiusValue!
                                        : _model.sliderRadius2Value!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'No content to download, submit location query then try again.',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

                        setState(() {});
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
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await actions.openUrl(
                        ' https://uxlivinglab.com/en/',
                      );
                    },
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
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
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
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
              ],
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
          ),
          alignment: AlignmentDirectional(0.00, 1.00),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).secondary,
                          borderRadius: 8.0,
                          buttonSize: 60.0,
                          fillColor: FlutterFlowTheme.of(context).secondary,
                          icon: Icon(
                            Icons.menu_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 32.0,
                          ),
                          onPressed: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: 'dowell',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Group_1.png',
                                          height: 67.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Search in DoWell Living Lab',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 40.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ]
                          .divide(SizedBox(width: 12.0))
                          .addToStart(SizedBox(width: 32.0)),
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.14,
                    decoration: BoxDecoration(
                      color: Color(0xFF3BB06C),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Vector.png',
                        ).image,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 8.0,
                            buttonSize: 60.0,
                            fillColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              Icons.menu_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: 'dowell',
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Group_1.png',
                                    width: 60.0,
                                    height: 44.8,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                'Search in UX Living Lab',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).width >= 767.0
                      ? (MediaQuery.sizeOf(context).height * 0.85)
                      : (MediaQuery.sizeOf(context).height * 0.77),
                  decoration: BoxDecoration(
                    color: Color(0xFFD4FFE6),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 32.0, 8.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'How it works?',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.2,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/9267_[Converted]-01_1.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 1.0, 1.0, 1.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      if (_model.sLocationDropdownValue !=
                                                              null &&
                                                          _model.sLocationDropdownValue !=
                                                              '')
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GetCoordinatesCall
                                                                  .call(
                                                            location: _model
                                                                .sLocationDropdownValue,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final googleMapGetCoordinatesResponse =
                                                                snapshot.data!;
                                                            return Builder(
                                                                builder:
                                                                    (context) {
                                                              final _googleMapMarker =
                                                                  FFAppState()
                                                                      .location;
                                                              return FlutterFlowGoogleMap(
                                                                controller: _model
                                                                    .googleMapsController1,
                                                                onCameraIdle: (latLng) =>
                                                                    setState(() =>
                                                                        _model.googleMapsCenter1 =
                                                                            latLng),
                                                                initialLocation: _model
                                                                        .googleMapsCenter1 ??=
                                                                    functions.getLatLng(
                                                                        functions.formatLng(GetCoordinatesCall.lat(
                                                                          googleMapGetCoordinatesResponse
                                                                              .jsonBody,
                                                                        ).toString()),
                                                                        functions.formatLng(GetCoordinatesCall.lng(
                                                                          googleMapGetCoordinatesResponse
                                                                              .jsonBody,
                                                                        ).toString())),
                                                                markers: [
                                                                  if (_googleMapMarker !=
                                                                      null)
                                                                    FlutterFlowMarker(
                                                                      _googleMapMarker
                                                                          .serialize(),
                                                                      _googleMapMarker,
                                                                    ),
                                                                ],
                                                                markerColor:
                                                                    GoogleMarkerColor
                                                                        .green,
                                                                mapType: MapType
                                                                    .normal,
                                                                style:
                                                                    GoogleMapStyle
                                                                        .standard,
                                                                initialZoom:
                                                                    14.0,
                                                                allowInteraction:
                                                                    true,
                                                                allowZoom: true,
                                                                showZoomControls:
                                                                    true,
                                                                showLocation:
                                                                    false,
                                                                showCompass:
                                                                    false,
                                                                showMapToolbar:
                                                                    false,
                                                                showTraffic:
                                                                    false,
                                                                centerMapOnMarkerTap:
                                                                    true,
                                                              );
                                                            });
                                                          },
                                                        ),
                                                      if (_model.sLocationDropdownValue ==
                                                              null ||
                                                          _model.sLocationDropdownValue ==
                                                              '')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            borderRadius: 30.0,
                                                            borderWidth: 0.0,
                                                            buttonSize: 60.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            icon: Icon(
                                                              Icons.play_arrow,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                            showLoadingIndicator:
                                                                true,
                                                            onPressed:
                                                                () async {
                                                              await actions
                                                                  .launchURLInWebView(
                                                                context,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      if ((_model.sLocationDropdownValue !=
                                                                  null &&
                                                              _model.sLocationDropdownValue !=
                                                                  '') &&
                                                          (_model.sSliderRadiusValue !=
                                                              null))
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GetCoordinatesCall
                                                                  .call(
                                                            location: _model
                                                                .sLocationDropdownValue,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final livingLabMapGetCoordinatesResponse =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              child: custom_widgets
                                                                  .LivingLabMap(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                radius: _model
                                                                    .sSliderRadiusValue!,
                                                                target: FFAppState()
                                                                            .location ==
                                                                        null
                                                                    ? functions.getLatLng(
                                                                        functions.formatCoords(GetCoordinatesCall.lat(
                                                                          livingLabMapGetCoordinatesResponse
                                                                              .jsonBody,
                                                                        ).toString()),
                                                                        functions.formatCoords(GetCoordinatesCall.lng(
                                                                          livingLabMapGetCoordinatesResponse
                                                                              .jsonBody,
                                                                        ).toString()))
                                                                    : FFAppState().location!,
                                                                center: functions.getLatLng(
                                                                    functions.formatCoords(GetCoordinatesCall.lat(
                                                                      livingLabMapGetCoordinatesResponse
                                                                          .jsonBody,
                                                                    ).toString()),
                                                                    functions.formatCoords(GetCoordinatesCall.lng(
                                                                      livingLabMapGetCoordinatesResponse
                                                                          .jsonBody,
                                                                    ).toString())),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.96,
                                          child: Form(
                                            key: _model.formKey2,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 4.0, 6.0, 4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future:
                                                                GetCategoriesCall
                                                                    .call(),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.46,
                                                                  child:
                                                                      DropdownPlaceholderWidget(),
                                                                );
                                                              }
                                                              final sQueryDropdownGetCategoriesResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .sQueryDropdownValueController ??=
                                                                    FormFieldController<
                                                                            String>(
                                                                        null),
                                                                options: (GetCategoriesCall
                                                                        .categories(
                                                                  sQueryDropdownGetCategoriesResponse
                                                                      .jsonBody,
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!,
                                                                onChanged: (val) =>
                                                                    setState(() =>
                                                                        _model.sQueryDropdownValue =
                                                                            val),
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.48,
                                                                searchHintTextStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: Color(
                                                                      0xFFB4B4B4),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      16.0,
                                                                  height: 1.2,
                                                                ),
                                                                textStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: Color(
                                                                      0xFF3BB06C),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                                hintText:
                                                                    'Searching for',
                                                                searchHintText:
                                                                    'Search for',
                                                                searchCursorColor:
                                                                    Colors
                                                                        .black,
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
                                                                ),
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 8.0,
                                                                borderColor: Color(
                                                                    0xFFB4B4B4),
                                                                borderWidth:
                                                                    1.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future:
                                                                GetCitiesCall
                                                                    .call(),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.43,
                                                                  child:
                                                                      DropdownPlaceholderWidget(),
                                                                );
                                                              }
                                                              final sLocationDropdownGetCitiesResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .sLocationDropdownValueController ??=
                                                                    FormFieldController<
                                                                            String>(
                                                                        null),
                                                                options: (GetCitiesCall
                                                                        .citiesName(
                                                                  sLocationDropdownGetCitiesResponse
                                                                      .jsonBody,
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!,
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.sLocationDropdownValue =
                                                                          val);
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .locationName =
                                                                        _model
                                                                            .sLocationDropdownValue!;
                                                                  });
                                                                },
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.43,
                                                                searchHintTextStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: Color(
                                                                      0xFFB4B4B4),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize:
                                                                      16.0,
                                                                  height: 1.2,
                                                                ),
                                                                textStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: Color(
                                                                      0xFF3BB06C),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                                hintText:
                                                                    'Select a city',
                                                                searchHintText:
                                                                    'Search for a city',
                                                                searchCursorColor:
                                                                    Colors
                                                                        .black,
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
                                                                ),
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 8.0,
                                                                borderColor: Color(
                                                                    0xFFB4B4B4),
                                                                borderWidth:
                                                                    1.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Distance from city centre in meters',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16.0,
                                                          height: 1.2,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        formatNumber(
                                                          _model
                                                              .sSliderRadiusValue,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '0',
                                                          locale: 'en_US',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16.0,
                                                          height: 1.2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: Slider.adaptive(
                                                    activeColor:
                                                        Color(0xFF21633D),
                                                    inactiveColor: Colors.white,
                                                    min: 0.0,
                                                    max: 10000.0,
                                                    value: _model
                                                            .sSliderRadiusValue ??=
                                                        0.0,
                                                    label: _model
                                                        .sSliderRadiusValue
                                                        .toString(),
                                                    divisions: 10000,
                                                    onChanged: (newValue) {
                                                      newValue = double.parse(
                                                          newValue
                                                              .toStringAsFixed(
                                                                  0));
                                                      setState(() => _model
                                                              .sSliderRadiusValue =
                                                          newValue);
                                                    },
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
                                if ((getJsonField(
                                          (_model.locationsResult?.jsonBody ??
                                              ''),
                                          r'''$.succesful_results''',
                                        ) !=
                                        null) &&
                                    (FFAppState().refreshed != true))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '${functions.listLength(GetNearbyLocationsCall.locationList(
                                                  (_model.locationsResultCopy
                                                          ?.jsonBody ??
                                                      ''),
                                                )!.toList()).toString()} Results',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if ((FFAppState().refreshed != true) &&
                                    responsiveVisibility(
                                      context: context,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                  Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.965,
                                    height: 316.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD4FFE6),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final locations = getJsonField(
                                          (_model.nearbyLocationResult
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.succesful_results''',
                                        ).toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: locations.length,
                                          itemBuilder:
                                              (context, locationsIndex) {
                                            final locationsItem =
                                                locations[locationsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState().location =
                                                        functions
                                                            .latLngFromLocation(
                                                                getJsonField(
                                                      locationsItem,
                                                      r'''$.location_coord''',
                                                    ).toString());
                                                  });
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: 358.0,
                                                    height: 474.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 358.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              children: [
                                                                if (getJsonField(
                                                                      locationsItem,
                                                                      r'''$.photo_reference''',
                                                                    ) ==
                                                                    'None')
                                                                  Icon(
                                                                    Icons
                                                                        .image_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    size: 150.0,
                                                                  ),
                                                                if (getJsonField(
                                                                      locationsItem,
                                                                      r'''$.photo_reference''',
                                                                    ) !=
                                                                    'None')
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 700),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 700),
                                                                      imageUrl:
                                                                          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=358&photo_reference=${getJsonField(
                                                                        locationsItem,
                                                                        r'''$.photo_reference''',
                                                                      ).toString()}&key=AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                                                      width:
                                                                          358.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Text(
                                                            getJsonField(
                                                              locationsItem,
                                                              r'''$.place_name''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                  maxChars: 30,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Poppins',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future:
                                                                CalculateDistanceCall
                                                                    .call(
                                                              origins:
                                                                  GetNearbyLocationsIdCall
                                                                      .centerCoordinate(
                                                                (_model.locationsIdResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                              destinations:
                                                                  getJsonField(
                                                                locationsItem,
                                                                r'''$.location_coord''',
                                                              ).toString(),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return DistancePlaceholderWidget();
                                                              }
                                                              final distanceCalculateDistanceResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return Text(
                                                                'Driving Distance ${valueOrDefault<String>(
                                                                  getJsonField(
                                                                    distanceCalculateDistanceResponse
                                                                        .jsonBody,
                                                                    r'''$.rows[:].elements[:].distance.text''',
                                                                  ).toString(),
                                                                  'N/A',
                                                                )}'
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 30,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              );
                                                            },
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
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      .location_on_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  locationsItem,
                                                                  r'''$.address''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          26,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                            ],
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
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      .globe,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  locationsItem,
                                                                  r'''$.website''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          26,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                      .phone_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  locationsItem,
                                                                  r'''$.phone''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          26,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      16.0,
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
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 24.0, 8.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Text(
                                                  'How it works?',
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24.0,
                                                    height: 1.2,
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, -1.00),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    1280.0
                                                                ? (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.48)
                                                                : (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.48),
                                                            height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    1279.0
                                                                ? (MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.2)
                                                                : 290.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/9267_[Converted]-01_1.png',
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.00,
                                                                    0.00),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          1.0,
                                                                          1.0,
                                                                          1.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        if ((_model.locationDropdownValue != null &&
                                                                                _model.locationDropdownValue != '') &&
                                                                            responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: GetCoordinatesCall.call(
                                                                                location: _model.locationDropdownValue,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                final googleMapGetCoordinatesResponse = snapshot.data!;
                                                                                return Builder(builder: (context) {
                                                                                  final _googleMapMarker = FFAppState().location;
                                                                                  return FlutterFlowGoogleMap(
                                                                                    controller: _model.googleMapsController2,
                                                                                    onCameraIdle: (latLng) => setState(() => _model.googleMapsCenter2 = latLng),
                                                                                    initialLocation: _model.googleMapsCenter2 ??= functions.getLatLng(
                                                                                        functions.formatLng(GetCoordinatesCall.lat(
                                                                                          googleMapGetCoordinatesResponse.jsonBody,
                                                                                        ).toString()),
                                                                                        functions.formatLng(GetCoordinatesCall.lng(
                                                                                          googleMapGetCoordinatesResponse.jsonBody,
                                                                                        ).toString())),
                                                                                    markers: [
                                                                                      if (_googleMapMarker != null)
                                                                                        FlutterFlowMarker(
                                                                                          _googleMapMarker.serialize(),
                                                                                          _googleMapMarker,
                                                                                        ),
                                                                                    ],
                                                                                    markerColor: GoogleMarkerColor.green,
                                                                                    mapType: MapType.normal,
                                                                                    style: GoogleMapStyle.standard,
                                                                                    initialZoom: 12.0,
                                                                                    allowInteraction: true,
                                                                                    allowZoom: true,
                                                                                    showZoomControls: true,
                                                                                    showLocation: false,
                                                                                    showCompass: false,
                                                                                    showMapToolbar: false,
                                                                                    showTraffic: false,
                                                                                    centerMapOnMarkerTap: true,
                                                                                  );
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        if (_model.locationDropdownValue ==
                                                                                null ||
                                                                            _model.locationDropdownValue ==
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).secondary,
                                                                              borderRadius: 30.0,
                                                                              borderWidth: 0.0,
                                                                              buttonSize: 60.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              icon: Icon(
                                                                                Icons.play_arrow,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 30.0,
                                                                              ),
                                                                              showLoadingIndicator: true,
                                                                              onPressed: () async {
                                                                                await actions.launchURLInWebView(
                                                                                  context,
                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        if ((_model.locationDropdownValue != null && _model.locationDropdownValue != '') &&
                                                                            (_model.sliderRadius2Value !=
                                                                                null))
                                                                          FutureBuilder<
                                                                              ApiCallResponse>(
                                                                            future:
                                                                                GetCoordinatesCall.call(
                                                                              location: _model.locationDropdownValue,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final livingLabMapGetCoordinatesResponse = snapshot.data!;
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                child: custom_widgets.LivingLabMap(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  radius: _model.sliderRadius2Value!,
                                                                                  target: FFAppState().location == null
                                                                                      ? functions.getLatLng(
                                                                                          functions.formatCoords(GetCoordinatesCall.lat(
                                                                                            livingLabMapGetCoordinatesResponse.jsonBody,
                                                                                          ).toString()),
                                                                                          functions.formatCoords(GetCoordinatesCall.lng(
                                                                                            livingLabMapGetCoordinatesResponse.jsonBody,
                                                                                          ).toString()))
                                                                                      : FFAppState().location!,
                                                                                  center: functions.getLatLng(
                                                                                      functions.formatCoords(GetCoordinatesCall.lat(
                                                                                        livingLabMapGetCoordinatesResponse.jsonBody,
                                                                                      ).toString()),
                                                                                      functions.formatCoords(GetCoordinatesCall.lng(
                                                                                        livingLabMapGetCoordinatesResponse.jsonBody,
                                                                                      ).toString())),
                                                                                ),
                                                                              );
                                                                            },
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
                                                      Container(
                                                        width: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                1280.0
                                                            ? (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.48)
                                                            : (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.48),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFD4FFE6),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.47,
                                                          child: Form(
                                                            key:
                                                                _model.formKey1,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .always,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 56.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD4FFE6),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: GetCategoriesCall
                                                                          .call(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.46,
                                                                            height:
                                                                                56.0,
                                                                            child:
                                                                                DropdownPlaceholderWidget(),
                                                                          );
                                                                        }
                                                                        final queryDropdownGetCategoriesResponse =
                                                                            snapshot.data!;
                                                                        return FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.queryDropdownValueController ??=
                                                                              FormFieldController<String>(null),
                                                                          options: (GetCategoriesCall.categories(
                                                                            queryDropdownGetCategoriesResponse.jsonBody,
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()!,
                                                                          onChanged: (val) =>
                                                                              setState(() => _model.queryDropdownValue = val),
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.46,
                                                                          height:
                                                                              56.0,
                                                                          searchHintTextStyle:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                Color(0xFFB4B4B4),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                16.0,
                                                                            height:
                                                                                1.2,
                                                                          ),
                                                                          textStyle:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                Color(0xFF3BB06C),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          hintText:
                                                                              'Searching for',
                                                                          searchHintText:
                                                                              'Search for',
                                                                          searchCursorColor:
                                                                              Colors.black,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              Colors.white,
                                                                          elevation:
                                                                              8.0,
                                                                          borderColor:
                                                                              Color(0xFFB4B4B4),
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isSearchable:
                                                                              true,
                                                                          isMultiSelect:
                                                                              false,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        56.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: GetCitiesCall
                                                                          .call(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.46,
                                                                            height:
                                                                                56.0,
                                                                            child:
                                                                                DropdownPlaceholderWidget(),
                                                                          );
                                                                        }
                                                                        final locationDropdownGetCitiesResponse =
                                                                            snapshot.data!;
                                                                        return FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.locationDropdownValueController ??=
                                                                              FormFieldController<String>(null),
                                                                          options: (GetCitiesCall.citiesName(
                                                                            locationDropdownGetCitiesResponse.jsonBody,
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()!,
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.locationDropdownValue = val);
                                                                            setState(() {
                                                                              FFAppState().locationName = _model.locationDropdownValue!;
                                                                            });
                                                                          },
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.46,
                                                                          height:
                                                                              56.0,
                                                                          searchHintTextStyle:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                Color(0xFFB4B4B4),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                16.0,
                                                                            height:
                                                                                1.2,
                                                                          ),
                                                                          textStyle:
                                                                              GoogleFonts.getFont(
                                                                            'Poppins',
                                                                            color:
                                                                                Color(0xFF3BB06C),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          hintText:
                                                                              'Select a city',
                                                                          searchHintText:
                                                                              'Search for a city',
                                                                          searchCursorColor:
                                                                              Colors.black,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              Colors.white,
                                                                          elevation:
                                                                              8.0,
                                                                          borderColor:
                                                                              Color(0xFFB4B4B4),
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isSearchable:
                                                                              true,
                                                                          isMultiSelect:
                                                                              false,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Text(
                                                                            'Distance from city centre in meters',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16.0,
                                                                              height: 1.2,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              formatNumber(
                                                                                _model.sliderRadius2Value,
                                                                                formatType: FormatType.custom,
                                                                                format: '0',
                                                                                locale: 'en_US',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 16.0,
                                                                                height: 1.2,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child: Slider
                                                                          .adaptive(
                                                                        activeColor:
                                                                            Color(0xFF21633D),
                                                                        inactiveColor:
                                                                            Colors.white,
                                                                        min:
                                                                            0.0,
                                                                        max:
                                                                            10000.0,
                                                                        value: _model.sliderRadius2Value ??=
                                                                            0.0,
                                                                        label: _model
                                                                            .sliderRadius2Value
                                                                            .toString(),
                                                                        divisions:
                                                                            10000,
                                                                        onChanged:
                                                                            (newValue) {
                                                                          newValue =
                                                                              double.parse(newValue.toStringAsFixed(0));
                                                                          setState(() =>
                                                                              _model.sliderRadius2Value = newValue);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  tablet: false,
                                                                ))
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.08,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children:
                                                                          [
                                                                        if (FFAppState().refreshed !=
                                                                            true)
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children:
                                                                                [
                                                                              Builder(
                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                  borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  icon: Icon(
                                                                                    Icons.file_download_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  showLoadingIndicator: true,
                                                                                  onPressed: () async {
                                                                                    var _shouldSetState = false;
                                                                                    if ((getJsonField(
                                                                                              (_model.locationsResult?.jsonBody ?? ''),
                                                                                              r'''$.succesful_results''',
                                                                                            ) !=
                                                                                            null) &&
                                                                                        (FFAppState().refreshed != true)) {
                                                                                      _model.lFirst25 = await CalculateDistanceCall.call(
                                                                                        origins: GetNearbyLocationsIdCall.centerCoordinate(
                                                                                          (_model.locationsIdResult?.jsonBody ?? ''),
                                                                                        ).toString(),
                                                                                        destinations: functions.joinCoords((GetNearbyLocationsCall.coordinates(
                                                                                          (_model.locationsResult?.jsonBody ?? ''),
                                                                                        ) as List)
                                                                                            .map<String>((s) => s.toString())
                                                                                            .toList()!
                                                                                            .take(25)
                                                                                            .toList()),
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      _model.lNext25 = await CalculateDistanceCall.call(
                                                                                        origins: GetNearbyLocationsIdCall.centerCoordinate(
                                                                                          (_model.locationsIdResult?.jsonBody ?? ''),
                                                                                        ).toString(),
                                                                                        destinations: functions.joinCoords(functions
                                                                                            .sublist(
                                                                                                25,
                                                                                                50,
                                                                                                (GetNearbyLocationsCall.coordinates(
                                                                                                  (_model.locationsResult?.jsonBody ?? ''),
                                                                                                ) as List)
                                                                                                    .map<String>((s) => s.toString())
                                                                                                    .toList()!
                                                                                                    .toList())
                                                                                            .toList()),
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      _model.lLast25 = await CalculateDistanceCall.call(
                                                                                        origins: GetNearbyLocationsIdCall.centerCoordinate(
                                                                                          (_model.locationsIdResult?.jsonBody ?? ''),
                                                                                        ).toString(),
                                                                                        destinations: functions.joinCoords(functions
                                                                                            .sublist(
                                                                                                50,
                                                                                                75,
                                                                                                (GetNearbyLocationsCall.coordinates(
                                                                                                  (_model.locationsResult?.jsonBody ?? ''),
                                                                                                ) as List)
                                                                                                    .map<String>((s) => s.toString())
                                                                                                    .toList()!
                                                                                                    .toList())
                                                                                            .toList()),
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      await showAlignedDialog(
                                                                                        context: context,
                                                                                        isGlobal: true,
                                                                                        avoidOverflow: false,
                                                                                        targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        builder: (dialogContext) {
                                                                                          return Material(
                                                                                            color: Colors.transparent,
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: EmailWidget(
                                                                                                locations: GetNearbyLocationsCall.locationList(
                                                                                                  (_model.locationsResult?.jsonBody ?? ''),
                                                                                                )!,
                                                                                                query: _model.queryDropdownValue,
                                                                                                location: _model.locationDropdownValue!,
                                                                                                distances: functions.joinLists(
                                                                                                    (CalculateDistanceCall.distance(
                                                                                                      (_model.lFirst25?.jsonBody ?? ''),
                                                                                                    ) as List)
                                                                                                        .map<String>((s) => s.toString())
                                                                                                        .toList()
                                                                                                        ?.toList(),
                                                                                                    (CalculateDistanceCall.distance(
                                                                                                      (_model.lNext25?.jsonBody ?? ''),
                                                                                                    ) as List)
                                                                                                        .map<String>((s) => s.toString())
                                                                                                        .toList()
                                                                                                        ?.toList(),
                                                                                                    (CalculateDistanceCall.distance(
                                                                                                      (_model.lLast25?.jsonBody ?? ''),
                                                                                                    ) as List)
                                                                                                        .map<String>((s) => s.toString())
                                                                                                        .toList()
                                                                                                        ?.toList())!,
                                                                                                distance: _model.sliderRadius2Value!,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));

                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'No content to download, submit location query then try again.',
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
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    if (_shouldSetState) setState(() {});
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Download',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontSize: 16.0,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 4.0)),
                                                                          ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children:
                                                                              [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              icon: Icon(
                                                                                Icons.search,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              showLoadingIndicator: true,
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                // Validate Form 1
                                                                                if (_model.formKey1.currentState == null || !_model.formKey1.currentState!.validate()) {
                                                                                  return;
                                                                                }
                                                                                if (_model.queryDropdownValue == null) {
                                                                                  return;
                                                                                }
                                                                                if (_model.locationDropdownValue == null) {
                                                                                  return;
                                                                                }
                                                                                _model.coordinateResult = await GetCoordinatesCall.call(
                                                                                  location: _model.locationDropdownValue,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                if (getJsonField(
                                                                                      (_model.coordinateResult?.jsonBody ?? ''),
                                                                                      r'''$.data''',
                                                                                    ) !=
                                                                                    null) {
                                                                                  _model.locationsIdResult = await GetNearbyLocationsIdCall.call(
                                                                                    radius1: valueOrDefault<int>(
                                                                                      random_data.randomInteger(0, 0),
                                                                                      0,
                                                                                    ),
                                                                                    radius2: functions.toInt(_model.sliderRadius2Value!.toString()),
                                                                                    centerLon: functions.formatCoords(GetCoordinatesCall.lng(
                                                                                      (_model.coordinateResult?.jsonBody ?? ''),
                                                                                    ).toString()),
                                                                                    queryString: _model.queryDropdownValue,
                                                                                    centerLat: functions.formatCoords(GetCoordinatesCall.lat(
                                                                                      (_model.coordinateResult?.jsonBody ?? ''),
                                                                                    ).toString()),
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.locationsIdResult?.succeeded ?? true)) {
                                                                                    _model.locationsResult = await GetNearbyLocationsCall.call(
                                                                                      placeIdsList: (GetNearbyLocationsIdCall.iDsList(
                                                                                        (_model.locationsIdResult?.jsonBody ?? ''),
                                                                                      ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList(),
                                                                                      centerCoord: GetNearbyLocationsIdCall.centerCoordinate(
                                                                                        (_model.locationsIdResult?.jsonBody ?? ''),
                                                                                      ).toString(),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if ((_model.locationsResult?.succeeded ?? true)) {
                                                                                      if (!functions.isListEmpty(GetNearbyLocationsCall.locationList(
                                                                                        (_model.locationsResult?.jsonBody ?? ''),
                                                                                      )!
                                                                                          .toList())) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
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
                                                                                      setState(() {
                                                                                        FFAppState().refreshed = false;
                                                                                      });
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Nearby Locations Failed'),
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
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                  } else {
                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Failed'),
                                                                                        content: Text('Could not get location coordinates, try again'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }

                                                                                if (_shouldSetState) setState(() {});
                                                                              },
                                                                            ),
                                                                            Text(
                                                                              'Search',
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children:
                                                                              [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              icon: Icon(
                                                                                Icons.refresh,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              showLoadingIndicator: true,
                                                                              onPressed: () async {
                                                                                setState(() {
                                                                                  _model.queryDropdownValueController?.reset();
                                                                                  _model.locationDropdownValueController?.reset();
                                                                                });
                                                                                setState(() {
                                                                                  _model.sliderRadius2Value = 0.0;
                                                                                });
                                                                                setState(() {
                                                                                  FFAppState().refreshed = true;
                                                                                });
                                                                              },
                                                                            ),
                                                                            Text(
                                                                              'Refresh',
                                                                              style: GoogleFonts.getFont(
                                                                                'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 16.0,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ].divide(SizedBox(width: 8.0)).around(
                                                                              SizedBox(width: 8.0)),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if ((getJsonField(
                                                (_model.locationsResult
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.succesful_results''',
                                              ) !=
                                              null) &&
                                          (FFAppState().refreshed != true))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (!FFAppState().refreshed)
                                                Text(
                                                  '${functions.listLength(GetNearbyLocationsCall.locationList(
                                                        (_model.locationsResult
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!.toList()).toString()} Results',
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                            ].addToStart(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      if (((getJsonField(
                                                    (_model.locationsResult
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.succesful_results''',
                                                  ) !=
                                                  null) &&
                                              (FFAppState().refreshed !=
                                                  true)) &&
                                          responsiveVisibility(
                                            context: context,
                                            phone: false,
                                          ))
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.99,
                                          height: 307.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD4FFE6),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final nearbyLocation =
                                                  GetNearbyLocationsCall
                                                          .locationList(
                                                        (_model.locationsResult
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toList() ??
                                                      [];
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    nearbyLocation.length,
                                                itemBuilder: (context,
                                                    nearbyLocationIndex) {
                                                  final nearbyLocationItem =
                                                      nearbyLocation[
                                                          nearbyLocationIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
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
                                                                  .location =
                                                              functions
                                                                  .latLngFromLocation(
                                                                      getJsonField(
                                                            nearbyLocationItem,
                                                            r'''$.location_coord''',
                                                          ).toString());
                                                        });
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 4.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Container(
                                                          width: 358.0,
                                                          height: 380.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                                                  width: 358.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      if (getJsonField(
                                                                            nearbyLocationItem,
                                                                            r'''$.photo_reference''',
                                                                          ) ==
                                                                          'None')
                                                                        Icon(
                                                                          Icons
                                                                              .image_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          size:
                                                                              150.0,
                                                                        ),
                                                                      if (getJsonField(
                                                                            nearbyLocationItem,
                                                                            r'''$.photo_reference''',
                                                                          ) !=
                                                                          'None')
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(8.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 700),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 700),
                                                                            imageUrl:
                                                                                'https://maps.googleapis.com/maps/api/place/photo?maxwidth=358&photo_reference=${getJsonField(
                                                                              nearbyLocationItem,
                                                                              r'''$.photo_reference''',
                                                                            ).toString()}&key=AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ',
                                                                            width:
                                                                                358.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    nearbyLocationItem,
                                                                    r'''$.place_name''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                child: FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future:
                                                                      CalculateDistanceCall
                                                                          .call(
                                                                    origins:
                                                                        GetNearbyLocationsIdCall
                                                                            .centerCoordinate(
                                                                      (_model.locationsIdResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString(),
                                                                    destinations:
                                                                        getJsonField(
                                                                      nearbyLocationItem,
                                                                      r'''$.location_coord''',
                                                                    ).toString(),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return DistancePlaceholderWidget();
                                                                    }
                                                                    final distanceCalculateDistanceResponse =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      'Driving Distance ${valueOrDefault<String>(
                                                                        getJsonField(
                                                                          distanceCalculateDistanceResponse
                                                                              .jsonBody,
                                                                          r'''$.rows[:].elements[:].distance.text''',
                                                                        ).toString(),
                                                                        'N/A',
                                                                      )}'
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    );
                                                                  },
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
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .location_on_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        nearbyLocationItem,
                                                                        r'''$.address''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                26,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  ],
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
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .globe,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        nearbyLocationItem,
                                                                        r'''$.website''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                26,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .phone_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        nearbyLocationItem,
                                                                        r'''$.phone''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                26,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            16.0,
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
                                                  );
                                                },
                                              );
                                            },
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
                tablet: false,
                tabletLandscape: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (FFAppState().refreshed != true)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) => FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.file_download_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if ((getJsonField(
                                              (_model.locationsResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.succesful_results''',
                                            ) !=
                                            null) &&
                                        (FFAppState().refreshed != true)) {
                                      _model.lFirst25Copy =
                                          await CalculateDistanceCall.call(
                                        origins: GetNearbyLocationsIdCall
                                            .centerCoordinate(
                                          (_model.locationsIdResult?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        destinations: functions.joinCoords(
                                            (GetNearbyLocationsCall.coordinates(
                                          (_model.locationsResult?.jsonBody ??
                                              ''),
                                        ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()!
                                                .take(25)
                                                .toList()),
                                      );
                                      _shouldSetState = true;
                                      _model.lNext25Copy =
                                          await CalculateDistanceCall.call(
                                        origins: GetNearbyLocationsIdCall
                                            .centerCoordinate(
                                          (_model.locationsIdResult?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        destinations: functions.joinCoords(
                                            functions
                                                .sublist(
                                                    25,
                                                    50,
                                                    (GetNearbyLocationsCall
                                                            .coordinates(
                                                      (_model.locationsResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .toList())
                                                .toList()),
                                      );
                                      _shouldSetState = true;
                                      _model.lLast25Copy =
                                          await CalculateDistanceCall.call(
                                        origins: GetNearbyLocationsIdCall
                                            .centerCoordinate(
                                          (_model.locationsIdResult?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        destinations: functions.joinCoords(
                                            functions
                                                .sublist(
                                                    50,
                                                    75,
                                                    (GetNearbyLocationsCall
                                                            .coordinates(
                                                      (_model.locationsResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .toList())
                                                .toList()),
                                      );
                                      _shouldSetState = true;
                                      await showAlignedDialog(
                                        context: context,
                                        isGlobal: true,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: EmailWidget(
                                                locations:
                                                    GetNearbyLocationsCall
                                                        .locationList(
                                                  (_model.locationsResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                query:
                                                    _model.queryDropdownValue,
                                                location: _model
                                                    .locationDropdownValue!,
                                                distances: functions.joinLists(
                                                    (CalculateDistanceCall
                                                            .distance(
                                                      (_model.lFirst25Copy
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.toList(),
                                                    (CalculateDistanceCall
                                                            .distance(
                                                      (_model.lNext25Copy
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.toList(),
                                                    (CalculateDistanceCall
                                                            .distance(
                                                      (_model.lLast25Copy
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.toList())!,
                                                distance:
                                                    _model.sliderRadius2Value!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'No content to download, submit location query then try again.',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                ),
                              ),
                              Text(
                                'Download',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: 30.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.refresh_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                setState(() {
                                  _model.queryDropdownValueController?.reset();
                                  _model.locationDropdownValueController
                                      ?.reset();
                                });
                                setState(() {
                                  _model.sSliderRadiusValue = 0.0;
                                });
                                setState(() {
                                  FFAppState().refreshed = true;
                                  FFAppState().location = null;
                                });
                              },
                            ),
                            Text(
                              'Refresh',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: 20.0,
                              borderWidth: 0.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                var _shouldSetState = false;
                                // Validate Form 1
                                if (_model.formKey1.currentState == null ||
                                    !_model.formKey1.currentState!.validate()) {
                                  return;
                                }
                                if (_model.queryDropdownValue == null) {
                                  return;
                                }
                                if (_model.locationDropdownValue == null) {
                                  return;
                                }
                                _model.coordinateResultCopy =
                                    await GetCoordinatesCall.call(
                                  location: _model.locationDropdownValue,
                                );
                                _shouldSetState = true;
                                if (getJsonField(
                                      (_model.coordinateResult?.jsonBody ?? ''),
                                      r'''$.data''',
                                    ) !=
                                    null) {
                                  _model.locationsIdResultCopy =
                                      await GetNearbyLocationsIdCall.call(
                                    radius1: valueOrDefault<int>(
                                      random_data.randomInteger(0, 0),
                                      0,
                                    ),
                                    radius2: functions.toInt(
                                        _model.sliderRadius2Value!.toString()),
                                    centerLon: functions
                                        .formatCoords(GetCoordinatesCall.lng(
                                      (_model.coordinateResult?.jsonBody ?? ''),
                                    ).toString()),
                                    queryString: _model.queryDropdownValue,
                                    centerLat: functions
                                        .formatCoords(GetCoordinatesCall.lat(
                                      (_model.coordinateResult?.jsonBody ?? ''),
                                    ).toString()),
                                  );
                                  _shouldSetState = true;
                                  if ((_model.locationsIdResult?.succeeded ??
                                      true)) {
                                    _model.locationsResultCopy =
                                        await GetNearbyLocationsCall.call(
                                      placeIdsList:
                                          (GetNearbyLocationsIdCall.iDsList(
                                        (_model.locationsIdResult?.jsonBody ??
                                            ''),
                                      ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList(),
                                      centerCoord: GetNearbyLocationsIdCall
                                          .centerCoordinate(
                                        (_model.locationsIdResult?.jsonBody ??
                                            ''),
                                      ).toString(),
                                    );
                                    _shouldSetState = true;
                                    if ((_model.locationsResult?.succeeded ??
                                        true)) {
                                      if (!functions.isListEmpty(
                                          GetNearbyLocationsCall.locationList(
                                        (_model.locationsResult?.jsonBody ??
                                            ''),
                                      )!
                                              .toList())) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Items ready for download!',
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                      setState(() {
                                        FFAppState().refreshed = false;
                                      });
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                Text('Nearby Locations Failed'),
                                            content: Text(
                                                'Failed to get nearby locations,try again.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Dismiss'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Failed'),
                                        content: Text(
                                            'Could not get location coordinates, try again'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                            ),
                            Text(
                              'Search',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (FFAppState().refreshed != true)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: 30.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.file_download_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        if ((getJsonField(
                                                  (_model.nearbyLocationResult
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.succesful_results''',
                                                ) !=
                                                null) &&
                                            (FFAppState().refreshed != true)) {
                                          _model.first25 =
                                              await CalculateDistanceCall.call(
                                            origins: GetNearbyLocationsIdCall
                                                .centerCoordinate(
                                              (_model.placeIdsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString(),
                                            destinations: functions.joinCoords(
                                                (GetNearbyLocationsCall
                                                        .coordinates(
                                              (_model.nearbyLocationResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!
                                                    .take(25)
                                                    .toList()),
                                          );
                                          _model.next25 =
                                              await CalculateDistanceCall.call(
                                            origins: GetNearbyLocationsIdCall
                                                .centerCoordinate(
                                              (_model.placeIdsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString(),
                                            destinations: functions.joinCoords(
                                                functions
                                                    .sublist(
                                                        25,
                                                        50,
                                                        (GetNearbyLocationsCall
                                                                .coordinates(
                                                          (_model.nearbyLocationResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()!
                                                            .toList())
                                                    .toList()),
                                          );
                                          _model.last5 =
                                              await CalculateDistanceCall.call(
                                            origins: GetNearbyLocationsIdCall
                                                .centerCoordinate(
                                              (_model.placeIdsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString(),
                                            destinations: functions.joinCoords(
                                                functions
                                                    .sublist(
                                                        50,
                                                        75,
                                                        (GetNearbyLocationsCall
                                                                .coordinates(
                                                          (_model.nearbyLocationResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()!
                                                            .toList())
                                                    .toList()),
                                          );
                                          await showAlignedDialog(
                                            context: context,
                                            isGlobal: true,
                                            avoidOverflow: false,
                                            targetAnchor: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: EmailWidget(
                                                    locations:
                                                        GetNearbyLocationsCall
                                                            .locationList(
                                                      (_model.nearbyLocationResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                    query: _model
                                                        .sQueryDropdownValue,
                                                    location: _model
                                                        .sLocationDropdownValue!,
                                                    distances:
                                                        functions.joinLists(
                                                            (CalculateDistanceCall
                                                                    .distance(
                                                              (_model.first25
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                .map<String>(
                                                                    (s) => s
                                                                        .toString())
                                                                .toList()
                                                                ?.toList(),
                                                            (CalculateDistanceCall
                                                                    .distance(
                                                              (_model.next25
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                .map<String>(
                                                                    (s) => s
                                                                        .toString())
                                                                .toList()
                                                                ?.toList(),
                                                            (CalculateDistanceCall
                                                                    .distance(
                                                              (_model.last5
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList()
                                                                ?.toList())!,
                                                    distance: _model
                                                        .sSliderRadiusValue!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'No content to download, submit location query then try again.',
                                                style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Download',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ],
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 30.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.refresh_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      _model.sQueryDropdownValueController
                                          ?.reset();
                                      _model.sLocationDropdownValueController
                                          ?.reset();
                                    });
                                    setState(() {
                                      _model.sSliderRadiusValue = 0.0;
                                    });
                                    await actions.resetAPIResults(
                                      (_model.nearbyLocationResult?.jsonBody ??
                                          ''),
                                    );
                                    setState(() {
                                      FFAppState().refreshed = true;
                                      FFAppState().location = null;
                                    });
                                  },
                                ),
                                Text(
                                  'Refresh',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.search_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    // Validate Form 1
                                    if (_model.formKey2.currentState == null ||
                                        !_model.formKey2.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.sQueryDropdownValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Select the query to proceed',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.sLocationDropdownValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Choose the location to proceed',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      return;
                                    }
                                    _model.locationCoordinateResult =
                                        await GetCoordinatesCall.call(
                                      location: _model.sLocationDropdownValue,
                                    );
                                    if (getJsonField(
                                          (_model.locationCoordinateResult
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                        ) !=
                                        null) {
                                      _model.placeIdsResult =
                                          await GetNearbyLocationsIdCall.call(
                                        radius1: valueOrDefault<int>(
                                          random_data.randomInteger(0, 0),
                                          0,
                                        ),
                                        radius2: functions.toInt(_model
                                            .sSliderRadiusValue!
                                            .toString()),
                                        centerLon: functions
                                            .formatLng(GetCoordinatesCall.lng(
                                          (_model.locationCoordinateResult
                                                  ?.jsonBody ??
                                              ''),
                                        ).toString()),
                                        queryString: _model.sQueryDropdownValue,
                                        centerLat: functions.formatCoords(
                                            GetCoordinatesCall.lat(
                                          (_model.locationCoordinateResult
                                                  ?.jsonBody ??
                                              ''),
                                        ).toString()),
                                      );
                                      if ((_model.placeIdsResult?.succeeded ??
                                          true)) {
                                        _model.nearbyLocationResult =
                                            await GetNearbyLocationsCall.call(
                                          placeIdsList:
                                              (GetNearbyLocationsIdCall.iDsList(
                                            (_model.placeIdsResult?.jsonBody ??
                                                ''),
                                          ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList(),
                                          centerCoord: GetNearbyLocationsIdCall
                                              .centerCoordinate(
                                            (_model.placeIdsResult?.jsonBody ??
                                                ''),
                                          ).toString(),
                                        );
                                        if ((_model.nearbyLocationResult
                                                ?.succeeded ??
                                            true)) {
                                          if (!functions.isListEmpty(
                                              GetNearbyLocationsCall
                                                      .locationList(
                                            (_model.nearbyLocationResult
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList())) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Items ready for download!',
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                          setState(() {
                                            FFAppState().refreshed = false;
                                          });
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'No',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Failed'),
                                            content: Text(
                                                'Could not get location coordinates, try again'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                ),
                                Text(
                                  'Search',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
