import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Flutter i18n';

  @override
  String get hintText => ' Поиск...';

  @override
  String get home1 => 'Дом';

  @override
  String get favorites => 'Сохраненные';

  @override
  String get articles => 'Статьи';

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык приложения';

  @override
  String get theme => 'Тема';

  @override
  String get snakbartitle1 => 'Вы добавили в Сохраненные';

  @override
  String get snakbartitle2 => 'Вы удалили из Сохраненных';
}
