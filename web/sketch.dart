import 'dart:html';

class Sketch {
  final CanvasElement canvas = querySelector('#canvasHolder');
  CanvasRenderingContext2D ctx;

  Sketch() {
    ctx = canvas.context2D;
    canvas.width = 600;
    canvas.height = 400;

    ctx
      ..scale(1, -1)
      ..translate(0, -canvas.height);
  }

  void welcomeMessage(String message) {
    clearCanvas();
    ctx
      ..textAlign = 'center'
      ..scale(1, -1)
      ..lineWidth = 1
      ..strokeStyle = 'black'
      ..font = '800 small-caps 25px sans-serif'
      ..fillStyle = '#cacaca'
      ..fillText(message, canvas.width / 2, -canvas.height / 2)
      ..strokeText(message, canvas.width / 2, -canvas.height / 2)
      ..scale(1, -1);
  }

  void clearCanvas() {
    ctx
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height)
      ..strokeStyle = 'black'
      ..lineWidth = 2
      ..strokeRect(1, 1, canvas.width - 2, canvas.height - 2);
  }
}
