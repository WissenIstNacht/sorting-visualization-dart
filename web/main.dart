import 'dart:html';

CanvasElement canvas;
CanvasRenderingContext2D ctx;

void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  canvas = querySelector('#canvasHolder');
  canvas.width = 600;
  canvas.height = 400;
  ctx = canvas.getContext('2d');
  ctx.fillStyle = 'DarkRed';
  ctx.fillRect(0, 0, 600, 133);
  ctx.fillStyle = 'white';
  ctx.fillRect(0, 133, 600, 133);
  ctx.fillStyle = 'navy';
  ctx.fillRect(0, 266, 600, 133);
  // Sketch(60).run();
}
