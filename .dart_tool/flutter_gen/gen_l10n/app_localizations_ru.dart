import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Flutter i18n';

  @override
  String get hintText => ' Поиск';

  @override
  String get home1 => 'Главная';

  @override
  String get favorites => 'Избранное';

  @override
  String get articles => 'Блог';

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get theme => 'Темная тема';

  @override
  String get snakbartitle1 => 'Вы добавили в Избранное';

  @override
  String get snakbartitle2 => 'Вы удалили из Избранных';
}
