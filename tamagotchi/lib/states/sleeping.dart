
import 'package:tamagotchi/states/dead.dart';
import 'package:tamagotchi/states/normal.dart';
import 'package:tamagotchi/states/sad.dart';
import 'package:tamagotchi/states/sick.dart';
import 'package:tamagotchi/states/states.dart';
import 'package:tamagotchi/states/tired.dart';
import 'package:tamagotchi/utils/rate.dart';
import 'package:tamagotchi/utils/status.dart';

class Sleeping extends State {
  Sleeping(this.name, this.icon, this.lastTime, {this.rate, this.status}) {
    if (this.status == null) this.status = Status();
    if (this.rate == null) this.rate = Rate();
  }

  @override
  State update() {
    return this;
  }

  @override
  State flush() {
    return this;
  }

  @override
  State play() {
    // TODO: implement play
    return this;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return this;
  }

  State wakeUp() {
    if (status.sad) return Sad(name, "sad",lastTime, rate: Rate(happy: 0.2), status: status);
    if (status.sick) return Sick(name, "sick",lastTime, rate: Rate(health: 0.3), status: status);
    if (status.tired) return Tired(name, "tired",lastTime, rate: Rate(happy: 0.2, hunger: 0.2), status: status);
    if (status.dead) return Dead(name, "dead", lastTime);

    return Normal("normal", status: status);
  }

  @override
  DateTime lastTime;

  @override
  String name;

  @override
  String icon;

  @override
  Rate rate;

  @override
  Status status;
}
