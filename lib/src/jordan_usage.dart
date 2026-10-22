/// One class of vehicle, the code it carries and the design that prints it.
///
/// A usage is data, not a spec: private, van and pick-up print on the same white
/// plate and differ only in code, so [specId] points at the shared design.
///
/// Source: Wikipedia, "Vehicle registration plates of Jordan". Its overlapping
/// ranges (private "1-49" against van 36-37, pick-up 38-40) are kept as
/// published. Army (90) has no artwork, so no spec and no entry.
class JordanUsage {
  const JordanUsage({
    required this.id,
    required this.english,
    this.arabic = '',
    required this.codes,
    required this.specId,
  });

  final String id;
  final String english;

  /// The Arabic wording the plate prints, or '' for none beyond the country name.
  final String arabic;

  /// Empty when the article gives none.
  final List<String> codes;

  final String specId;

  static List<String> _range(int from, int to) => <String>[for (var i = from; i <= to; i++) '$i'];

  static final JordanUsage private = JordanUsage(
    id: 'private',
    english: 'Private',
    codes: <String>[..._range(1, 49), '66', '77', '80', '88'],
    specId: 'jo.private',
  );
  static const JordanUsage van = JordanUsage(
    id: 'van',
    english: 'Van',
    codes: <String>['36', '37'],
    specId: 'jo.private',
  );
  static const JordanUsage pickUp = JordanUsage(
    id: 'pickUp',
    english: 'Pick-up truck',
    codes: <String>['38', '39', '40'],
    specId: 'jo.private',
  );
  static const JordanUsage lightGoods = JordanUsage(
    id: 'lightGoods',
    english: 'Light goods vehicle',
    codes: <String>['41', '42', '43'],
    specId: 'jo.private',
  );
  static const JordanUsage agricultural = JordanUsage(
    id: 'agricultural',
    english: 'Agricultural',
    codes: <String>['44'],
    specId: 'jo.private',
  );
  static const JordanUsage construction = JordanUsage(
    id: 'construction',
    english: 'Construction truck',
    codes: <String>['45'],
    specId: 'jo.private',
  );
  static const JordanUsage customsExemption = JordanUsage(
    id: 'customsExemption',
    english: 'Customs exemption',
    codes: <String>['81'],
    specId: 'jo.private',
  );
  static const JordanUsage motorcycle = JordanUsage(
    id: 'motorcycle',
    english: 'Motorcycle',
    codes: <String>['46', '47'],
    specId: 'jo.motorcycle',
  );
  static const JordanUsage taxi = JordanUsage(
    id: 'taxi',
    english: 'Taxi',
    codes: <String>['50', '51', '52', '53', '54', '55'],
    specId: 'jo.transport',
  );
  static const JordanUsage cityBus = JordanUsage(
    id: 'cityBus',
    english: 'City bus',
    codes: <String>['56', '57'],
    specId: 'jo.transport',
  );
  static const JordanUsage coachBus = JordanUsage(
    id: 'coachBus',
    english: 'Coach bus',
    codes: <String>['58', '59'],
    specId: 'jo.transport',
  );
  static const JordanUsage heavyGoods = JordanUsage(
    id: 'heavyGoods',
    english: 'Heavy goods vehicle',
    codes: <String>['60'],
    specId: 'jo.transport',
  );
  static const JordanUsage rental = JordanUsage(
    id: 'rental',
    english: 'Rental',
    codes: <String>['70'],
    specId: 'jo.rental',
  );
  static const JordanUsage trailer = JordanUsage(
    id: 'trailer',
    english: 'Trailer',
    codes: <String>['71'],
    specId: 'jo.trailer',
  );

  /// The article lists no code for a temporary plate; the artwork shows `8`.
  static const JordanUsage temporary = JordanUsage(
    id: 'temporary',
    english: 'Temporary',
    arabic: 'موقت',
    codes: <String>[],
    specId: 'jo.temporary',
  );
  static const JordanUsage executive = JordanUsage(
    id: 'executive',
    english: 'Executive branch',
    arabic: 'مجلس الوزراء',
    codes: <String>['PM'],
    specId: 'jo.executive',
  );
  static const JordanUsage legislative = JordanUsage(
    id: 'legislative',
    english: 'Legislative branch',
    arabic: 'مجلس النواب',
    codes: <String>['PR', 'SN'],
    specId: 'jo.legislative',
  );
  static const JordanUsage judicial = JordanUsage(
    id: 'judicial',
    english: 'Judicial branch',
    arabic: 'مجلس قضائي',
    codes: <String>['JC'],
    specId: 'jo.judicial',
  );
  static const JordanUsage governmental = JordanUsage(
    id: 'governmental',
    english: 'Governmental',
    arabic: 'حكومي',
    codes: <String>['GV'],
    specId: 'jo.governmental',
  );
  static const JordanUsage aqaba = JordanUsage(
    id: 'aqaba',
    english: 'Aqaba Free Trade Zone',
    arabic: 'سلطة العقبة',
    codes: <String>['AQ'],
    specId: 'jo.aqaba',
  );
  static const JordanUsage diplomatic = JordanUsage(
    id: 'diplomatic',
    english: 'Diplomatic',
    arabic: 'دبلوماسي',
    codes: <String>['CD'],
    specId: 'jo.diplomatic',
  );
  static const JordanUsage police = JordanUsage(
    id: 'police',
    english: 'Police',
    arabic: 'الامن العام',
    codes: <String>['99'],
    specId: 'jo.police',
  );
  static const JordanUsage ambulance = JordanUsage(
    id: 'ambulance',
    english: 'Ambulance (civil defence)',
    arabic: 'الدفاع المدني',
    codes: <String>['95'],
    specId: 'jo.ambulance',
  );
  static const JordanUsage gendarmerie = JordanUsage(
    id: 'gendarmerie',
    english: 'Gendarmerie',
    arabic: 'قوات الدرك',
    codes: <String>['96'],
    specId: 'jo.gendarmerie',
  );

  static final List<JordanUsage> all = <JordanUsage>[
    private,
    van,
    pickUp,
    lightGoods,
    agricultural,
    construction,
    customsExemption,
    motorcycle,
    taxi,
    cityBus,
    coachBus,
    heavyGoods,
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

  /// Every code a design carries, across the usages printed on it.
  static List<String> codesOf(String specId) => <String>[
    for (final u in all)
      if (u.specId == specId) ...u.codes,
  ];
}
