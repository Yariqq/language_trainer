class Rule {
  final String id;
  final String name;

  const Rule({
    required this.id,
    required this.name,
  });

  Rule.empty()
      : id = '',
        name = '';
}
