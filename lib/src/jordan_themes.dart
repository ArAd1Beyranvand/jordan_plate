import 'package:plate_core/plate_core.dart';

import 'jordan_colors.dart';

/// Black on white in a black frame. Every Jordanian plate is printed this way:
/// the usage lives in the strip, which is the spec's [JordanCountry].
abstract final class JordanThemes {
  /// Frame width over plate height: the frame measures 3.0 of 110 units on the
  /// 520 x 110 artwork (2.9-3.2 across the six vector files).
  static const double borderWidthRatio = 0.027;

  /// Outer corner radius over plate height: 8.5 of 110 units, read off the
  /// first twelve rows of the artwork's top-left corner.
  static const double plateRadiusRatio = 0.077;

  static const PlateTheme standard = PlateTheme.monochrome(
    field: JordanColors.white,
    ink: JordanColors.black,
    inactive: JordanColors.inactive,
    borderWidthRatio: borderWidthRatio,
    plateRadiusRatio: plateRadiusRatio,
  );
}
