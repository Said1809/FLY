import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fly/src/model/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('init loads default settings', () async {
    final model = SettingsModel();
    await model.init();

    expect(model.themeMode, ThemeMode.light);
    expect(model.fontFamily, 'Roboto');
    expect(model.accentColor, const Color(0xFFB989FE));
  });

  test('setThemeMode persists dark theme', () async {
    final model = SettingsModel();
    await model.init();

    await model.setThemeMode(ThemeMode.dark);

    expect(model.themeMode, ThemeMode.dark);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('theme_mode'), 'dark');
  });

  test('setFontFamily and setAccentColor are saved', () async {
    final model = SettingsModel();
    await model.init();

    await model.setFontFamily('Impact');
    await model.setAccentColor(Colors.red);

    expect(model.fontFamily, 'Impact');
    expect(model.accentColor, Colors.red);
  });
}
