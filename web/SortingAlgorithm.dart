/*
 * @author WissenIstNacht
 * Date: 
 *
 * This file contains a super class that provide generic code for implementing a sorting
 * algorithm visualization.  
 *
 */

import 'main.dart';

abstract class SortingAlgorithm {
  List<int> a;
  int size, lowest, action, index;

  // SortingAlgorithm(this.size) {
  //   a = List.generate(size, (int index) => index++);
  //   a.shuffle();

  //   lowest = size;
  //   index = 0;
  //   action = 0;
  // }

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
      } else if (k >= lowest) {
        ctx.fillStyle = colors['green'];
      } else {
        ctx.fillStyle = colors['gray'];
      }
      var rect_x = canvas.width / 20 + k * (r + 1) * unit;
      var rect_h = map(a[k].toDouble(), 1, size.toDouble(), canvas.height / 20,
          9 * canvas.height / 10);

      ctx.fillRect(rect_x, rect_y, rect_w, rect_h);
      ctx.strokeRect(rect_x, rect_y, rect_w, rect_h);
    }
  }

  double map(
      double value, double from_a, double from_b, double to_a, double to_b) {
    var centered_value = value - from_a;
    var from_delta = from_b - from_a;
    var to_delta = to_b - to_a;
    var ratio = to_delta * centered_value / from_delta;
    return ratio + to_a;
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
