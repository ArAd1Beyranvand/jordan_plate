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
    'private': (JordanPlates.private, ['10', '23456']),
    'transport': (JordanPlates.transport, ['60', '23456']),
    'rental': (JordanPlates.rental, ['70', '23456']),
    'trailer': (JordanPlates.trailer, ['71', '23456']),
    'temporary': (JordanPlates.temporary, ['8', '23456']),
    'executive': (JordanPlates.executive, ['PM', '1']),
    'legislative': (JordanPlates.legislative, ['PR', '1']),
    'judicial': (JordanPlates.judicial, ['JC', '1']),
    'governmental': (JordanPlates.governmental, ['GV', '1']),
    'aqaba': (JordanPlates.aqaba, ['AQ', '1']),
    'diplomatic': (JordanPlates.diplomatic, ['CD', '1']),
    'police': (JordanPlates.police, ['99', '23456']),
    'ambulance': (JordanPlates.ambulance, ['95', '23456']),
    'gendarmerie': (JordanPlates.gendarmerie, ['96', '23456']),
    'motorcycle': (JordanPlates.motorcycle, ['46', '1235']),
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
