class CruiseDestination {
  final String name;
  final String location;
  final String description;
  final String imagePath;
  final String imageCaption;
  final int initialRating;
  final List<String> packages;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.imagePath,
    required this.imageCaption,
    required this.initialRating,
    required this.packages,
  });
}
