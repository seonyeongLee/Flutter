import 'package:flame/anchor.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flappy_game/main.dart';

final double BIRD_W = 52;
final double BIRD_H = 36.7;
final double GRAVITY = 100;

class Bird extends AnimationComponent {
  Bird()
      : super.sequenced(BIRD_W, BIRD_H, 'bird.png', 3,
            textureWidth: 17, textureHeight: 12);

  double timepassed = 0.0;

  @override
  void update(double t) {
    super.update(t);
    timepassed += t;
    this.anchor = Anchor.center;
    this.y = timepassed * 30;
    this.x = size!.width / 2;
    print(timepassed);
  }

}
