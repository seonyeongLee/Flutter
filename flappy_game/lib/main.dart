import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/sprite.dart';
import 'package:flappy_game/components/bird.dart';
import 'package:flappy_game/components/floor.dart';
import 'package:flutter/material.dart';

late Size size;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  size = await Flame.util.initialDimensions();
  runApp(MyGame().widget);
}

