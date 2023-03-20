import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snapshot_widget/src/extension/global_key_extension.dart';
import 'package:snapshot_widget/src/utility/snapshots_utility.dart';

class SnapshotsController {
  final GlobalKey _globalKey = GlobalKey();
  final SnapshotsUtility _snapshotUtility = ImageSnapshotsUtility();

  GlobalKey get key => _globalKey;

  RenderRepaintBoundary get renderObject => _globalKey.renderRepaintBoundary;

  Future<Uint8List> value({double pixelRatio = 1}) => _snapshotUtility
      .toByteData(_globalKey.renderRepaintBoundary, pixelRatio: pixelRatio);
}
