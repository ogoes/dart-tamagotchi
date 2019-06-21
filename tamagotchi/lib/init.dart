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

    pet = a == '1'
        ? pet.feed()
        : a == '2'
            ? pet.flush()
            : a == '3'
                ? pet.play()
                : a == '4' ? pet.cure() : a == '5' ? pet.sleeping() : pet;

    // if (a == '1') {
    //   pet.feed();
    // } else if (a == '2') {
    //   pet.flush();
    // } else if (a == '3') {
    //   pet.play();
    // } else if (a == '4') {
    //   pet.cure();
    // } else if (a == '5') {
    //   pet.sleeping();
    // }
    pet = pet.update();

    print(pet);
    print("icon ${pet.icon}");
    print("name ${pet.name}");
    print("health ${pet.status.health}");
    print("happy ${pet.status.happy}");
    print("hunger ${pet.status.hunger}");

  }
}
