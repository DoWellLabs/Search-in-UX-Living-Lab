import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_locatio_list_model.dart';
export 'empty_locatio_list_model.dart';

class EmptyLocatioListWidget extends StatefulWidget {
  const EmptyLocatioListWidget({Key? key}) : super(key: key);

  @override
  _EmptyLocatioListWidgetState createState() => _EmptyLocatioListWidgetState();
}

class _EmptyLocatioListWidgetState extends State<EmptyLocatioListWidget> {
  late EmptyLocatioListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyLocatioListModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.list_alt_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'Empty search result',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Text(
              'Please search on a new category or location',
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
