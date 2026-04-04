import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:promilaj/core/theme/app_colors.dart';
import 'package:promilaj/core/constants/constants.dart';

/// Glassmorphism kart widget'ı.
/// BackdropFilter + ClipRRect ile buzlu cam efekti sağlar.
/// Tüm uygulamada tutarlı cam efekti için bu widget kullanılır.
class GlassCard extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? blurSigma;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.blurSigma,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  // ÖNCESİ / SONRASI: İlk frame çiziminde BackdropFilter GPU stall'ını (Suspect 5) 
  // önlemek için blur işlemini ilk frame sonrasına erteleyen state değişkeni.
  bool _showBlur = false;

  @override
  void initState() {
    super.initState();
    // ÖNCESİ: Tüm GlassCard'lar ilk karede sigma=20.0 ile çalışıp GPU'yu kitliyordu.
    // SONRASI: addPostFrameCallback ile blur uygulaması ilk frame'den sonraya bırakıldı.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _showBlur = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ÖNCESİ: final sigma = blurSigma ?? kGlassBlurSigma;
    // SONRASI: _showBlur false olduğu sürece sigma 0.0 (veya 0.1) atanır.
    final sigma = _showBlur ? (widget.blurSigma ?? kGlassBlurSigma) : 0.0;
    final bgColor = widget.backgroundColor ?? AppColors.glassWhite;

    return Container(
      margin: widget.margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: BackdropFilter(
          // Blur değeri ilk çizimde 0 ardından 20 olarak uygulanır.
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Container(
            padding: widget.padding ?? const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: AppColors.glassBorder,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.glassShadow,
                  blurRadius: 20,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
