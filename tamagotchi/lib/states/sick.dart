import 'package:tamagotchi/states/states.dart';
import 'package:tamagotchi/utils/rate.dart';
import 'package:tamagotchi/utils/status.dart';

class Sick extends State {

  Sick(this.name, this.icon, this.lastTime, {this.status, this.rate}) {
    if (this.status == null) this.status = Status();
    if (this.rate == null) this.rate = Rate();
  }

  @override
  State cure() {
    status.health += (rate.health * 100); //
    if (status.health > 100) status.health = 100;
    return this;
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
