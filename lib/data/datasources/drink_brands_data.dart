import 'package:promilaj/data/models/drink_brand.dart';
import 'package:promilaj/data/models/drink_type.dart';

/// Gömülü içki marka verileri.
/// Harici API çağrısı YAPILMAZ — tüm veriler burada sabit olarak tutulur.
/// Her kategori için en az 8-12 dünya çapında tanınan marka.
const List<DrinkBrand> drinkBrandsData = [
  // ═══════════════════════════════════════
  // BİRA — LAGER
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Heineken', type: DrinkType.lager, abv: 5.0),
  DrinkBrand(name: 'Budweiser', type: DrinkType.lager, abv: 5.0),
  DrinkBrand(name: 'Corona Extra', type: DrinkType.lager, abv: 4.5),
  DrinkBrand(name: 'Stella Artois', type: DrinkType.lager, abv: 5.2),
  DrinkBrand(name: 'Carlsberg', type: DrinkType.lager, abv: 5.0),
  DrinkBrand(name: "Beck's", type: DrinkType.lager, abv: 5.0),
  DrinkBrand(name: 'Peroni Nastro Azzurro', type: DrinkType.lager, abv: 5.1),
  DrinkBrand(name: 'Tiger', type: DrinkType.lager, abv: 5.0),
  DrinkBrand(name: 'San Miguel', type: DrinkType.lager, abv: 5.0),
  DrinkBrand(name: 'Efes Pilsen', type: DrinkType.lager, abv: 5.0),

  // ═══════════════════════════════════════
  // BİRA — PILSNER
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Pilsner Urquell', type: DrinkType.pilsner, abv: 4.4),
  DrinkBrand(name: 'Staropramen', type: DrinkType.pilsner, abv: 5.0),
  DrinkBrand(name: 'Warsteiner', type: DrinkType.pilsner, abv: 4.8),
  DrinkBrand(name: 'Bitburger', type: DrinkType.pilsner, abv: 4.8),
  DrinkBrand(name: 'DAB', type: DrinkType.pilsner, abv: 5.0),
  DrinkBrand(name: 'Holsten', type: DrinkType.pilsner, abv: 4.8),
  DrinkBrand(name: 'König Pilsener', type: DrinkType.pilsner, abv: 4.9),
  DrinkBrand(name: 'Jever', type: DrinkType.pilsner, abv: 4.9),
  DrinkBrand(name: 'Krombacher', type: DrinkType.pilsner, abv: 4.8),
  DrinkBrand(name: 'Radeberger', type: DrinkType.pilsner, abv: 4.8),

  // ═══════════════════════════════════════
  // BİRA — ALE
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Bass Pale Ale', type: DrinkType.ale, abv: 4.4),
  DrinkBrand(name: 'Newcastle Brown Ale', type: DrinkType.ale, abv: 4.7),
  DrinkBrand(name: "Fuller's London Pride", type: DrinkType.ale, abv: 4.7),
  DrinkBrand(name: 'Sierra Nevada Pale Ale', type: DrinkType.ale, abv: 5.6),
  DrinkBrand(name: "Smithwick's", type: DrinkType.ale, abv: 4.5),
  DrinkBrand(name: 'Kilkenny', type: DrinkType.ale, abv: 4.3),
  DrinkBrand(name: "Boddingtons", type: DrinkType.ale, abv: 4.7),
  DrinkBrand(name: 'Old Speckled Hen', type: DrinkType.ale, abv: 5.0),

  // ═══════════════════════════════════════
  // BİRA — STOUT
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Guinness', type: DrinkType.stout, abv: 4.2),
  DrinkBrand(name: "Murphy's Irish Stout", type: DrinkType.stout, abv: 4.0),
  DrinkBrand(name: 'Samuel Smith Oatmeal Stout', type: DrinkType.stout, abv: 5.0),
  DrinkBrand(name: 'Left Hand Milk Stout', type: DrinkType.stout, abv: 6.0),
  DrinkBrand(name: 'Mackeson', type: DrinkType.stout, abv: 3.0),
  DrinkBrand(name: 'Beamish', type: DrinkType.stout, abv: 4.1),
  DrinkBrand(name: "Young's Double Chocolate", type: DrinkType.stout, abv: 5.2),
  DrinkBrand(name: 'Founders Breakfast Stout', type: DrinkType.stout, abv: 8.3),

  // ═══════════════════════════════════════
  // BİRA — WHEAT BEER (BUĞDAY BİRASI)
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Hoegaarden', type: DrinkType.wheatBeer, abv: 4.9),
  DrinkBrand(name: 'Paulaner Hefe-Weißbier', type: DrinkType.wheatBeer, abv: 5.5),
  DrinkBrand(name: 'Erdinger Weißbier', type: DrinkType.wheatBeer, abv: 5.3),
  DrinkBrand(name: 'Franziskaner', type: DrinkType.wheatBeer, abv: 5.0),
  DrinkBrand(name: 'Weihenstephaner', type: DrinkType.wheatBeer, abv: 5.4),
  DrinkBrand(name: 'Blue Moon', type: DrinkType.wheatBeer, abv: 5.4),
  DrinkBrand(name: 'Schöfferhofer', type: DrinkType.wheatBeer, abv: 5.0),
  DrinkBrand(name: 'Schneider Weisse', type: DrinkType.wheatBeer, abv: 5.4),

  // ═══════════════════════════════════════
  // BİRA — IPA
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Lagunitas IPA', type: DrinkType.ipa, abv: 6.2),
  DrinkBrand(name: 'Stone IPA', type: DrinkType.ipa, abv: 6.9),
  DrinkBrand(name: 'Dogfish Head 60 Minute', type: DrinkType.ipa, abv: 6.0),
  DrinkBrand(name: 'Goose Island IPA', type: DrinkType.ipa, abv: 5.9),
  DrinkBrand(name: 'BrewDog Punk IPA', type: DrinkType.ipa, abv: 5.4),
  DrinkBrand(name: "Bell's Two Hearted", type: DrinkType.ipa, abv: 7.0),
  DrinkBrand(name: 'Ballast Point Sculpin', type: DrinkType.ipa, abv: 7.0),
  DrinkBrand(name: 'Founders All Day IPA', type: DrinkType.ipa, abv: 4.7),

  // ═══════════════════════════════════════
  // ŞARAP — KIRMIZI ŞARAP
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Cabernet Sauvignon', type: DrinkType.redWine, abv: 13.5),
  DrinkBrand(name: 'Merlot', type: DrinkType.redWine, abv: 13.5),
  DrinkBrand(name: 'Pinot Noir', type: DrinkType.redWine, abv: 13.0),
  DrinkBrand(name: 'Malbec', type: DrinkType.redWine, abv: 14.0),
  DrinkBrand(name: 'Shiraz / Syrah', type: DrinkType.redWine, abv: 14.5),
  DrinkBrand(name: 'Tempranillo', type: DrinkType.redWine, abv: 13.5),
  DrinkBrand(name: 'Sangiovese', type: DrinkType.redWine, abv: 13.0),
  DrinkBrand(name: 'Zinfandel', type: DrinkType.redWine, abv: 15.0),

  // ═══════════════════════════════════════
  // ŞARAP — BEYAZ ŞARAP
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Chardonnay', type: DrinkType.whiteWine, abv: 13.5),
  DrinkBrand(name: 'Sauvignon Blanc', type: DrinkType.whiteWine, abv: 12.5),
  DrinkBrand(name: 'Pinot Grigio', type: DrinkType.whiteWine, abv: 12.5),
  DrinkBrand(name: 'Riesling', type: DrinkType.whiteWine, abv: 11.0),
  DrinkBrand(name: 'Gewürztraminer', type: DrinkType.whiteWine, abv: 14.0),
  DrinkBrand(name: 'Moscato', type: DrinkType.whiteWine, abv: 5.5),
  DrinkBrand(name: 'Viognier', type: DrinkType.whiteWine, abv: 14.0),
  DrinkBrand(name: 'Albariño', type: DrinkType.whiteWine, abv: 12.5),

  // ═══════════════════════════════════════
  // ŞARAP — ROZE
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Provence Rosé', type: DrinkType.rose, abv: 13.0),
  DrinkBrand(name: 'White Zinfandel', type: DrinkType.rose, abv: 10.0),
  DrinkBrand(name: 'Pinot Noir Rosé', type: DrinkType.rose, abv: 12.5),
  DrinkBrand(name: 'Grenache Rosé', type: DrinkType.rose, abv: 13.5),
  DrinkBrand(name: 'Mateus Rosé', type: DrinkType.rose, abv: 11.0),
  DrinkBrand(name: 'Whispering Angel', type: DrinkType.rose, abv: 13.0),
  DrinkBrand(name: 'Miraval', type: DrinkType.rose, abv: 13.0),
  DrinkBrand(name: 'The Palm', type: DrinkType.rose, abv: 13.5),

  // ═══════════════════════════════════════
  // ŞARAP — KÖPÜKLÜ ŞARAP
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Cava', type: DrinkType.sparklingWine, abv: 11.5),
  DrinkBrand(name: 'Crémant', type: DrinkType.sparklingWine, abv: 12.0),
  DrinkBrand(name: 'Sekt', type: DrinkType.sparklingWine, abv: 11.5),
  DrinkBrand(name: 'Asti Spumante', type: DrinkType.sparklingWine, abv: 7.5),
  DrinkBrand(name: 'Lambrusco', type: DrinkType.sparklingWine, abv: 8.0),
  DrinkBrand(name: 'Franciacorta', type: DrinkType.sparklingWine, abv: 12.5),
  DrinkBrand(name: 'Blanquette de Limoux', type: DrinkType.sparklingWine, abv: 12.5),
  DrinkBrand(name: 'Sparkling Shiraz', type: DrinkType.sparklingWine, abv: 14.0),

  // ═══════════════════════════════════════
  // ŞARAP — ŞAMPANYA
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Moët & Chandon', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Veuve Clicquot', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Dom Pérignon', type: DrinkType.champagne, abv: 12.5),
  DrinkBrand(name: 'Bollinger', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Krug', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Laurent-Perrier', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Taittinger', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Perrier-Jouët', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Mumm', type: DrinkType.champagne, abv: 12.0),
  DrinkBrand(name: 'Ruinart', type: DrinkType.champagne, abv: 12.0),

  // ═══════════════════════════════════════
  // ŞARAP — PROSECCO
  // ═══════════════════════════════════════
  DrinkBrand(name: 'La Marca', type: DrinkType.prosecco, abv: 11.0),
  DrinkBrand(name: 'Mionetto', type: DrinkType.prosecco, abv: 11.0),
  DrinkBrand(name: 'Zonin', type: DrinkType.prosecco, abv: 11.0),
  DrinkBrand(name: 'Ruffino', type: DrinkType.prosecco, abv: 12.0),
  DrinkBrand(name: 'Bottega', type: DrinkType.prosecco, abv: 11.5),
  DrinkBrand(name: 'Bisol', type: DrinkType.prosecco, abv: 12.0),
  DrinkBrand(name: 'Villa Sandi', type: DrinkType.prosecco, abv: 11.0),
  DrinkBrand(name: 'Valdo', type: DrinkType.prosecco, abv: 11.0),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — VODKA
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Absolut', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Grey Goose', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Smirnoff', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Belvedere', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Ketel One', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Stolichnaya', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Cîroc', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: "Tito's", type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Russian Standard', type: DrinkType.vodka, abv: 40.0),
  DrinkBrand(name: 'Beluga', type: DrinkType.vodka, abv: 40.0),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — VİSKİ
  // ═══════════════════════════════════════
  DrinkBrand(name: "Jack Daniel's", type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: 'Johnnie Walker Red', type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: 'Johnnie Walker Black', type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: 'Jameson', type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: 'Chivas Regal', type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: 'Glenfiddich', type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: 'Macallan', type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: 'Jim Beam', type: DrinkType.whisky, abv: 40.0),
  DrinkBrand(name: "Maker's Mark", type: DrinkType.whisky, abv: 45.0),
  DrinkBrand(name: 'Wild Turkey', type: DrinkType.whisky, abv: 40.5),
  DrinkBrand(name: 'Bulleit', type: DrinkType.whisky, abv: 45.0),
  DrinkBrand(name: 'Crown Royal', type: DrinkType.whisky, abv: 40.0),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — ROM
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Bacardi', type: DrinkType.rum, abv: 40.0),
  DrinkBrand(name: 'Captain Morgan Original', type: DrinkType.rum, abv: 35.0),
  DrinkBrand(name: 'Havana Club', type: DrinkType.rum, abv: 40.0),
  DrinkBrand(name: 'Malibu', type: DrinkType.rum, abv: 21.0),
  DrinkBrand(name: 'Kraken', type: DrinkType.rum, abv: 40.0),
  DrinkBrand(name: 'Sailor Jerry', type: DrinkType.rum, abv: 40.0),
  DrinkBrand(name: 'Mount Gay', type: DrinkType.rum, abv: 40.0),
  DrinkBrand(name: 'Appleton Estate', type: DrinkType.rum, abv: 40.0),
  DrinkBrand(name: 'Ron Zacapa', type: DrinkType.rum, abv: 40.0),
  DrinkBrand(name: 'Diplomático', type: DrinkType.rum, abv: 40.0),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — CİN
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Bombay Sapphire', type: DrinkType.gin, abv: 40.0),
  DrinkBrand(name: 'Tanqueray', type: DrinkType.gin, abv: 43.1),
  DrinkBrand(name: "Hendrick's", type: DrinkType.gin, abv: 41.4),
  DrinkBrand(name: 'Beefeater', type: DrinkType.gin, abv: 40.0),
  DrinkBrand(name: "Gordon's", type: DrinkType.gin, abv: 37.5),
  DrinkBrand(name: 'Roku', type: DrinkType.gin, abv: 43.0),
  DrinkBrand(name: 'Monkey 47', type: DrinkType.gin, abv: 47.0),
  DrinkBrand(name: 'The Botanist', type: DrinkType.gin, abv: 46.0),
  DrinkBrand(name: 'Sipsmith', type: DrinkType.gin, abv: 41.6),
  DrinkBrand(name: 'Plymouth', type: DrinkType.gin, abv: 41.2),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — TEKİLA
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Jose Cuervo', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: 'Patrón', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: 'Don Julio', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: 'Herradura', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: 'Casamigos', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: '1800', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: 'Espolòn', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: 'Olmeca', type: DrinkType.tequila, abv: 38.0),
  DrinkBrand(name: 'Cazadores', type: DrinkType.tequila, abv: 40.0),
  DrinkBrand(name: 'El Jimador', type: DrinkType.tequila, abv: 38.0),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — BRANDI
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Hennessy', type: DrinkType.brandy, abv: 40.0),
  DrinkBrand(name: 'Rémy Martin', type: DrinkType.brandy, abv: 40.0),
  DrinkBrand(name: 'Courvoisier', type: DrinkType.brandy, abv: 40.0),
  DrinkBrand(name: 'Martell', type: DrinkType.brandy, abv: 40.0),
  DrinkBrand(name: 'Torres', type: DrinkType.brandy, abv: 36.0),
  DrinkBrand(name: 'Metaxa', type: DrinkType.brandy, abv: 38.0),
  DrinkBrand(name: 'KWV', type: DrinkType.brandy, abv: 36.0),
  DrinkBrand(name: 'St-Rémy', type: DrinkType.brandy, abv: 36.0),
  DrinkBrand(name: 'E&J', type: DrinkType.brandy, abv: 40.0),
  DrinkBrand(name: 'Fundador', type: DrinkType.brandy, abv: 36.0),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — RAKI / ARAK
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Yeni Rakı', type: DrinkType.raki, abv: 45.0),
  DrinkBrand(name: 'Tekirdağ Rakı', type: DrinkType.raki, abv: 45.0),
  DrinkBrand(name: 'Efe Rakı', type: DrinkType.raki, abv: 45.0),
  DrinkBrand(name: 'Kulüp Rakı', type: DrinkType.raki, abv: 45.0),
  DrinkBrand(name: 'Altınbaş Rakı', type: DrinkType.raki, abv: 45.0),
  DrinkBrand(name: 'Burgaz Rakı', type: DrinkType.raki, abv: 45.0),
  DrinkBrand(name: 'Arak El Mudir', type: DrinkType.raki, abv: 50.0),
  DrinkBrand(name: 'Arak Haddad', type: DrinkType.raki, abv: 53.0),
  DrinkBrand(name: 'Arak Razzouk', type: DrinkType.raki, abv: 50.0),
  DrinkBrand(name: 'Elit Rakı', type: DrinkType.raki, abv: 45.0),

  // ═══════════════════════════════════════
  // SERT İÇKİLER — UZO
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Ouzo 12', type: DrinkType.ouzo, abv: 38.0),
  DrinkBrand(name: 'Plomari Ouzo', type: DrinkType.ouzo, abv: 40.0),
  DrinkBrand(name: 'Ouzo Mini', type: DrinkType.ouzo, abv: 40.0),
  DrinkBrand(name: 'Ouzo Barbayanni', type: DrinkType.ouzo, abv: 46.0),
  DrinkBrand(name: 'Sans Rival', type: DrinkType.ouzo, abv: 46.0),
  DrinkBrand(name: 'Ouzo Giannatsi', type: DrinkType.ouzo, abv: 42.0),
  DrinkBrand(name: 'Pitsiladi', type: DrinkType.ouzo, abv: 42.0),
  DrinkBrand(name: 'Ouzo Nektar', type: DrinkType.ouzo, abv: 38.0),

  // ═══════════════════════════════════════
  // KOKTEYLLER — Standart tarif ABV değerleri
  // ═══════════════════════════════════════
  DrinkBrand(name: 'Mojito', type: DrinkType.mojito, abv: 10.0),
  DrinkBrand(name: 'Margarita', type: DrinkType.margarita, abv: 13.0),
  DrinkBrand(name: 'Cosmopolitan', type: DrinkType.cosmopolitan, abv: 15.0),
  DrinkBrand(name: 'Negroni', type: DrinkType.negroni, abv: 24.0),
  DrinkBrand(name: 'Old Fashioned', type: DrinkType.oldFashioned, abv: 32.0),
  DrinkBrand(name: 'Aperol Spritz', type: DrinkType.aperolSpritz, abv: 8.0),
  DrinkBrand(name: 'Piña Colada', type: DrinkType.pinaColada, abv: 12.0),
  DrinkBrand(name: 'Long Island Iced Tea', type: DrinkType.longIslandIcedTea, abv: 22.0),
  DrinkBrand(name: 'Daiquiri', type: DrinkType.daiquiri, abv: 20.0),
  DrinkBrand(name: 'Espresso Martini', type: DrinkType.espressoMartini, abv: 15.0),
  DrinkBrand(name: 'Bloody Mary', type: DrinkType.bloodyMary, abv: 12.0),
  DrinkBrand(name: 'Sex on the Beach', type: DrinkType.sexOnTheBeach, abv: 10.0),
  DrinkBrand(name: 'Moscow Mule', type: DrinkType.moscowMule, abv: 10.0),
];
