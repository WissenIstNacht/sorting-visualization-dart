import 'dart:html';

import 'insertionSort.dart';
import 'bubbleSort.dart';
import 'sortingAlgorithm.dart';

/**
 * @author WissenIstNacht
 * 
 * This class implements a state machine that manages the page's state. 
 * 
 * The machine manages 3 states: An idle state (0), a running state (1) and a
 * pausing state(1). The next state is determined as a function of the user's 
 * press of a button and the current state. 
 */

class StateManager {
  bool is_running = false;
  SortingAlgorithm sorter;

  int _state = 0;
  final ButtonElement _b_run = querySelector('#b_run');
  final ButtonElement _b_reset = querySelector('#b_reset');
  final TextInputElement _tf_arraySize = querySelector('#tf_arraySize');
  final SelectElement _dd_form = querySelector('#dd_form');

  StateManager() {
    _b_run.onClick.listen((event) => {pressedRun()});
    _b_reset.onClick.listen((event) => {pressedReset()});
  }

  // The following methods change the page's state
  void idle2run() {
    // if text field is empty when run is pressed, visualization falls back to default
    // of 10 elemensts.
    var size_input = _tf_arraySize.value;
    var numb_Elements = size_input.isEmpty ? 10 : int.parse(size_input);

    var algo_type = _dd_form.value;
    switch (algo_type) {
      case 'bubbleSort':
        print('works?');
        sorter = BubbleSort(numb_Elements);
        break;
      case 'insertionSort':
        sorter = InsertionSort(numb_Elements);
        break;
      default:
        //TODO deal with inexistent value
        break;
    }
    _state = 1;
    _b_reset.disabled = false;
    is_running = true;
    _b_run.text = 'Pause';
  }

  void run2pause() {
    _state = 2;
    is_running = false;
    _b_run.text = 'Continue';
  }

  void pause2run() {
    _state = 1;
    is_running = true;
    _b_run.text = 'Pause';
  }

  void any2idle() {
    _state = 0;
    is_running = false;
    _b_reset.disabled;
    _b_run.text = 'Run';
  }

  // // The following methods determine the next state based on the user input and
  // // the current state.

  void pressedRun() {
    switch (_state) {
      case 0:
        idle2run();
        break;
      case 1:
        run2pause();
        break;
      case 2:
        pause2run();
        break;
      default:
        print('State machine in undefined state!');
        break;
    }
  }

  void pressedReset() {
    any2idle();
  }
}
