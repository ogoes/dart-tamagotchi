import 'dart:math';

import 'package:tamagotchi/states/dead.dart';
import 'package:tamagotchi/states/sad.dart';
import 'package:tamagotchi/states/sick.dart';
import 'package:tamagotchi/states/states.dart';
import 'package:tamagotchi/states/tired.dart';
import 'package:tamagotchi/utils/rate.dart';
import 'package:tamagotchi/utils/status.dart';

class Normal extends State {
  Normal(this.icon, {this.status, this.rate, name, time}) {
    this.name = name;
    this.lastTime = time == null? DateTime.now(): time;
    if (this.status == null) this.status = Status();
    if (this.rate == null) this.rate = Rate();
  }

  

  @override
  State play() {
    return this;
  }

  @override
  Rate rate;

  @override
  Status status;

  @override
  String icon;
}
