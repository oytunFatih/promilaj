// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get welcomeTitle => 'Promilaj';

  @override
  String get welcomeSubtitle =>
      'Calculateur et Suivi Personnel de l\'Alcoolémie';

  @override
  String get heightLabel => 'Taille';

  @override
  String get heightHint => 'Entrez la taille en cm';

  @override
  String get weightLabel => 'Poids';

  @override
  String get weightHint => 'Entrez le poids en kg';

  @override
  String get sexLabel => 'Sexe Biologique';

  @override
  String get male => 'Homme';

  @override
  String get female => 'Femme';

  @override
  String get ageLabel => 'Âge';

  @override
  String get ageHint => 'Entrez l\'âge en années';

  @override
  String get continueButton => 'Continuer';

  @override
  String get addDrink => 'Ajouter une Boisson';

  @override
  String get selectDrinkType => 'Choisir le Type de Boisson';

  @override
  String get selectBrand => 'Choisir la Marque';

  @override
  String get searchBrands => 'Rechercher des marques...';

  @override
  String get amountAndTime => 'Quantité et Temps';

  @override
  String get amountLabel => 'Quantité';

  @override
  String get hoursAgoLabel => 'Il y a combien d\'heures ?';

  @override
  String get hours => 'h';

  @override
  String get addButton => 'Ajouter';

  @override
  String get soberStatus => 'Sobre';

  @override
  String get timeToLegalLimit => 'Temps jusqu\'au limite légale';

  @override
  String get withinLegalLimit => 'Sous le limite légale';

  @override
  String get timeToZero => 'Temps jusqu\'à zéro';

  @override
  String get legalLimitLabel => 'Limite Légale';

  @override
  String get legalInfoButton => 'Informations Légales';

  @override
  String get legalInfoNoLocation =>
      'Emplacement non encore détecté. Veuillez accorder l\'autorisation de localisation.';

  @override
  String get settings => 'Paramètres';

  @override
  String get profileSection => 'PROFIL';

  @override
  String get languageSection => 'LANGUE';

  @override
  String get save => 'Enregistrer';

  @override
  String get resetTitle => 'Réinitialiser la Session';

  @override
  String get resetMessage =>
      'Voulez-vous effacer toutes les boissons et réinitialiser les minuteurs ?';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get cancel => 'Annuler';

  @override
  String get ok => 'OK';

  @override
  String get waterReminderTitle => 'Restez Hydraté !';

  @override
  String get waterReminderMessage => 'N\'oubliez pas de boire de l\'eau ! 💧';

  @override
  String get legalWarningTitle => 'Avertissement';

  @override
  String get legalWarningMessage =>
      '⚠️ Vous avez dépassé le limite légale de conduite.';

  @override
  String get locationPermissionTitle => 'Localisation Requise';

  @override
  String get locationPermissionMessage =>
      'Nous avons besoin de votre localisation pour afficher le limite légale d\'alcoolémie de votre pays.';

  @override
  String get continueWithoutLocation => 'Continuer sans localisation';

  @override
  String get grantPermission => 'Accorder la Permission';

  @override
  String get categoryBeer => 'BIÈRE';

  @override
  String get categoryWine => 'VIN';

  @override
  String get categorySpirits => 'SPIRITUEUX';

  @override
  String get categoryCocktails => 'COCKTAILS';

  @override
  String get typeLager => 'Lager';

  @override
  String get typePilsner => 'Pilsner';

  @override
  String get typeAle => 'Ale';

  @override
  String get typeStout => 'Stout';

  @override
  String get typeWheatBeer => 'Bière Blanche';

  @override
  String get typeIpa => 'IPA';

  @override
  String get typeRedWine => 'Vin Rouge';

  @override
  String get typeWhiteWine => 'Vin Blanc';

  @override
  String get typeRose => 'Rosé';

  @override
  String get typeSparklingWine => 'Vin Mousseux';

  @override
  String get typeChampagne => 'Champagne';

  @override
  String get typeProsecco => 'Prosecco';

  @override
  String get typeVodka => 'Vodka';

  @override
  String get typeWhisky => 'Whisky';

  @override
  String get typeRum => 'Rhum';

  @override
  String get typeGin => 'Gin';

  @override
  String get typeTequila => 'Tequila';

  @override
  String get typeBrandy => 'Brandy';

  @override
  String get typeRaki => 'Raki';

  @override
  String get typeOuzo => 'Ouzo';

  @override
  String get addGuestProfile => 'Ajouter un Profil Invité';

  @override
  String get removeGuestProfile => 'Supprimer le Profil Invité';

  @override
  String get guestProfileDesc =>
      'Entrez les informations de l\'invité pour suivre son taux d\'alcoolémie séparément.';

  @override
  String get removeGuestConfirm =>
      'Le profil invité et tous les enregistrements de boissons seront supprimés. Continuer ?';

  @override
  String addingFor(String name) {
    return 'Ajout pour : $name';
  }

  @override
  String resetConfirmFor(String name) {
    return 'Tous les enregistrements de boissons du Profil $name seront supprimés.';
  }

  @override
  String get languageLabel => 'Langue';

  @override
  String get countryLabel => 'Pays';

  @override
  String get autoDetect => '🌍 Détection Automatique (GPS)';

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
