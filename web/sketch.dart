import 'dart:html';

/// Basic wrapper around canvas and drawing context.
///
/// Provides utility methods that are used in several places throughout the app.
class Sketch {
  final CanvasElement canvas = querySelector('#canvas');
  CanvasRenderingContext2D ctx;

  Sketch() {
    final DivElement canvasHolder = querySelector('#canvasHolder');
    final holderWidth = canvasHolder.clientWidth;
    ctx = canvas.context2D;
    canvas.width = holderWidth;
    canvas.height = holderWidth * 2 ~/ 3;

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
      ..font = '700 32px Avenir'
      ..fillStyle = getColor()
      ..fillText(message, canvas.width / 2, -canvas.height / 2)
      ..strokeText(message, canvas.width / 2, -canvas.height / 2)
      ..scale(1, -1);
  }

  /// Produces a blank canvas.
  ///
  /// The cleared canvas contains nothing but a white background and a black border.
  void clearCanvas() {
    ctx
      ..fillStyle = getBackgroundColor()
      ..fillRect(0, 0, canvas.width, canvas.height);
  }

  double map(
      double value, double from_a, double from_b, double to_a, double to_b) {
    var centered_value = value - from_a;
    var from_delta = from_b - from_a;
    var to_delta = to_b - to_a;
    var ratio = to_delta * centered_value / from_delta;
    return ratio + to_a;
  }

  String getBackgroundColor() {
    final bgColor = window.matchMedia('(prefers-color-scheme:dark)').matches
        ? '#434c5e'
        : 'white';
    return bgColor;
  }

  String getColor() {
    final bgColor = window.matchMedia('(prefers-color-scheme:dark)').matches
        ? 'white'
        : '#cdcdcd';
    return bgColor;
  }
}
