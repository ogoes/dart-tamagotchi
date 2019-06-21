

import 'package:tamagotchi/states/states.dart';
import 'package:tamagotchi/utils/rate.dart';
import 'package:tamagotchi/utils/status.dart';

class Dead extends State {
  Dead(this.name, this.icon, this.lastTime, {this.rate, this.status}) {
    if (this.status == null) this.status = Status();
    if (this.rate == null) this.rate = Rate();
  }

  @override
  update() {
    return this;
  }

  @override
  State cure() {
    return this;
  }

  @override
  State feed() {
    return this;
  }

  @override
  State flush() {
    return this;
  }

  @override
  State play() {
    return this;
  }

  @override
  State sleeping() {
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
