"""Port of jordan_plate/lib/src/jordan_validators.dart."""
from __future__ import annotations

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits

from .jordan_usage import JordanUsage


class JordanValidator(GatedPlateValidator):
    gate_group = "serial"

    REASON_CODE_MISSING = "A plate starts with a code."
    REASON_CODE_UNKNOWN = "That code is not issued on this plate."
    REASON_SERIAL_NOT_NUMERIC = "The number is digits only."
    REASON_SERIAL_LENGTH = "The number is one to five digits."

    MAX_SERIAL_LENGTH = 5

    def judge(self, entry: PlateEntry) -> PlateValidation:
        code, serial = entry.group("code"), entry.group("serial")
        if not code:
            return PlateValidation.invalid(self.REASON_CODE_MISSING)
        known = JordanUsage.codes_of(entry.spec.id)
        if known and code not in known:
            return PlateValidation.invalid(self.REASON_CODE_UNKNOWN)
        if not serial or len(serial) > self.MAX_SERIAL_LENGTH:
            return PlateValidation.invalid(self.REASON_SERIAL_LENGTH)
        if not is_digits(serial):
            return PlateValidation.invalid(self.REASON_SERIAL_NOT_NUMERIC)
        return PlateValidation.valid()
