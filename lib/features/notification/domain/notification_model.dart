class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final DateTime date;
  final String message;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.date,
    required this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'date': date.toIso8601String(),
      'message': message,
    };
  }

  NotificationModel copyWith({
    String? id,
    String? userId,
    String? title,
    DateTime? date,
    String? message,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      date: date ?? this.date,
      message: message ?? this.message,
    );
  }
}
