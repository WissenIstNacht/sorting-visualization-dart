/*
 * @author WissenIstNacht
 * Date: 
 *
 * This file contains a super class that provide generic code for implementing a sorting
 * algorithm visualization.  
 */

import 'dart:html';

abstract class SortingAlgorithm {
  List<int> a;
  int action = 0, sortedIndex = 0;
  int index, size;
  bool direction; //determines which side of sorted index is green/gray.

  final CanvasElement canvas = querySelector('#canvasHolder');
  CanvasRenderingContext2D ctx;

  SortingAlgorithm() {
    ctx = canvas.context2D;
    canvas.width = 600;
    canvas.height = 400;

    ctx
      ..scale(1, -1)
      ..translate(0, -canvas.height);
    clearCanvas();
  }

  void step();

  /// Draws the rectangles representing the elements on the canvas.
  ///
  /// Elements that are displayed as grey rectangles. However, some elements are
  /// highlighted to improve visualization. This can be done by passing (0, 1 or 2) column
  /// objects to the method.
  ///
  /// @param {ArrayElement} special_elem1 First highlighted element
  /// @param {ArrayElement} special_elem2 Second highlighted element
  void render([ArrayElement special_elem1, ArrayElement special_elem2]) {
    clearCanvas();

    // get indices if there are special elements to highlight.
    special_elem1 ??= ArrayElement.none();
    special_elem2 ??= ArrayElement.none();

    var r = 4;
    var unit = canvas.width * 0.9 / (size * (r + 1) - 1);
    var rect_y = canvas.height / 20;
    var rect_w = r * unit;

    //draw array elements, taking into account special elements
    for (var k = 0; k < size; k++) {
      if (k == special_elem1.index) {
        ctx.fillStyle = special_elem1.color;
      } else if (k == special_elem2.index) {
        ctx.fillStyle = special_elem2.color;
      } else {
        if (direction && k < sortedIndex) {
          ctx.fillStyle = Color.green.code;
        } else if (!direction && k >= sortedIndex) {
          ctx.fillStyle = Color.green.code;
        } else {
          ctx.fillStyle = Color.gray.code;
        }
      }

      var rect_x = canvas.width / 20 + k * (r + 1) * unit;
      var rect_h = map(a[k].toDouble(), 1, size.toDouble(), canvas.height / 20,
          9 * canvas.height / 10);

      ctx
        ..fillRect(rect_x, rect_y, rect_w, rect_h)
        ..lineWidth = 2
        ..strokeRect(rect_x, rect_y, rect_w, rect_h);
    }
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

class ArrayElement {
  int index;
  String color;

  ArrayElement(this.index, this.color);
  ArrayElement.none() {
    index = -1;
    color = '';
  }
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

double map(double value, double from_a, double from_b, double to_a, double to_b) {
  var centered_value = value - from_a;
  var from_delta = from_b - from_a;
  var to_delta = to_b - to_a;
  var ratio = to_delta * centered_value / from_delta;
  return ratio + to_a;
}
