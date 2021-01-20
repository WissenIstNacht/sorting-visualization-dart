/**
 * @author WissenIstNacht
 * Date: 25-02-2020
 * 
 * This file contains the BubbleSort class. It implements the bubblesort algorithm in a
 * series of steps that can be visualized.
 */

import 'SortingAlgorithm.dart';

class BubbleSort extends SortingAlgorithm {
  // After pass i, the largest element of the unsorted part is guaranteed to be at the
  // i-th rightest index. Lowest denotes the currently lowest correctly placed element.
  // I.e., lowest == l - i, where i are the passes starting at 0.
  BubbleSort(arrayLength) {
    ctx = canvas.context2D;
    size = arrayLength;
    sortedIndex = size;
    direction = false;
    index = 0;

    a = List.generate(size, (int index) => index + 1);
    a.shuffle();
  }

  /** Strepwise implementation of bubblesort algorithm
   */
  @override
  void step() {
    switch (action) {
      case 0:
        //base case - all elements gray.
        render();
        action = 1;
        break;
      case 1:
        //selection mode - selected element colored blue.
        var special_elem = ArrayElement(index, Color.blue.code);
        render(special_elem, null);
        action = 2;
        break;
      case 2:
        // comparison mode - compared element either green/red, depending on correctness.
        if (a[index] > a[index + 1]) {
          var se1 = ArrayElement(index, Color.blue.code);
          var se2 = ArrayElement(index + 1, Color.red.code);
          render(se1, se2);
          action = 3;
        } else {
          var se1 = ArrayElement(index, Color.blue.code);
          var se2 = ArrayElement(index + 1, Color.green.code);
          render(se1, se2);
          action = 0;
          index++;
        }
        break;
      case 3:
        //confirmation mode - compared elements are in correct order.
        a = swap(a, index, index + 1);

        var se1 = ArrayElement(index, Color.green.code);
        var se2 = ArrayElement(index + 1, Color.green.code);
        render(se1, se2);
        action = 0;
        index++;
        break;
      default:
        break;
    }
    if (index == sortedIndex - 1) {
      index = 0;
      sortedIndex--;
    }
  }
}

/** Simple implementation of bubblesort
 * 
 * @param {array} a array that's to be sorted
 * 
 * @returns {array} sorted array.
 */
List<int> bubbleSort(List<int> a) {
  for (var j = 0; j < a.length; j++) {
    for (var i = 0; i < a.length - j - 1; i++) {
      if (a[i] > a[i + 1]) {
        a = swap(a, i, i + 1);
      }
    }
  }
  return a;
}

/** Swaps the location of two elements in an array
 * 
 * @param {array} a
 * @param {number} i Location of element in array
 * @param {number} j Location of element in array
 * 
 * @returns {array} sorted array.
 */
List<int> swap(List<int> a, int i, int j) {
  var t = a[i];
  a[i] = a[j];
  a[j] = t;
  return a;
}
