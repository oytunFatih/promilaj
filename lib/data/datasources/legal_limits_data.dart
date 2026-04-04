/// Ülkelere göre yasal kan alkol limitleri (‰ — promil).
/// ISO 3166-1 alpha-2 ülke kodu → yasal BAC limiti.
/// Harici API çağrısı YAPILMAZ — tüm veriler burada gömülüdür.
const Map<String, double> legalBacLimits = {
  // Avrupa
  'TR': 0.50, // Türkiye
  'DE': 0.50, // Almanya
  'GB': 0.80, // Birleşik Krallık
  'FR': 0.50, // Fransa
  'ES': 0.50, // İspanya
  'IT': 0.50, // İtalya
  'PT': 0.50, // Portekiz
  'NL': 0.50, // Hollanda
  'BE': 0.50, // Belçika
  'AT': 0.50, // Avusturya
  'CH': 0.50, // İsviçre
  'SE': 0.20, // İsveç
  'NO': 0.20, // Norveç
  'DK': 0.50, // Danimarka
  'FI': 0.50, // Finlandiya
  'PL': 0.20, // Polonya
  'CZ': 0.00, // Çek Cumhuriyeti
  'SK': 0.00, // Slovakya
  'HU': 0.00, // Macaristan
  'RO': 0.00, // Romanya
  'BG': 0.50, // Bulgaristan
  'HR': 0.50, // Hırvatistan
  'SI': 0.50, // Slovenya
  'RS': 0.30, // Sırbistan
  'GR': 0.50, // Yunanistan
  'IE': 0.50, // İrlanda
  'IS': 0.50, // İzlanda
  'LU': 0.50, // Lüksemburg
  'EE': 0.20, // Estonya
  'LV': 0.50, // Letonya
  'LT': 0.40, // Litvanya
  'UA': 0.00, // Ukrayna
  'BY': 0.00, // Belarus
  'MD': 0.30, // Moldova
  'AL': 0.10, // Arnavutluk
  'MK': 0.50, // Kuzey Makedonya
  'BA': 0.30, // Bosna Hersek
  'ME': 0.30, // Karadağ
  'RU': 0.00, // Rusya

  // Asya
  'AZ': 0.00, // Azerbaycan
  'GE': 0.00, // Gürcistan
  'JP': 0.30, // Japonya
  'KR': 0.30, // Güney Kore
  'CN': 0.20, // Çin
  'IN': 0.30, // Hindistan
  'TH': 0.50, // Tayland
  'VN': 0.00, // Vietnam
  'PH': 0.50, // Filipinler
  'MY': 0.80, // Malezya
  'SG': 0.80, // Singapur
  'ID': 0.00, // Endonezya
  'IL': 0.50, // İsrail
  'AE': 0.00, // BAE
  'SA': 0.00, // Suudi Arabistan
  'KZ': 0.30, // Kazakistan

  // Amerika
  'US': 0.80, // ABD
  'CA': 0.80, // Kanada
  'MX': 0.80, // Meksika
  'BR': 0.00, // Brezilya
  'AR': 0.50, // Arjantin
  'CL': 0.30, // Şili
  'CO': 0.40, // Kolombiya
  'PE': 0.50, // Peru

  // Afrika & Okyanusya
  'ZA': 0.50, // Güney Afrika
  'AU': 0.50, // Avustralya
  'NZ': 0.50, // Yeni Zelanda
  'EG': 0.00, // Mısır
  'NG': 0.50, // Nijerya
  'KE': 0.80, // Kenya
  'MA': 0.00, // Fas
  'TN': 0.00, // Tunus
};
