import '/backend/api_requests/api_calls.dart';
import '/chat2/empty_list_1/empty_list1_widget.dart';
import '/chat2/writing_indicator_1/writing_indicator1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ai_chat_component_widget.dart' show AiChatComponentWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AiChatComponentModel extends FlutterFlowModel<AiChatComponentWidget> {
  ///  Local state fields for this component.

  dynamic chatHistory;

  bool aiResponding = false;

  String inputContent = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for writingIndicator_1 component.
  late WritingIndicator1Model writingIndicator1Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in IconButton widget.
  ApiCallResponse? chatGPTResponse;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    writingIndicator1Model =
        createModel(context, () => WritingIndicator1Model());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    writingIndicator1Model.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
