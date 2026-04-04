import 'package:flutter/material.dart';

/// Promilaj renk paleti
/// iOS 26 Liquid Glass tasarım diline uygun renk sistemi.
/// Deep navy/midnight taban, amber/emerald vurgu, buzlu cam katmanları.
class AppColors {
  AppColors._(); // Sınıf örneklemesini engelle

  // ── Ana Arka Plan Renkleri ──
  /// Gece mavisi — ana arka plan
  static const Color midnight = Color(0xFF0A0E21);

  /// Biraz daha açık gece mavisi — yüzey rengi
  static const Color surface = Color(0xFF1A1F38);

  /// Koyu yüzey — kartlar ve paneller için
  static const Color surfaceDark = Color(0xFF111528);

  // ── Cam Efekti Renkleri ──
  /// Cam arkaplanı — beyaz %10 opaklık
  static const Color glassWhite = Color(0x1AFFFFFF);

  /// Cam kenarlığı — beyaz %20 opaklık
  static const Color glassBorder = Color(0x33FFFFFF);

  /// Cam gölgesi — siyah %10 opaklık
  static const Color glassShadow = Color(0x1A000000);

  /// Hafif cam arkaplanı — beyaz %5 opaklık
  static const Color glassSubtle = Color(0x0DFFFFFF);

  // ── BAC Durum Renkleri ──
  /// Güvenli — yeşil parlak
  static const Color bacSafe = Color(0xFF00E676);

  /// Dikkat — amber/sarı
  static const Color bacCaution = Color(0xFFFFB300);

  /// Tehlike — kırmızı
  static const Color bacDanger = Color(0xFFFF1744);

  // ── Vurgu Renkleri ──
  /// Ana vurgu — amber
  static const Color accent = Color(0xFFFFB300);

  /// İkincil vurgu — zümrüt yeşili
  static const Color accentGreen = Color(0xFF00E676);

  // ── Metin Renkleri ──
  /// Birincil metin — beyaz
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// İkincil metin — beyaz %70 opaklık
  static const Color textSecondary = Color(0xB3FFFFFF);

  /// Soluk metin — beyaz %40 opaklık
  static const Color textMuted = Color(0x66FFFFFF);

  // ── Yardımcı Renkler ──
  /// Hata/uyarı kırmızısı
  static const Color error = Color(0xFFFF1744);

  /// Bilgi mavisi
  static const Color info = Color(0xFF448AFF);

  /// BAC değerine göre uygun rengi döndürür
  /// 0.0 - yasal limit arası: yeşil
  /// yasal limit - yasal limit×2 arası: amber
  /// yasal limit×2 üzeri: kırmızı
  static Color bacColor(double bac, double legalLimit) {
    if (legalLimit <= 0) {
      // Yasal limit 0 olan ülkeler için
      if (bac <= 0) return bacSafe;
      if (bac <= 0.5) return bacCaution;
      return bacDanger;
    }
    if (bac <= legalLimit * 0.8) return bacSafe;
    if (bac <= legalLimit) return bacCaution;
    return bacDanger;
  }
}
