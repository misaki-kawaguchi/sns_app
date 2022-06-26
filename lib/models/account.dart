class Account {
  Account({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.selfIntroduction,
    required this.userId,
    this.createdTime,
    this.updatedTime,
  });

  final String id;
  final String name;
  final String imagePath;
  final String selfIntroduction;
  final String userId;
  final DateTime? createdTime;
  final DateTime? updatedTime;
}
