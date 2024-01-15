class Sponsor {
  final String name;
  final int nr;

  Sponsor({
    required this.name,
    required this.nr,
  });

  @override
  String toString() {
    return 'Sponsor(name: $name, nr: $nr)';
  }
}