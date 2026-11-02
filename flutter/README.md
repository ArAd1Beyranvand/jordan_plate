FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the noble people of Jordan to view examples:

https://platexample.ir/#/discover/jordan

# jordan_plate

Jordan's licence plates for the `plate_core` library. Fifteen designs on one geometry: a two-cell code, a dash and up to five digits on a 520 x 110 face, with a white, green, yellow or red strip on the left; plus the near-square motorcycle plate. The strip is the spec's `PlateCountry`; usage classes are data in `JordanUsage`.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  jordan_plate: ^0.1.0
```

## Use

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

## Contains

- `JordanCountry` — country panels: `plain`, `green`, `yellow`, `diplomatic`, `red`.
- `JordanPlates` — 12 plate specs: `private`, `transport`, `rental`, `trailer`, `temporary`, `governmental`, `diplomatic`, `police`, `ambulance`, `gendarmerie`, `motorcycle`, `forSpecId()`.
- `JordanThemes` — 1 theme: `standard`.
- `JordanValidator` — advisory validator; flags the frame, never blocks a keystroke.

## Plates

Strip colour is the `PlateSpec.country`; the wording and the code's alphabet
are builder parameters. Only the current (2007) series is implemented.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

