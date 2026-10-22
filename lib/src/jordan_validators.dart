import 'package:plate_core/plate_core.dart';

import 'jordan_usage.dart';

/// Judges a Jordanian plate. Reports, never throws, never bars a keystroke.
///
/// Checks that the serial is one to five digits and, where the article names
/// the codes a design carries, that the code is one of them. It does not check
/// allocation: the article gives only that the normal series had reached
/// 21-30000 by 2013 and that private prefixes run past 49.
class JordanValidator extends GatedPlateValidator {
  const JordanValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonCodeMissing = 'A plate starts with a code.';
  static const String reasonCodeUnknown = 'That code is not issued on this plate.';
  static const String reasonSerialNotNumeric = 'The number is digits only.';
  static const String reasonSerialLength = 'The number is one to five digits.';

  static const int maxSerialLength = 5;

  @override
  PlateValidation judge(PlateEntry entry) {
    final code = entry.group('code');
    final serial = entry.group('serial');
    if (code.isEmpty) return const PlateValidation.invalid(reasonCodeMissing);
    final known = JordanUsage.codesOf(entry.spec.id);
    if (known.isNotEmpty && !known.contains(code)) {
      return const PlateValidation.invalid(reasonCodeUnknown);
    }
    if (serial.isEmpty || serial.length > maxSerialLength) {
      return const PlateValidation.invalid(reasonSerialLength);
    }
    if (!isDigits(serial)) {
      return const PlateValidation.invalid(reasonSerialNotNumeric);
    }
    return const PlateValidation.valid();
  }
}
