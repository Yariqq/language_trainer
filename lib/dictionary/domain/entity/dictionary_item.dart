class DictionaryItem {
  final String eng;
  final String farsi;
  final String? stem;
  final bool? isPreposition;

  const DictionaryItem({
    required this.eng,
    required this.farsi,
    this.stem,
    this.isPreposition,
  });
}
