import 'dart:html';

import 'sketch.dart';

CanvasElement canvas;
CanvasRenderingContext2D ctx;

void main() {
  Sketch(querySelector('#canvasHolder'), 2.0).run();
}
