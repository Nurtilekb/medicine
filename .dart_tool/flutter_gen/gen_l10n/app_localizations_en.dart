import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter i18nnnn';

  @override
  String get hintText => ' Search';

  @override
  String get home1 => 'Home';

  @override
  String get favorites => 'Favorites';

  @override
  String get articles => 'Articles';

  @override
  String get settings => 'settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Dark theme';

  @override
  String get snakbartitle1 => 'You have added to Favorites';

  @override
  String get snakbartitle2 => 'You have been removed from Favorites';
}
