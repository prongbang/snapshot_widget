import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

/// How to used:
///   final GlobalKey _globalKey = GlobalKey();
///   final renderRepaintBoundary = _globalKey.currentContext.findRenderObject();
///   final imageSnapshotUtility = ImageSnapshotUtility();
///   final imageBytes = imageSnapshotUtility.toByteData(_globalKey.currentContext.findRenderObject(), pixelRatio: 16 / 9);
///
abstract class SnapshotUtility {
  Future<Uint8List> toByteData(RenderRepaintBoundary request,
      {double pixelRatio});
}

class ImageSnapshotUtility implements SnapshotUtility {
  @override
  Future<Uint8List> toByteData(RenderRepaintBoundary request,
      {double pixelRatio = 16 / 9}) async {
    try {
      ui.Image image = await request.toImage(pixelRatio: pixelRatio);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png) ?? ByteData(0);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      return Uint8List.fromList([]);
    }
  }
}
