import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_placeholder_model.dart';
export 'dropdown_placeholder_model.dart';

class DropdownPlaceholderWidget extends StatefulWidget {
  const DropdownPlaceholderWidget({Key? key}) : super(key: key);

  @override
  _DropdownPlaceholderWidgetState createState() =>
      _DropdownPlaceholderWidgetState();
}

class _DropdownPlaceholderWidgetState extends State<DropdownPlaceholderWidget> {
  late DropdownPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownPlaceholderModel());

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

    return FlutterFlowDropDown<String>(
      controller: _model.queryValueController ??=
          FormFieldController<String>(null),
      options: <String>[],
      onChanged: (val) => setState(() => _model.queryValue = val),
      width: MediaQuery.sizeOf(context).width * 0.5,
      textStyle: GoogleFonts.getFont(
        'Poppins',
        color: Color(0xFFB4B4B4),
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      ),
      hintText: 'Loading items..',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Color(0xFF57636C),
        size: 24.0,
      ),
      fillColor: Colors.white,
      elevation: 8.0,
      borderColor: Color(0xFFB4B4B4),
      borderWidth: 1.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
