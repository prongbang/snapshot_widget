import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snapshot_widget/snapshot_widget.dart';

class SnapshotController {
  final GlobalKey _globalKey = GlobalKey();
  final SnapshotUtility _snapshotUtility = ImageSnapshotUtility();

  GlobalKey get key => _globalKey;

  RenderRepaintBoundary get renderObject => _globalKey.renderRepaintBoundary;

  Future<Uint8List> value({double pixelRatio = 1}) => _snapshotUtility
      .toByteData(_globalKey.renderRepaintBoundary, pixelRatio: pixelRatio);
}
