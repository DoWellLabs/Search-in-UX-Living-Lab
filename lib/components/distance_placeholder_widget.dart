import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'distance_placeholder_model.dart';
export 'distance_placeholder_model.dart';

class DistancePlaceholderWidget extends StatefulWidget {
  const DistancePlaceholderWidget({Key? key}) : super(key: key);

  @override
  _DistancePlaceholderWidgetState createState() =>
      _DistancePlaceholderWidgetState();
}

class _DistancePlaceholderWidgetState extends State<DistancePlaceholderWidget> {
  late DistancePlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DistancePlaceholderModel());

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

    return Text(
      'Calculating distance...',
      style: FlutterFlowTheme.of(context).bodyLarge,
    );
  }
}
