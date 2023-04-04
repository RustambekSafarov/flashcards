class Cart {
  int id;
  String baseWord;
  String translated;
  String group;
  Cart({
    required this.id,
    required this.baseWord,
    required this.translated,
    this.group = '',
  });
}
