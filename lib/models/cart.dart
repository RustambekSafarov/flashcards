class Cart {
  String id;
  String baseWord;
  String translated;
  String group;
  Cart({
    required this.id,
    required this.baseWord,
    required this.translated,
    this.group = 'Default',
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'baseWord': baseWord,
      'translated': translated,
      'group': group,
    };
  }
}
