FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the noble people of Jordan to view examples:

https://platexample.ir/#/discover/jordan:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/jordan/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.jordan.country

val spec = country.specs["jo.private"]
println(country.pkg)
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

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`JordanValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/jordan_plate/blob/main/LICENSE).
