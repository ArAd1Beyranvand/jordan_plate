import 'package:flutter/widgets.dart';
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'jordan_colors.dart';
import 'jordan_country.dart';

/// Where the ink sits on the 520 x 110 plate, in plate coordinates.
///
/// Measured by normalising each artwork plate rectangle to 520 x 110
/// (`.plateref/jordan`). Two artwork generations disagree and the newer is used:
/// the old files put the strip's edge at x=112.6 and the digits 52.3 apart; the
/// newer files and the photographs put them at x=83.5 and 56 apart.
///
/// Digit size is capped: artwork ink is 75 tall, a slot paints ~0.55 of its box,
/// and the box is capped at the 110 canvas, so characters come out ~75% of the
/// reference. [glyphStyle]'s 0.72 is shared by every country, so it stays.
abstract final class _Layout {
  static const double width = 520;
  static const double height = 110;

  static const double stripEnd = 83.5;

  /// Cells are 56 apart (code ink centres 116.5 and 172.4; serial 312 to 483).
  static const double pitch = 56;

  static const double codeLeft = 86;

  /// The dash, 14.4 wide, ink at y 50.5-61.5, x 206.0-220.4 (GV/AQ/CD artwork)
  /// and 207.7-219.9 (white artwork).
  static const PlateBox dash = PlateBox(206, 50.5, 14.4, 11);

  /// Five cells ending at 511, so the last centre is 483; a shorter serial is centred in its box.
  static const double serialRight = 511;
  static const int serialMax = 5;

  static const double cellTop = 0;
  static const double cellHeight = height;

  /// The strip's wording is centred on x=43; the boxes sit 1.8 left because the
  /// substitute font measures 1.8 right of the artwork. الأردن, ink y 8.7-47.9.
  static const PlateBox arabicName = PlateBox(3.2, 8.5, 76, 40);
  static const double arabicNameGlyph = 36;

  /// The class wording (مجلس الوزراء, TRL), ink y 56.7-70.5.
  static const PlateBox caption = PlateBox(3.2, 52, 76, 19);
  static const double captionGlyph = 15;

  /// Caption glyph for a short Arabic word, larger than the long ones that must fit 76 units.
  static const double captionShortGlyph = 20;

  /// Caption glyph for Latin capitals, which the reference prints at JORDAN's size.
  static const double captionLatinGlyph = 26;

  /// JORDAN, caps ink y 77.0-95.7 (18.7 tall).
  static const PlateBox latinName = PlateBox(3.2, 73.8, 76, 20);
  static const double latinNameGlyph = 23;

  /// The police plates' two Arabic lines in place of the country name, ink
  /// x 27-86: الامن 11.7-39.6 and العام 61.2-96.5 (old artwork).
  static const PlateBox serviceTop = PlateBox(27, 6.5, 60, 34);
  static const PlateBox serviceBottom = PlateBox(27, 59, 60, 34);
  static const double serviceGlyph = 31;

  // The motorcycle plate has no stated size; 250 x 155 is the artwork's own
  // aspect (1.63 of 635x390), so those numbers are normalised to it.
  static const double bikeWidth = 250;
  static const double bikeHeight = 155;
  static const double bikeBorderRatio = 0.02;

  /// Cells 38.6 apart.
  static const double bikePitch = 38.6;
  static const double bikeCodeLeft = 98.3;
  static const double bikeSerialLeft = 58.2;

  /// Code ink y about 17-69, serial ink y 87.9-137.9.
  static const double bikeCodeTop = 1;
  static const double bikeSerialTop = 70.9;
  static const double bikeCellHeight = 84;

  /// الاردن ink y 13.0-34.4, JORDAN y 42.4-57.9, both centred near x=43.
  static const PlateBox bikeArabicName = PlateBox(6, 11.1, 74, 21.4);
  static const PlateBox bikeLatinName = PlateBox(6, 39, 74, 20);
  static const double bikeArabicGlyph = 26;
  static const double bikeLatinGlyph = 20;
}

/// Fifteen designs, one geometry: a two-cell code, a dash and up to five serial
/// digits on the 520 x 110 face, with a coloured strip or none. Strip colour is
/// the [PlateSpec.country]; the wording and the code's alphabet are builder
/// parameters. Only the current (2007) series is implemented.
abstract final class JordanPlates {
  static const PlateSection _stripBackground = PlateSection.columns(<PlatePart>[
    PlatePart(PlateSection.fill(PlateFill.panel), end: _Layout.stripEnd),
    PlatePart(PlateSection.plain),
  ]);

  static const PlatePanel _stripPanel = PlatePanel(
    box: PlateBox(0, 0, _Layout.stripEnd, _Layout.height),
  );

  static List<PlateLabel> _nameLabels({
    required Color? ink,
    String arabic = 'الاردن',
    String? caption,
    double captionGlyph = _Layout.captionGlyph,
  }) => <PlateLabel>[
    PlateLabel(
      text: arabic,
      box: _Layout.arabicName,
      glyphHeight: _Layout.arabicNameGlyph,
      color: ink,
    ),
    if (caption != null)
      PlateLabel(
        text: caption,
        box: _Layout.caption,
        glyphHeight: captionGlyph,
        color: ink,
      ),
    PlateLabel(
      text: 'JORDAN',
      box: _Layout.latinName,
      glyphHeight: _Layout.latinNameGlyph,
      color: ink,
    ),
  ];

  /// The code, then the serial, as slots 0 and 1. A digit code may be one
  /// digit, a letter code is two; the serial is one to [serialMax] digits,
  /// right-aligned in its box.
  static List<PlateSlot> _slots(PlateAlphabet code) => <PlateSlot>[
    PlateSlot(
      alphabet: code,
      box: const PlateBox(
        _Layout.codeLeft,
        _Layout.cellTop,
        2 * _Layout.pitch,
        _Layout.cellHeight,
      ),
      length: 2,
      minLength: code == JordanAlphabets.digits ? 1 : 2,
    ),
    const PlateSlot(
      alphabet: JordanAlphabets.digits,
      box: PlateBox(
        _Layout.serialRight - _Layout.serialMax * _Layout.pitch,
        _Layout.cellTop,
        _Layout.serialMax * _Layout.pitch,
        _Layout.cellHeight,
      ),
      length: _Layout.serialMax,
      minLength: 1,
    ),
  ];

  static const List<PlateTextGroup> _groups = <PlateTextGroup>[
    PlateTextGroup(<int>[0], key: 'code'),
    PlateTextGroup(<int>[1], prefix: '-', key: 'serial'),
  ];

  static PlateSpec _plate({
    required String id,
    required PlateCountry country,
    required List<PlateLabel> labels,
    PlateAlphabet code = JordanAlphabets.digits,
    bool strip = true,
  }) => PlateSpec(
    id: id,
    country: country,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    panel: _stripPanel,
    noPanel: !strip,
    background: strip ? _stripBackground : PlateSection.plain,
    slots: _slots(code),
    rules: const <PlateRule>[PlateRule(box: _Layout.dash)],
    labels: labels,
    textGroups: _groups,
  );

  /// White, no strip: private, van, pick-up, light goods, agricultural,
  /// construction, customs exemption.
  static final PlateSpec private = _plate(
    id: 'jo.private',
    country: JordanCountry.plain,
    strip: false,
    labels: _nameLabels(ink: null),
  );

  /// Green strip, white wording: taxi, buses, heavy goods.
  static final PlateSpec transport = _plate(
    id: 'jo.transport',
    country: JordanCountry.green,
    labels: _nameLabels(ink: JordanColors.white),
  );

  static final PlateSpec rental = _plate(
    id: 'jo.rental',
    country: JordanCountry.green,
    labels: _nameLabels(ink: JordanColors.rentalInk),
  );

  static final PlateSpec trailer = _plate(
    id: 'jo.trailer',
    country: JordanCountry.yellow,
    labels: _nameLabels(
      ink: null,
      caption: 'TRL',
      captionGlyph: _Layout.captionLatinGlyph,
    ),
  );

  static final PlateSpec temporary = _plate(
    id: 'jo.temporary',
    country: JordanCountry.yellow,
    labels: _nameLabels(
      ink: null,
      caption: 'موقت',
      captionGlyph: _Layout.captionShortGlyph,
    ),
  );

  static PlateSpec _letters({
    required String id,
    required PlateCountry country,
    required Color ink,
    required String caption,
  }) => _plate(
    id: id,
    country: country,
    code: JordanAlphabets.letters,
    labels: _nameLabels(ink: ink, arabic: 'الأردن', caption: caption),
  );

  static final PlateSpec executive = _letters(
    id: 'jo.executive',
    country: JordanCountry.red,
    ink: JordanColors.white,
    caption: 'مجلس الوزراء',
  );
  static final PlateSpec legislative = _letters(
    id: 'jo.legislative',
    country: JordanCountry.red,
    ink: JordanColors.white,
    caption: 'مجلس النواب',
  );
  static final PlateSpec judicial = _letters(
    id: 'jo.judicial',
    country: JordanCountry.red,
    ink: JordanColors.white,
    caption: 'مجلس قضائي',
  );
  static final PlateSpec governmental = _letters(
    id: 'jo.governmental',
    country: JordanCountry.red,
    ink: JordanColors.white,
    caption: 'حكومي',
  );
  static final PlateSpec aqaba = _letters(
    id: 'jo.aqaba',
    country: JordanCountry.red,
    ink: JordanColors.white,
    caption: 'سلطة العقبة',
  );
  static final PlateSpec diplomatic = _letters(
    id: 'jo.diplomatic',
    country: JordanCountry.diplomatic,
    ink: JordanColors.black,
    caption: 'دبلوماسي',
  );

  static PlateSpec _service({
    required String id,
    required String top,
    required String bottom,
  }) => _plate(
    id: id,
    country: JordanCountry.plain,
    strip: false,
    labels: <PlateLabel>[
      PlateLabel(
        text: top,
        box: _Layout.serviceTop,
        glyphHeight: _Layout.serviceGlyph,
      ),
      PlateLabel(
        text: bottom,
        box: _Layout.serviceBottom,
        glyphHeight: _Layout.serviceGlyph,
      ),
    ],
  );

  /// The country name gives way to the service's own two lines.
  static final PlateSpec police = _service(
    id: 'jo.police',
    top: 'الامن',
    bottom: 'العام',
  );
  static final PlateSpec ambulance = _service(
    id: 'jo.ambulance',
    top: 'الدفاع',
    bottom: 'المدني',
  );
  static final PlateSpec gendarmerie = _service(
    id: 'jo.gendarmerie',
    top: 'قوات',
    bottom: 'الدرك',
  );

  /// Two rows: the code over the serial, on a near-square plate.
  static final PlateSpec motorcycle = PlateSpec(
    id: 'jo.motorcycle',
    country: JordanCountry.plain,
    canvasWidth: _Layout.bikeWidth,
    canvasHeight: _Layout.bikeHeight,
    panel: const PlatePanel(box: PlateBox(0, 0, 1, 1)),
    noPanel: true,
    slots: <PlateSlot>[
      PlateSlot(
        alphabet: JordanAlphabets.digits,
        box: PlateBox(
          _Layout.bikeCodeLeft,
          _Layout.bikeCodeTop,
          2 * _Layout.bikePitch,
          _Layout.bikeCellHeight,
        ),
        length: 2,
        minLength: 1,
      ),
      PlateSlot(
        alphabet: JordanAlphabets.digits,
        box: PlateBox(
          _Layout.bikeSerialLeft,
          _Layout.bikeSerialTop,
          4 * _Layout.bikePitch,
          _Layout.bikeCellHeight,
        ),
        length: 4,
        minLength: 1,
      ),
    ],
    labels: const <PlateLabel>[
      PlateLabel(
        text: 'الاردن',
        box: _Layout.bikeArabicName,
        glyphHeight: _Layout.bikeArabicGlyph,
      ),
      PlateLabel(
        text: 'JORDAN',
        box: _Layout.bikeLatinName,
        glyphHeight: _Layout.bikeLatinGlyph,
      ),
    ],
    textGroups: _groups,
    borderWidthRatioOverride: _Layout.bikeBorderRatio,
  );

  static final List<PlateSpec> all = <PlateSpec>[
    private,
    motorcycle,
    transport,
    rental,
    trailer,
    temporary,
    executive,
    legislative,
    judicial,
    governmental,
    aqaba,
    diplomatic,
    police,
    ambulance,
    gendarmerie,
  ];

  /// The design whose `PlateSpec.id` is [specId] (see `JordanUsage.specId`).
  static PlateSpec forSpecId(String specId) =>
      all.firstWhere((s) => s.id == specId);
}
