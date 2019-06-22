class Status {
  double health;
  double happy;
  double hunger;
  bool dirt;
  bool sleeping;

  bool get dead {
    if (health <= 0 || happy <= 0 || hunger <= 0) return true;
    return false;
  }

  bool get sick {
    if (health <= 25) return true;
    return false;
  }

  bool get sad {
    if (happy < 25) return true;
    return false;
  }

  bool get tired {
    if (happy < 40 && hunger < 40) return true;
    return false;
  }


  bool get isDirt {
    return dirt;
  }

  bool get isSleeping {
    return sleeping;
  }

  set dirty (bool d) {
    this.dirt = d;
  }

  set sleep (bool s) {
    this.sleeping = s;
  }

  Status({this.health, this.happy, this.hunger, this.dirt}) {
    if (health == null) health = 100.0;
    if (happy == null) happy = 100.0;
    if (hunger == null) hunger = 100.0;
    if (dirt == null) dirty = false;
  }
}
