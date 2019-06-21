class Rate {
  double hunger, happy, health;
  Rate({
    this.hunger,
    this.health,
    this.happy,
  }) {
    if (hunger == null) hunger = 0.1;
    if (health == null) health = 0.1;
    if (happy == null) happy = 0.1;
  }
}
