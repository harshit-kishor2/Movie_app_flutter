enum OriginalLanguage { en, ja, it, sv }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.en,
  "it": OriginalLanguage.it,
  "ja": OriginalLanguage.ja,
  "sv": OriginalLanguage.sv
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return map.map((k, v) => MapEntry(v, k));
  }
}
