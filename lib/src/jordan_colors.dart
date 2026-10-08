import 'package:flutter/widgets.dart';

/// Every colour a Jordanian plate is printed in, sampled as the modal pixel of
/// the Wikipedia artwork (`.plateref/jordan`), not read from the article's
/// adjectives.
abstract final class JordanColors {
  /// The plate face. Pure white in every artwork.
  static const Color white = Color(0xFFFFFFFF);

  /// Characters, frame and dividers: pure black in every artwork.
  static const Color black = Color(0xFF000000);

  /// Commercial strip (taxi, bus, goods) and rental strip. 0x01A06A in the
  /// vector artwork; the photographed taxi is a slightly bluer 0x00A27E.
  static const Color green = Color(0xFF01A06A);

  /// The rental plate's yellow text on [green].
  static const Color rentalInk = Color(0xFFFFD200);

  /// Temporary and trailer strip.
  static const Color yellow = Color(0xFFFFD200);

  /// Diplomatic strip. A greener yellow than [yellow]: 0xF3EC1B, from the
  /// newer artwork.
  static const Color diplomatic = Color(0xFFF3EC1B);

  /// Government, parliament, judicial and Aqaba strip. Modal of five artwork
  /// files: 0xE42A2B, 0xE42C2D, 0xE22B2B, 0xE42C2A, 0xDC2E2C.
  static const Color red = Color(0xFFE42B2B);

  /// Input chrome under an empty field. Never printed.
  static const Color inactive = Color(0xFFB0B0B0);
}
