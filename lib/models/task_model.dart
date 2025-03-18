class Task {
  final int? id;
  final String name;
  final String details;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool isFavourite;

  Task({
    this.id,
    required this.name,
    required this.details,
    required this.createdDate,
    required this.updatedDate,
    this.isFavourite = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['task_id'],
      name: json['task_name'],
      details: json['task_details'],
      createdDate: DateTime.parse(json['created_date']),
      updatedDate: DateTime.parse(json['updated_date']),
      isFavourite: json['is_favourite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_id': id,
      'task_name': name,
      'task_details': details,
      'created_date': createdDate.toIso8601String(),
      'updated_date': updatedDate.toIso8601String(),
      'is_favourite': isFavourite,
    };
  }
}
