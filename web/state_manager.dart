import 'state.dart';

class StateManager {
  State _curr_state;

  /// Initialize the state manager with an initial state.
  ///
  /// The states [update()] method will immediately be executed.
  StateManager(initial_state) {
    _curr_state = initial_state;
    _curr_state.update();
  }

  /// Changes the current state.
  ///
  /// Provides client with the ability to change state based on both the current state as
  /// well as an [input] argument.
  void changeState(String input) {
    _curr_state = _curr_state.next(input);
    _curr_state.update();
  }
}
