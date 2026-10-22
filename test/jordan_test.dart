import 'package:flutter_test/flutter_test.dart';
import 'package:jordan_plate/jordan_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateValidation judge(PlateSpec spec, List<String?> values) =>
      const JordanValidator().validate(PlateEntry(spec: spec, values: values));

  test('every spec passes debugValidateSpec', () {
    for (final spec in JordanPlates.all) {
      expect(debugValidateSpec(spec), isTrue, reason: spec.id);
    }
  });

  test('every spec id resolves and is unique', () {
    final ids = JordanPlates.all.map((s) => s.id).toSet();
    expect(ids.length, JordanPlates.all.length);
    for (final spec in JordanPlates.all) {
      expect(JordanPlates.forSpecId(spec.id), same(spec));
    }
  });

  test('every usage points at a spec', () {
    for (final u in JordanUsage.all) {
      expect(JordanPlates.forSpecId(u.specId), isNotNull, reason: u.id);
    }
  });

  test('a plate is a code and a serial', () {
    expect(JordanPlates.private.slots.length, 2);
    expect(JordanPlates.motorcycle.slots.length, 2);
    final serial = JordanPlates.private.slots[1];
    expect(serial.length, 5);
    expect(serial.isComplete('7'), isTrue);
    expect(serial.isFull('7'), isFalse);
    expect(serial.accepts('123456'), isFalse);
  });

  test('validator', () {
    expect(judge(JordanPlates.private, ['21', '30000']).isValid, isTrue);
    expect(judge(JordanPlates.private, ['21', '7']).isValid, isTrue);
    expect(judge(JordanPlates.private, [null, '12345']).isValid, isFalse, reason: 'no code');
    expect(
      judge(JordanPlates.private, ['60', '1']).isValid,
      isFalse,
      reason: '60 is not a private code',
    );
  });
}
