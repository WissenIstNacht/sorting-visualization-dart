import 'bubbleSort.dart';
import 'main.dart';
import 'sortingAlgorithm.dart';

/**
 * @author WissenIstNacht
 *
 * This file contains the InsertionSort class. It implements the bubblesort algorithm in a
 * series of steps that can be visualized.
 */

class InsertionSort extends SortingAlgorithm {
  int highest = 1;
  bool done = false;

  InsertionSort(arrayLength) {
    size = arrayLength;
    highest = 1;
    index = 1;
    action = 0;
    lowest = 0;

    a = List.generate(size, (int index) => index + 1);
    a.shuffle();
  }

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
        var se = ArrayElement(index, Color.blue.code);
        render(se);
        action = 2;
        break;
      case 2:
        // comparison mode - compared element either green/red, depending on correctness.
        print(a);
        print(a[index]);
        if (a[index - 1] > a[index]) {
          var se1 = ArrayElement(index, Color.blue.code);
          var se2 = ArrayElement(index - 1, Color.red.code);
          render(se1, se2);
          action = 3;
        } else {
          var se1 = ArrayElement(index, Color.blue.code);
          var se2 = ArrayElement(index - 1, Color.green.code);
          render(se1, se2);
          done = true;
          action = 0;
        }
        break;
      case 3:
        print(a);
        print(a[index]);
        //confirmation mode - compared elements are in correct order.
        a = swap(a, index, index - 1);

        var se1 = ArrayElement(index, Color.green.code);
        var se2 = ArrayElement(index - 1, Color.green.code);
        render(se1, se2);
        action = 0;
        index--;
        break;
      default:
        break;
    }
    if (done) {
      highest++;
      index = highest;
      done = false;
    }
  }
}

void insertionSort(a) {
  var n = a.length;
  for (var i = 0; i < n; i++) {
    var j = i - 1;
    while (j >= 0) {
      if (a[j] > a[j + 1]) {
        a = swap(a, j, j + 1);
      } else {
        break;
      }
      j--;
    }
  }
  return a;
}
