import 'package:plate_core/plate_core.dart';

import 'jordan_colors.dart';

/// Jordan's strip, as `plate_core`'s [PlateCountry]. The strip's wording is
/// printed by labels on the spec; the country only carries its colour. All
/// share `code: 'jo'`, so tell them apart by [PlateSpec.id].
abstract final class JordanCountry {
  /// White, for a plate with no strip.
  static const PlateCountry plain = PlateCountry(
    code: 'jo',
    captionLines: <String>[],
    panelColor: JordanColors.white,
    panelTextColor: JordanColors.black,
  );
  static const PlateCountry green = PlateCountry(
    code: 'jo',
    captionLines: <String>[],
    panelColor: JordanColors.green,
    panelTextColor: JordanColors.white,
  );
  static const PlateCountry yellow = PlateCountry(
    code: 'jo',
    captionLines: <String>[],
    panelColor: JordanColors.yellow,
    panelTextColor: JordanColors.black,
  );
  static const PlateCountry diplomatic = PlateCountry(
    code: 'jo',
    captionLines: <String>[],
    panelColor: JordanColors.diplomatic,
    panelTextColor: JordanColors.black,
  );
  static const PlateCountry red = PlateCountry(
    code: 'jo',
    captionLines: <String>[],
    panelColor: JordanColors.red,
    panelTextColor: JordanColors.white,
  );
}
