import 'package:tamagotchi/states/normal.dart';
import 'package:tamagotchi/states/states.dart';
import 'dart:io';

void main(List<String> args) {
  State pet = Normal(
    "normal",
    name: "gord",
  );

  while (true) {
    print("\n\n1 - feed\n2 - flush\n3 - play\n4 - cure\n5 - sleeping\n\n");

    var a = stdin.readLineSync();

    if (a == '1') {
      pet = pet.feed();
    } else if (a == '2') {
      pet = pet.flush();
    } else if (a == '3') {
      pet = pet.play();
    } else if (a == '4') {
      pet = pet.cure();
    } else if (a == '5') {
      pet.sleep();
    }

    pet = pet.update();

    print(pet);
    print("icon ${pet.icon}");
    print("name ${pet.name}");
    print("health ${pet.status.health}");
    print("happy ${pet.status.happy}");
    print("hunger ${pet.status.hunger}");
  }
}
