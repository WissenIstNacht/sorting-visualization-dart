import 'dart:html';

import 'animation_loop.dart';
import 'state.dart';
import 'state_manager.dart';

StateManager s;
num framerate = 2.0;
AnimationLoop loop = AnimationLoop(framerate);

ButtonElement run = querySelector('#b_run');
ButtonElement reset = querySelector('#b_reset');

void main() {
  var initial_state = InitialState();
  s = StateManager(initial_state);

  run.onClick.listen((_) => s.changeState('run'));
  reset.onClick.listen((_) => s.changeState('reset'));
}
