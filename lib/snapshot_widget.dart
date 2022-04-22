library snapshot_widget;

import 'package:flutter/material.dart';
import 'package:snapshot_widget/src/controller/snapshot_controller.dart';

export 'package:snapshot_widget/src/controller/snapshot_controller.dart';
export 'package:snapshot_widget/src/extension/global_key_extension.dart';
export 'package:snapshot_widget/src/utility/snapshot_utility.dart';

class SnapshotWidget extends StatelessWidget {
  final SnapshotController? controller;
  final Widget child;

  const SnapshotWidget({Key? key, required this.child, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: controller?.key,
      child: child,
    );
  }
}
