import 'dart:html';
import 'main.dart';

class Sketch {
  num GAME_SPEED;
  num _lastTimeStamp = 0;

  Sketch(double framerate) {
    GAME_SPEED = 1000 / framerate;
    init();
  }

  void init() {
    //TODO:
  }

  Future run() async {
    update(await window.animationFrame);
  }

  void update(num delta) {
    final diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
      clearCanvas();
      // if (s.is_running) {
      //   s.sorter.step();
      // }
    }
    run();
  }

  void clearCanvas() {
    ctx
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height)
      ..strokeStyle = 'black'
      ..strokeRect(0, 0, canvas.width, canvas.height);
  }
}
