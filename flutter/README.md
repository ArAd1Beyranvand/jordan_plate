FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the noble people of Jordan to view examples:

https://platexample.ir/#/discover/jordan:flutter

# jordan_plate

Jordan's licence plates for plate_core: the 520 x 110 plate in white, green, yellow and red strips, the two-line motorcycle plate and the police plates, with an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/jordan_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/jordan:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/jordan_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/jordan:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/jordan_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/jordan:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/jordan_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/jordan:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  jordan_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:jordan_plate/jordan_plate.dart';

PlateCanvas(
  spec: JordanPlates.private,
  theme: JordanThemes.standard,
  validator: const JordanValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `JordanPlates.private` — id `jo.private`
- `JordanPlates.transport` — id `jo.transport`
- `JordanPlates.rental` — id `jo.rental`
- `JordanPlates.trailer` — id `jo.trailer`
- `JordanPlates.temporary` — id `jo.temporary`
- `JordanPlates.governmental` — id `jo.governmental`
- `JordanPlates.diplomatic` — id `jo.diplomatic`
- `JordanPlates.police` — id `jo.police`
- `JordanPlates.ambulance` — id `jo.ambulance`
- `JordanPlates.gendarmerie` — id `jo.gendarmerie`
- `JordanPlates.motorcycle` — id `jo.motorcycle`
- `JordanPlates.forSpecId`(…)

## Themes

- `JordanThemes.standard`

## Change it

`PlateCanvas` takes `spec:` (an entry of `JordanPlates`) and `theme:` (an entry of `JordanThemes`). Set `validator:` to `JordanValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `JordanCountry` — the country panel.
- `JordanValidator` — the plate validator.

## Plates

Strip colour is the `PlateSpec.country`; the wording and the code's alphabet
are builder parameters. Only the current (2007) series is implemented.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/jordan_plate/blob/main/LICENSE).
