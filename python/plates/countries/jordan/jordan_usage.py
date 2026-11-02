"""Port of the codes of jordan_plate/lib/src/jordan_usage.dart, grouped by the spec that prints them."""
from __future__ import annotations

_CODES = {
    "jo.private": ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "66", "77", "80", "88", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "81"),
    "jo.motorcycle": ("46", "47"),
    "jo.transport": ("50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"),
    "jo.rental": ("70",),
    "jo.trailer": ("71",),
    "jo.temporary": (),
    "jo.governmental": ("PM", "PR", "SN", "JC", "GV", "AQ"),
    "jo.diplomatic": ("CD",),
    "jo.police": ("99",),
    "jo.ambulance": ("95",),
    "jo.gendarmerie": ("96",),
}


class JordanUsage:
    @staticmethod
    def codes_of(spec_id: str) -> tuple[str, ...]:
        return _CODES.get(spec_id, ())
