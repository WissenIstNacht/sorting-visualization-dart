import 'stateManager.dart';
// import 'sketch.dart';

// CanvasElement canvas;
// CanvasRenderingContext2D ctx;

void main() {
  // canvas = querySelector('#canvasHolder');
  // ctx = canvas.getContext('2d');
  // canvas.height = 400;
  // canvas.width = 600;
  // ctx
  //   ..scale(1, -1)
  //   ..translate(0, -canvas.height);
  // ctx
  //   ..lineWidth = 2
  //   ..fillStyle = Color.gray.code
  //   ..fillRect(0, 0, canvas.width, canvas.height)
  //   ..strokeRect(0, 0, canvas.width, canvas.height);
  // Sketch(2.0).run();
  final s = StateManager();
}

double map(double value, double from_a, double from_b, double to_a, double to_b) {
  var centered_value = value - from_a;
  var from_delta = from_b - from_a;
  var to_delta = to_b - to_a;
  var ratio = to_delta * centered_value / from_delta;
  return ratio + to_a;
}

enum Color { red, blue, green, gray }

extension ColorCode on Color {
  String get code {
    switch (this) {
      case Color.red:
        return '#ff98b2';
      case Color.blue:
        return '#98e5ff';
      case Color.green:
        return '#98ffcc';
      case Color.gray:
        return '#DEDEDE';
      default:
        return null;
    }
  }
}
