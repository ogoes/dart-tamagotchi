abstract class State {
  String icon;
  String name;

  double hunger;
  double health;
  double happy;
  double dirt;

  State feed();
  State flush();
  State play();
  State cure();
  State sleeping();
  State update();
  
}

class Normal extends State {

  @override
  update() {
    // TODO: implement update
    return null;
  }

  @override
  State cure() {
    // TODO: implement cure
    return null;
  }

  @override
  State feed() {
    // TODO: implement feed
    return null;
  }

  @override
  State flush() {
    // TODO: implement flush
    return null;
  }

  @override
  State play() {
    // TODO: implement play
    return null;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return null;
  }

}


class Sick extends State {

  @override
  State update() {
    // TODO: implement update
    return null;
  }

  @override
  State cure() {
    // TODO: implement cure
    return null;
  }

  @override
  State feed() {
    // TODO: implement feed
    return null;
  }

  @override
  State flush() {
    // TODO: implement flush
    return null;
  }

  @override
  State play() {
    // TODO: implement play
    return null;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return null;
  }

}

class Tired extends State {

  @override
  State update() {
    // TODO: implement update
    return null;
  }

  @override
  State cure() {
    // TODO: implement cure
    return null;
  }

  @override
  State feed() {
    // TODO: implement feed
    return null;
  }

  @override
  State flush() {
    // TODO: implement flush
    return null;
  }

  @override
  State play() {
    // TODO: implement play
    return null;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return null;
  }

}

class Dirty extends State {
  @override
  update() {
    // TODO: implement update
    return null;
  }

  @override
  State cure() {
    // TODO: implement cure
    return null;
  }

  @override
  State feed() {
    // TODO: implement feed
    return null;
  }

  @override
  State flush() {
    // TODO: implement flush
    return null;
  }

  @override
  State play() {
    // TODO: implement play
    return null;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return null;
  }

}

class Sad extends State {
  @override
  update() {
    // TODO: implement update
    return null;
  }

  @override
  State cure() {
    // TODO: implement cure
    return null;
  }

  @override
  State feed() {
    // TODO: implement feed
    return null;
  }

  @override
  State flush() {
    // TODO: implement flush
    return null;
  }

  @override
  State play() {
    // TODO: implement play
    return null;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return null;
  }
}

class Sleeping extends State {
  @override
  State update() {
    // TODO: implement update
    return null;
  }

  @override
  State cure() {
    // TODO: implement cure
    return null;
  }

  @override
  State feed() {
    // TODO: implement feed
    return null;
  }

  @override
  State flush() {
    // TODO: implement flush
    return null;
  }

  @override
  State play() {
    // TODO: implement play
    return null;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return null;
  }

}

class Dead extends State {
  @override
  update() {
    // TODO: implement update
    return null;
  }

  @override
  State cure() {
    // TODO: implement cure
    return null;
  }

  @override
  State feed() {
    // TODO: implement feed
    return null;
  }

  @override
  State flush() {
    // TODO: implement flush
    return null;
  }

  @override
  State play() {
    // TODO: implement play
    return null;
  }

  @override
  State sleeping() {
    // TODO: implement sleeping
    return null;
  }
}
