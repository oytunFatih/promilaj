// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcomeTitle => 'Promilaj';

  @override
  String get welcomeSubtitle => 'Calculadora y Rastreador Personal de BAC';

  @override
  String get heightLabel => 'Altura';

  @override
  String get heightHint => 'Ingresa la altura en cm';

  @override
  String get weightLabel => 'Peso';

  @override
  String get weightHint => 'Ingresa el peso en kg';

  @override
  String get sexLabel => 'Sexo Biológico';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get ageLabel => 'Edad';

  @override
  String get ageHint => 'Ingresa la edad en años';

  @override
  String get continueButton => 'Continuar';

  @override
  String get addDrink => 'Añadir Bebida';

  @override
  String get selectDrinkType => 'Seleccionar Tipo de Bebida';

  @override
  String get selectBrand => 'Seleccionar Marca';

  @override
  String get searchBrands => 'Buscar marcas...';

  @override
  String get amountAndTime => 'Cantidad y Tiempo';

  @override
  String get amountLabel => 'Cantidad';

  @override
  String get hoursAgoLabel => '¿Hace cuántas horas?';

  @override
  String get hours => 'h';

  @override
  String get addButton => 'Añadir';

  @override
  String get soberStatus => 'Sobrio';

  @override
  String get timeToLegalLimit => 'Tiempo hasta el límite legal';

  @override
  String get withinLegalLimit => 'Dentro del límite legal';

  @override
  String get timeToZero => 'Tiempo hasta cero';

  @override
  String get legalLimitLabel => 'Límite Legal';

  @override
  String get legalInfoButton => 'Información Legal';

  @override
  String get legalInfoNoLocation =>
      'Ubicación aún no detectada. Por favor, conceda permiso de ubicación.';

  @override
  String get settings => 'Ajustes';

  @override
  String get profileSection => 'PERFIL';

  @override
  String get languageSection => 'IDIOMA';

  @override
  String get save => 'Guardar';

  @override
  String get resetTitle => 'Reiniciar Sesión';

  @override
  String get resetMessage =>
      '¿Deseas borrar todas las bebidas y reiniciar los temporizadores?';

  @override
  String get reset => 'Reiniciar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'Aceptar';

  @override
  String get waterReminderTitle => '¡Mantente Hidratado!';

  @override
  String get waterReminderMessage => '¡No olvides beber agua! 💧';

  @override
  String get legalWarningTitle => 'Advertencia';

  @override
  String get legalWarningMessage =>
      '⚠️ Estás por encima del límite legal de conducción.';

  @override
  String get locationPermissionTitle => 'Ubicación Necesaria';

  @override
  String get locationPermissionMessage =>
      'Necesitamos tu ubicación para mostrar el límite legal de BAC para tu país.';

  @override
  String get continueWithoutLocation => 'Continuar sin ubicación';

  @override
  String get grantPermission => 'Otorgar Permiso';

  @override
  String get categoryBeer => 'CERVEZA';

  @override
  String get categoryWine => 'VINO';

  @override
  String get categorySpirits => 'DESTILADOS';

  @override
  String get categoryCocktails => 'CÓCTELES';

  @override
  String get typeLager => 'Lager';

  @override
  String get typePilsner => 'Pilsner';

  @override
  String get typeAle => 'Ale';

  @override
  String get typeStout => 'Stout';

  @override
  String get typeWheatBeer => 'Cerveza de Trigo';

  @override
  String get typeIpa => 'IPA';

  @override
  String get typeRedWine => 'Vino Tinto';

  @override
  String get typeWhiteWine => 'Vino Blanco';

  @override
  String get typeRose => 'Rosado';

  @override
  String get typeSparklingWine => 'Vino Espumoso';

  @override
  String get typeChampagne => 'Champaña';

  @override
  String get typeProsecco => 'Prosecco';

  @override
  String get typeVodka => 'Vodka';

  @override
  String get typeWhisky => 'Whisky';

  @override
  String get typeRum => 'Ron';

  @override
  String get typeGin => 'Ginebra';

  @override
  String get typeTequila => 'Tequila';

  @override
  String get typeBrandy => 'Brandy';

  @override
  String get typeRaki => 'Raki';

  @override
  String get typeOuzo => 'Ouzo';

  @override
  String get addGuestProfile => 'Añadir Perfil de Invitado';

  @override
  String get removeGuestProfile => 'Eliminar Perfil de Invitado';

  @override
  String get guestProfileDesc =>
      'Ingresa la información del invitado para rastrear su BAC por separado.';

  @override
  String get removeGuestConfirm =>
      'El perfil de invitado y todos los registros de bebidas serán eliminados. ¿Continuar?';

  @override
  String addingFor(String name) {
    return 'Añadiendo para: $name';
  }

  @override
  String resetConfirmFor(String name) {
    return 'Todos los registros de bebidas del Perfil $name serán eliminados.';
  }

  @override
  String get languageLabel => 'Idioma';

  @override
  String get countryLabel => 'País';

  @override
  String get autoDetect => '🌍 Detección Automática (GPS)';

  @override
  String get otherBrand => 'Other';

  @override
  String get manualAbvLabel => 'Enter ABV (%)';

  @override
  String get manualAbvError => 'Please enter a value between 0.1 and 96.0';

  @override
  String get infoScreenNext => 'Next';

  @override
  String get infoButtonTitle => 'Info';

  @override
  String get infoPlaceholderText =>
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

  @override
  String get infoCloseButton => 'Close';
}
