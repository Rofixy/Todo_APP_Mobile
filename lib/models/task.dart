class Task {
  final int id;
  final String task;
  final String description;
  final DateTime? dueDate;

  Task({
    required this.id,
    required this.task,
    required this.description,
    this.dueDate,
  });

  // Fungsi untuk konversi dari JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      task: json['taskName'],
      description: json['description'],
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
    );
  }

  // Fungsi untuk konversi ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': task,
      'description': description,
      'dueDate': dueDate?.toIso8601String(),
    };
  }
}
