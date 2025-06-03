import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  static const Locale defaultLocale = Locale('ja');
  Locale _currentLocale = defaultLocale;
  bool _isInitialized = false;

  Locale get currentLocale => _currentLocale;

  void initialize(BuildContext context) {
    if (!_isInitialized) {
      // Always default to Japanese if no locale is set
      _currentLocale = EasyLocalization.of(context)?.currentLocale ?? defaultLocale;
      _isInitialized = true;
    }
  }

  Future<void> changeLanguage(String languageCode, BuildContext context) async {
    final newLocale = languageCode == 'en' 
        ? const Locale('en')
        : defaultLocale;
    
    // Update state
    _currentLocale = newLocale;
    notifyListeners();

    // Update EasyLocalization
    await EasyLocalization.of(context)?.setLocale(newLocale);
  }
}

// Global key to access context from anywhere
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); 