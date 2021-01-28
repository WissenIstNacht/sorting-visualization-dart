import 'dart:html';

import 'bubble_sort.dart';
import 'insertion_sort.dart';
import 'main.dart';
import 'sorting_algorithm.dart';

abstract class State {
  State next(String arg);
  void update();
}

class InitialState extends State {
  Sketch s = Sketch();

  @override
  void update() {}

  @override
  State next(String arg) {
    print('entering "next"');
    StartingState new_state = StartingState('s');
    print('creating new state: $new_state');
    return new_state;
  }
}

class StartingState extends State {
  final SelectElement _mode = querySelector('#dd_mode');
  final InputElement _size = querySelector('#tf_arraySize');
  SortingAlgorithm new_mode;
  String st;

  StartingState(this.st);

  @override
  void update() {
    var new_size = int.parse(_size.value);
    print('This is the new size: $new_size');
    // var new_mode;
    switch (_mode.value) {
      case 'bubbleSort':
        new_mode = BubbleSort(new_size);
        break;
      case 'insertionSort':
        new_mode = InsertionSort(new_size);
        break;
      default:
        new_mode = BubbleSort(new_size);
    }
    print(new_mode);
    s.changeState('');
  }

  @override
  State next(String arg) {
    return RunningState(new_mode);
  }
}

class RunningState extends State {
  SortingAlgorithm sketch;

  RunningState(this.sketch);

  @override
  void update() {
    loop.run(sketch.step);
    run.text = 'Pause';
  }

  @override
  State next(String arg) {
    switch (arg) {
      case 'run':
        return PausingState(sketch);
      case 'reset':
        return ResettingState(sketch);
      default:
        throw Exception('Illegal transition argument');
    }
  }
}

class PausingState extends State {
  SortingAlgorithm sketch;

  PausingState(this.sketch);

  @override
  void update() {
    loop.stop();
    run.text = 'Continue';
  }

  @override
  State next(String arg) {
    switch (arg) {
      case 'run':
        return RunningState(sketch);
        break;
      case 'reset':
        return ResettingState(sketch);
        break;
      default:
        throw Exception('Illegal transition argument');
    }
  }
}

class ResettingState extends State {
  SortingAlgorithm sketch;

  ResettingState(this.sketch);

  @override
  void update() {
    loop.stop();
    sketch.clearCanvas();
    run.text = 'Run';
  }

  @override
  State next(String arg) {
    return StartingState('s');
  }
}
