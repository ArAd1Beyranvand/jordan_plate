FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the noble people of Jordan to view examples:

https://platexample.ir/#/discover/jordan:python

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

### Install (Python)

Copy `python/plates/countries/jordan/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.jordan.data import SPECS, THEMES

spec = SPECS["jo.private"]
theme = THEMES["JordanThemes.standard"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `jo.private`
- `jo.transport`
- `jo.rental`
- `jo.trailer`
- `jo.temporary`
- `jo.governmental`
- `jo.diplomatic`
- `jo.police`
- `jo.ambulance`
- `jo.gendarmerie`
- `jo.motorcycle`

## Themes

- `JordanThemes.standard`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `JordanValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/jordan_plate/blob/main/LICENSE).
