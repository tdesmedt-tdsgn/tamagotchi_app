import 'dart:math';

class Tamagotchi {
  int hunger;
  int happiness;
  int cleanliness;

  Tamagotchi(
      {required this.hunger,
      required this.happiness,
      required this.cleanliness});

  void feed() {
    hunger += 10;
    if (hunger > 100) hunger = 100;
  }

  void play() {
    happiness += 10;
    if (happiness > 100) happiness = 100;
  }

  void clean() {
    cleanliness += 10;
    if (cleanliness > 100) cleanliness = 100;
  }

  void decreaseStats() {
    hunger--;
    happiness--;
    cleanliness--;
  }

  void updateStats() {
    hunger = max(0, hunger - Random().nextInt(5));
    happiness = max(0, happiness - Random().nextInt(5));
    cleanliness = max(0, cleanliness - Random().nextInt(5));
  }
}
