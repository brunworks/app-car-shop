import '/flutter_flow/flutter_flow_util.dart';
import 'upload_images_widget.dart' show UploadImagesWidget;
import 'package:flutter/material.dart';

class UploadImagesModel extends FlutterFlowModel<UploadImagesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
