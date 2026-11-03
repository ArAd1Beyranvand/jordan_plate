import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:jordan_plate/jordan_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: JordanPlates.private, theme: JordanThemes.standard),
);
