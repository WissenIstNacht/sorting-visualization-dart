import 'dart:html';
import 'StateManager.dart';
import 'main.dart';

class Sketch {
  num _lastTimeStamp = 0;
  StateManager s = StateManager();
  num GAME_SPEED;

  Sketch(double framerate) {
    GAME_SPEED = 1000 / framerate;
    ctx.fillStyle = colors['gray'];
  }

  Future run() async {
    update(await window.animationFrame);
  }

  void update(num delta) {
    final diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
      _clearCanvas();
      if (s.is_running) {
        s.sorter.step();
      }
    }
    run();
  }

  void _clearCanvas() {
    ctx
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height)
      ..strokeStyle = 'black'
      ..strokeRect(0, 0, canvas.width, canvas.height);
  }
}
