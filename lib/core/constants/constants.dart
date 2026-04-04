/// Promilaj uygulama sabitleri
/// Tüm sihirli sayılar burada merkezi olarak tanımlanmıştır.

/// Widmark dağılım faktörü — Erkek
const double kWidmarkFactorMale = 0.68;

/// Widmark dağılım faktörü — Kadın
const double kWidmarkFactorFemale = 0.55;

/// Ortalama alkol eliminasyon hızı (g/L/saat)
const double kEliminationRate = 0.15;

/// Alkolün yoğunluğu (g/mL)
const double kAlcoholDensity = 0.789;

/// BAC otomatik güncelleme aralığı (saniye)
const int kBacUpdateIntervalSeconds = 30;

/// Miktar slider — minimum (mL)
const double kMinVolumeMl = 25.0;

/// Miktar slider — maksimum (mL)
const double kMaxVolumeMl = 1000.0;

/// Miktar slider — adım (mL)
const double kVolumeStepMl = 25.0;

/// Zaman slider — minimum (saat)
const double kMinHoursAgo = 0.0;

/// Zaman slider — maksimum (saat)
const double kMaxHoursAgo = 12.0;

/// Zaman slider — adım dizisi (v0.1.5 non-uniform)
const List<double> kTimeSteps = [
  0.0, 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0,
  6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0,
];

/// Su hatırlatıcısı tetikleme eşiği (içki sayısı)
const int kWaterReminderDrinkCount = 2;

/// Varsayılan yasal BAC limiti — konum yoksa en muhafazakar değer (‰)
const double kDefaultLegalLimit = 0.0;

/// Cam efekti — bulanıklık şiddeti
const double kGlassBlurSigma = 20.0;

/// Cam efekti — arkaplan opaklığı
const double kGlassOpacity = 0.10;

/// Cam efekti — kenarlık opaklığı
const double kGlassBorderOpacity = 0.20;
