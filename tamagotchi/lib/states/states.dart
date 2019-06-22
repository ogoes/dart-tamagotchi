import 'dart:math';

import 'package:tamagotchi/states/dead.dart';
import 'package:tamagotchi/states/normal.dart';
import 'package:tamagotchi/states/sad.dart';
import 'package:tamagotchi/states/sick.dart';
import 'package:tamagotchi/states/tired.dart';
import 'package:tamagotchi/utils/rate.dart';
import 'package:tamagotchi/utils/status.dart';

class State {
  String icon;
  String name;

  DateTime lastTime;

  Status status;
  Rate rate;

  Duration deltaTime() {
    return lastTime.difference(DateTime.now());
  }

  set time(DateTime time) {
    lastTime = time;
  }

  void sleep () {
    status.sleep = true;
  }

  State feed() {
    if (status.hunger >= 100)
      return Sick(
        name,
        "sick",
        lastTime,
        rate: Rate(health: 0.3),
        status: Status(
          health: 25,
          hunger: status.hunger,
          happy: status.happy,
          dirt: status.dirt,
        ),
      );

    status.hunger += (100 * rate.hunger);
    status.hunger = status.hunger > 100 ? 100 : status.hunger;

    return this;
  }

  State flush() {
    status.dirty = false;
    return this;
  }

  State play() {
    if (status.happy <
        100 - (rate.happy * 200)) // aumenta a felicidade em 20 no estado normal
      status.happy += (rate.happy * 200);

    if (status.hunger > 10) // diminui a satisfação em 10
      status.hunger -= 10;
    else if (status.hunger > 5) // diminui a satisfação em 10
      status.hunger -= 5;

    return this;
  }

  State cure() {
    if (status.health > 90) {
      status.health = 24;
    } else {
      status.health += (rate.health * 100);
      status.health = status.health > 100 ? 100 : status.health;
    }

    return this;
  }


  State update() {
    Duration deltaTime = this.deltaTime();

    if (deltaTime.inHours > 8) status.dirty = true;

    status.health -= (rate.health * (pow(deltaTime.inSeconds, 2) / 18));
    status.hunger -= (rate.hunger * (pow(deltaTime.inSeconds, 2) / 18));
    status.happy -= (rate.happy * (pow(deltaTime.inSeconds, 2) / 18));

    time = DateTime.now();

    if (status.dead)
      return Dead(
        name,
        "dead",
        lastTime,
        rate: rate,
        status: status,
      );
    if (status.sick)
      return Sick(
        name,
        "sick",
        lastTime,
        rate: Rate(health: 0.3, happy: 0.15, hunger: 0.15),
        status: status,
      );
    if (status.tired)
      return Tired(
        name,
        "tired",
        lastTime,
        rate: Rate(happy: 0.2, hunger: 0.2),
        status: status,
      );
    if (status.sad)
      return Sad(
        name,
        "sad",
        lastTime,
        rate: Rate(happy: 0.2),
        status: status,
      );

    return Normal(
      "normal",
      name: name,
      time: lastTime,
      status: status,
    );
  }
}
