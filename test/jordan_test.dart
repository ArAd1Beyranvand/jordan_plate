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

  test('car plates have two code and five serial cells', () {
    expect(JordanPlates.private.slots.length, 7);
    expect(JordanPlates.motorcycle.slots.length, 6);
  });

  test('validator', () {
    expect(
      judge(JordanPlates.private, ['2', '1', '3', '0', '0', '0', '0']).isValid,
      isTrue,
    );
    expect(
      judge(JordanPlates.private, ['2', '1', null, null, null, null, '7'])
          .isValid,
      isTrue,
    );
    expect(
      judge(JordanPlates.private, [null, null, '1', '2', '3', '4', '5'])
          .isValid,
      isFalse,
      reason: 'no code',
    );
    expect(
      judge(JordanPlates.private, ['6', '0', '1', null, null, null, null])
          .isValid,
      isFalse,
      reason: '60 is not a private code',
    );
  });
}
