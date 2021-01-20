import 'dart:html';

import 'animation_loop.dart';
import 'SortingAlgorithm.dart';

abstract class State {
  SortingAlgorithm sketch;
  AnimationLoop loop;

  void update();
}

class IdleState extends State {
  final ButtonElement _run;

  IdleState(SortingAlgorithm sketch, AnimationLoop loop, this._run) {
    super.loop = loop;
    super.sketch = sketch;
  }

  @override
  void update() {
    loop.stop();
    sketch.clearCanvas();
    _run.text = 'Run';
  }
}

class RunningState extends State {
  ButtonElement _run;

  RunningState(SortingAlgorithm sketch, AnimationLoop loop, this._run) {
    super.loop = loop;
    super.sketch = sketch;
  }

  @override
  void update() {
    loop.run(sketch.step);
    _run.text = 'Pause';
  }
}

class PausingState extends State {
  final ButtonElement _run;

  PausingState(SortingAlgorithm sketch, AnimationLoop loop, this._run) {
    super.sketch = sketch;
    super.loop = loop;
  }

  @override
  void update() {
    loop.stop();
    _run.text = 'Continue';
  }
}
