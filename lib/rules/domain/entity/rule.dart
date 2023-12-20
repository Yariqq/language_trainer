class Rule {
  final int id;
  final String name;

  const Rule({
    required this.id,
    required this.name,
  });

  Rule.empty()
      : id = -1,
        name = '';
}
