
import 'package:tamagotchi/states/states.dart';
import 'package:tamagotchi/utils/rate.dart';
import 'package:tamagotchi/utils/status.dart';

class Tired extends State {
  Tired(this.name, this.icon, this.lastTime, {this.rate, this.status}) {
    if (this.status == null) this.status = Status();
    if (this.rate == null) this.rate = Rate();
  }

  @override
  State update() {
    // TODO: implement update
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
