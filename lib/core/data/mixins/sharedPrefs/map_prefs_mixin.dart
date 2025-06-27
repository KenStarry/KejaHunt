import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/locator.dart';

mixin MapPrefsMixin {
  final sharedPrefs = locator.get<SharedPreferences>();

  /// Store Preferred Style in Preferences
  Future<void> setMapStyles() async {
    final lightMapStyle = await rootBundle.loadString(
      'assets/json/map_styles/${'light'}_mode_style_4.json',
    );

    final darkMapStyle = await rootBundle.loadString(
      'assets/json/map_styles/dark_mode_style_4.json',
    );

    sharedPrefs.setString('light-map', lightMapStyle);
    sharedPrefs.setString('dark-map', darkMapStyle);
  }

  Map<String, dynamic> getMapStyles() {
    final lightMap = sharedPrefs.getString("light-map");
    final darkMap = sharedPrefs.getString("dark-map");

    return {"light-map": lightMap, "dark-map": darkMap};
  }
}
