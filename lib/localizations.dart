import 'package:flutter/material.dart';

class Delegate extends LocalizationsDelegate<AppLocalizations> {
  List<String> supportedLanguages = ['en'];

  @override
  bool isSupported(Locale locale) {
    return supportedLanguages.contains(locale.languageCode);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<dynamic> old) => false;

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }
}

class AppLocalizations {
  Locale localeName;

  AppLocalizations(this.localeName);

  static LocalizationsDelegate delegate = Delegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static String appName = 'Video Tags';

  String get clickCountText => "you have clicked";

}
