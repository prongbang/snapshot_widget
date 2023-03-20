library snapshot_widget;

import 'package:flutter/material.dart';
import 'package:snapshot_widget/src/controller/snapshots_controller.dart';

export 'src/controller/snapshots_controller.dart';
export 'src/extension/global_key_extension.dart';
export 'src/utility/snapshots_utility.dart';

class SnapshotsWidget extends StatelessWidget {
  final SnapshotsController? controller;
  final Widget child;

  const SnapshotsWidget({Key? key, required this.child, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: controller?.key,
      child: child,
    );
  }
}
