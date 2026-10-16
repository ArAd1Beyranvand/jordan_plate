import 'package:flutter/widgets.dart';

/// Sampled as the modal pixel of the Wikipedia artwork (`.plateref/jordan`), not read from the article's adjectives.
abstract final class JordanColors {
  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  /// Commercial and rental strip. 0x01A06A in the vector artwork; the photographed taxi is a bluer 0x00A27E.
  static const Color green = Color(0xFF01A06A);

  static const Color rentalInk = Color(0xFFFFD200);

  static const Color yellow = Color(0xFFFFD200);

  /// Diplomatic strip; greener than [yellow].
  static const Color diplomatic = Color(0xFFF3EC1B);

  /// Government, parliament, judicial and Aqaba strip; modal of five artwork files.
  static const Color red = Color(0xFFE42B2B);

  static const Color inactive = Color(0xFFB0B0B0);
}
