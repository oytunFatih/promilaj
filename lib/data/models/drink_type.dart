/// İçki kategorileri ve alt türleri.

/// Ana içki kategorileri
enum DrinkCategory {
  beer,      // Bira
  wine,      // Şarap
  spirits,   // Sert içkiler
  cocktails, // Kokteyller
}

/// İçki alt türleri — her biri bir [DrinkCategory]'ye bağlıdır
enum DrinkType {
  // Bira
  lager(DrinkCategory.beer),
  pilsner(DrinkCategory.beer),
  ale(DrinkCategory.beer),
  stout(DrinkCategory.beer),
  wheatBeer(DrinkCategory.beer),
  ipa(DrinkCategory.beer),
  // Şarap
  redWine(DrinkCategory.wine),
  whiteWine(DrinkCategory.wine),
  rose(DrinkCategory.wine),
  sparklingWine(DrinkCategory.wine),
  champagne(DrinkCategory.wine),
  prosecco(DrinkCategory.wine),
  // Sert İçkiler
  vodka(DrinkCategory.spirits),
  whisky(DrinkCategory.spirits),
  rum(DrinkCategory.spirits),
  gin(DrinkCategory.spirits),
  tequila(DrinkCategory.spirits),
  brandy(DrinkCategory.spirits),
  raki(DrinkCategory.spirits),
  ouzo(DrinkCategory.spirits),
  // Kokteyller
  mojito(DrinkCategory.cocktails),
  margarita(DrinkCategory.cocktails),
  cosmopolitan(DrinkCategory.cocktails),
  negroni(DrinkCategory.cocktails),
  oldFashioned(DrinkCategory.cocktails),
  aperolSpritz(DrinkCategory.cocktails),
  pinaColada(DrinkCategory.cocktails),
  longIslandIcedTea(DrinkCategory.cocktails),
  daiquiri(DrinkCategory.cocktails),
  espressoMartini(DrinkCategory.cocktails),
  bloodyMary(DrinkCategory.cocktails),
  sexOnTheBeach(DrinkCategory.cocktails),
  moscowMule(DrinkCategory.cocktails);

  const DrinkType(this.category);
  final DrinkCategory category;
}
