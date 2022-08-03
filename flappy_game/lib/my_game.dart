
class MyGame extends BaseGame with TabDectector{
  Bird _bird;
  Floor _floor;

  MyGame() {
    _bird = Bird();
    _floor = Floor();

    this
      ..add(SpriteComponent.fromSprite(
          size?.width, size?.height, Sprite("bg.png")))
      ..add(Bird());
  }
}