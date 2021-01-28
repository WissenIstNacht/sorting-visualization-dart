import 'dart:html';

import 'sorting_algorithm.dart';
import 'state.dart';

class StateManager {
  State _curr_state;

  StateManager(initial_state) {
    _curr_state = initial_state;
    _curr_state.update();
  }

  // Provides client with the ability to change state based on current situation and
  void changeState(String event) {
    print('printing old state: $_curr_state');
    _curr_state = _curr_state.next(event);
    print('printing old state: $_curr_state');
    _curr_state.update();
  }
}
