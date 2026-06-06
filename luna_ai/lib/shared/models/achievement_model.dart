class AchievementModel {
  const AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.earned,
    this.progress,
    this.target,
  });

  final String id;
  final String title;
  final String description;
  final String icon;
  final bool earned;
  final int? progress;
  final int? target;
}
