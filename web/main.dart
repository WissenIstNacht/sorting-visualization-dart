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
  print(s);

  run.onClick.listen((_) => s.changeState('run'));
  reset.onClick.listen((_) => s.changeState('reset'));
}

class Sketch {
  final CanvasElement canvas = querySelector('#canvasHolder');
  CanvasRenderingContext2D ctx;

  Sketch() {
    ctx = canvas.context2D;
    canvas.width = 600;
    canvas.height = 400;

    ctx
      ..translate(0, -canvas.height)
      ..textAlign = 'center'
      ..strokeText(
          'Press "Run" to start the animation.', canvas.width / 2, canvas.height / 2);
  }
}
