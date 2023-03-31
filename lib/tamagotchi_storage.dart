import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamagotchi_app/tamagotchi.dart';

class TamagotchiStorage {
  static const String _tamagotchiKey = 'tamagotchi';

  Future<void> saveTamagotchi(Tamagotchi tamagotchi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tamagotchiJson = jsonEncode({
      'hunger': tamagotchi.hunger,
      'happiness': tamagotchi.happiness,
      'cleanliness': tamagotchi.cleanliness,
    });
    prefs.setString(_tamagotchiKey, tamagotchiJson);
  }

  Tamagotchi? loadTamagotchi(SharedPreferences prefs) {
    String? tamagotchiJson = prefs.getString(_tamagotchiKey);
    if (tamagotchiJson != null) {
      Map<String, dynamic> tamagotchiMap = jsonDecode(tamagotchiJson);
      return Tamagotchi(
        hunger: tamagotchiMap['hunger'],
        happiness: tamagotchiMap['happiness'],
        cleanliness: tamagotchiMap['cleanliness'],
      );
    }
    return null;
  }
}
