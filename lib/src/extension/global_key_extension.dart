import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension GlobalKeyExtension on GlobalKey {
  RenderRepaintBoundary get renderRepaintBoundary =>
      (currentContext?.findRenderObject() as RenderRepaintBoundary?) ??
      RenderRepaintBoundary();
}
