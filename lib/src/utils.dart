import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class WidgetsToImageController {
  GlobalKey containerKey = GlobalKey();

  /// to capture widget to image by GlobalKey in RenderRepaintBoundary
  Future<Uint8List?> capture({
    double pixelRatio = 6,
  }) async {
    try {
      /// boundary widget by GlobalKey
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      rethrow;
    }
  }
}
