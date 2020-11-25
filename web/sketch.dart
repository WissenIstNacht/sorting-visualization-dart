import 'dart:html';
import 'StateManager.dart';

class Sketch {
  num GAME_SPEED;
  num _lastTimeStamp = 0;
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;
  StateManager s;
  String background = '#DEDEDE';

  Sketch(this.canvas, double framerate) {
    GAME_SPEED = 1000 / framerate;
    init();
  }

  void init() {
    canvas.width = 600;
    canvas.height = 400;
    ctx = canvas.getContext('2d');
    ctx.fillStyle = 'DarkRed';
    ctx.fillRect(0, 0, 600, 133);
    ctx.fillStyle = '#DEDEDE';
    ctx.fillRect(0, 133, 600, 133);
    ctx.fillStyle = 'navy';
    ctx.fillRect(0, 266, 600, 133);
  }

  Future run() async {
    update(await window.animationFrame);
  }

  void update(num delta) {
    final diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
      // clearCanvas();
      // if (s.is_running) {
      // s.sorter.step();
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
