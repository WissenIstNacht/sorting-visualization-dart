import 'dart:html';

import 'sketch.dart';

CanvasElement canvas;
CanvasRenderingContext2D ctx;
Map<String, String> colors = {
  'gray': '#DEDEDE',
  'red': '#ff98b2',
  'green': '#98ffcc',
  'blue': '#98e5ff',
};

void main() {
  canvas = querySelector('#canvasHolder');
  ctx = canvas.getContext('2d');
  canvas.height = 400;
  canvas.width = 600;
  ctx.scale(1, -1);
  ctx.translate(0, -canvas.height);
  ctx.lineWidth = 2;
  Sketch(2.0).run();
}
