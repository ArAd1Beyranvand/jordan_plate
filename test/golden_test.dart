import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jordan_plate/jordan_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per design, rendered with real fonts at twice plate size so the
/// ink can be measured against the reference artwork. Regenerate with
/// `flutter test --update-goldens`.
void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final loader = FontLoader('Roboto');
    for (final path in const [
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
      '/usr/share/fonts/truetype/noto/NotoSansArabic-Bold.ttf',
    ]) {
      final file = File(path);
      if (!file.existsSync()) continue;
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  final cases = <String, (PlateSpec, List<String?>)>{
    'private': (JordanPlates.private, ['1', '0', '2', '3', '4', '5', '6']),
    'transport': (JordanPlates.transport, ['6', '0', '2', '3', '4', '5', '6']),
    'rental': (JordanPlates.rental, ['7', '0', '2', '3', '4', '5', '6']),
    'trailer': (JordanPlates.trailer, ['7', '1', '2', '3', '4', '5', '6']),
    'temporary': (JordanPlates.temporary, [null, '8', '2', '3', '4', '5', '6']),
    'executive': (
      JordanPlates.executive,
      ['P', 'M', null, null, null, null, '1'],
    ),
    'legislative': (
      JordanPlates.legislative,
      ['P', 'R', null, null, null, null, '1'],
    ),
    'judicial': (
      JordanPlates.judicial,
      ['J', 'C', null, null, null, null, '1'],
    ),
    'governmental': (
      JordanPlates.governmental,
      ['G', 'V', null, null, null, '1', null],
    ),
    'aqaba': (JordanPlates.aqaba, ['A', 'Q', null, null, null, '1', null]),
    'diplomatic': (
      JordanPlates.diplomatic,
      ['C', 'D', null, null, null, '1', null],
    ),
    'police': (JordanPlates.police, ['9', '9', '2', '3', '4', '5', '6']),
    'ambulance': (JordanPlates.ambulance, ['9', '5', '2', '3', '4', '5', '6']),
    'gendarmerie': (
      JordanPlates.gendarmerie,
      ['9', '6', '2', '3', '4', '5', '6'],
    ),
    'motorcycle': (JordanPlates.motorcycle, ['4', '6', '1', '2', '3', '5']),
  };

  for (final e in cases.entries) {
    testWidgets('jo ${e.key}', (tester) async {
      final spec = e.value.$1;
      final controller = PlateController.fromValues(spec, e.value.$2);
      const theme = JordanThemes.standard;
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 1040,
                height: 1040 * spec.canvasHeight / spec.canvasWidth,
                child: PlateThemeScope(
                  theme: theme,
                  child: PlateView(
                    controller: controller,
                    theme: theme,
                    country: spec.country,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/jo_${e.key}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
