import 'package:flutter/material.dart';
import '../storage/local_storage.dart';

class LocaleProvider extends ChangeNotifier {
  final LocalStorage _storage;
  Locale _locale = const Locale('es');

  LocaleProvider(this._storage);

  Locale get locale => _locale;

  static const Map<String, String> _backendToFlutter = {
    'es': 'es',
    'cat': 'ca',
    'ca': 'ca',
    'en': 'en',
  };

  static const Map<String, String> _flutterToBackend = {
    'es': 'es',
    'ca': 'cat',
    'en': 'en',
  };

  String get backendCode => _flutterToBackend[_locale.languageCode] ?? 'es';

  Future<void> loadSavedLocale() async {
    final saved = await _storage.getString('selected_language');
    if (saved != null) {
      _locale = Locale(_backendToFlutter[saved] ?? 'es');
      notifyListeners();
    }
  }

  Future<void> changeLocale(String backendCode) async {
    final flutterCode = _backendToFlutter[backendCode] ?? 'es';
    _locale = Locale(flutterCode);
    await _storage.setString('selected_language', backendCode);
    notifyListeners();
  }
}