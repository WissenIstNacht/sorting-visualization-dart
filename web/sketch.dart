import 'dart:html';

/// Basic wrapper around canvas and drawing context.
///
/// Provides utility methods that are used in several places throughout the app.
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

  /// Displays a message.
  ///
  /// The specified message is displayed in gray in the center of a blank canvas.
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

  /// Produces a blank canvas.
  ///
  /// The cleared canvas contains nothing but a white background and a black border.
  void clearCanvas() {
    ctx
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height)
      ..strokeStyle = 'black'
      ..lineWidth = 2
      ..strokeRect(1, 1, canvas.width - 2, canvas.height - 2);
  }

  double map(double value, double from_a, double from_b, double to_a, double to_b) {
    var centered_value = value - from_a;
    var from_delta = from_b - from_a;
    var to_delta = to_b - to_a;
    var ratio = to_delta * centered_value / from_delta;
    return ratio + to_a;
  }
}
