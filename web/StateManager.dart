import 'dart:html';

import 'animation_loop.dart';
// import 'insertionSort.dart';
// import 'bubbleSort.dart';
import 'BubbleSort.dart';
import 'SortingAlgorithm.dart';
import 'state.dart';

class StateManager {
  num framerate = 2.0;
  AnimationLoop loop;

  Map<State, Map<String, State>> graph;
  IdleState idle_state;
  RunningState running_state;
  PausingState pausing_state;
  State _curr_state;

  SortingAlgorithm sorter;

  final ButtonElement _run = querySelector('#b_run');
  final ButtonElement _reset = querySelector('#b_reset');
  final SelectElement _mode = querySelector('#dd_mode');

  StateManager() {
    sorter = BubbleSort(10);
    loop = AnimationLoop(framerate);
    _run.onClick.listen((_) => changeState('run'));
    _reset.onClick.listen((_) => changeState('reset'));

    idle_state = IdleState(sorter, loop, _run);
    running_state = RunningState(sorter, loop, _run);
    pausing_state = PausingState(sorter, loop, _run);
    _curr_state = idle_state;

    graph = <State, Map<String, State>>{
      idle_state: <String, State>{'run': running_state},
      running_state: <String, State>{'reset': idle_state, 'run': pausing_state},
      pausing_state: <String, State>{'reset': idle_state, 'run': running_state}
    };
  }

  void changeState(String event) {
    var children = graph[_curr_state];
    _curr_state = children[event];
    _curr_state.update();
  }
}
