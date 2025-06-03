import 'dart:convert';

TrainingDevelopmentResponse traningModelFromJson(String str) =>
    TrainingDevelopmentResponse.fromJson(json.decode(str));
String traningModelToJson(TrainingDevelopmentResponse data) =>
    json.encode(data.toJson());

class TrainingDevelopmentResponse {
  final bool status;
  final String message;
  final List<TrainingDevelopmentItem> trainingDevelopement;

  TrainingDevelopmentResponse({
    required this.status,
    required this.message,
    required this.trainingDevelopement,
  });

  factory TrainingDevelopmentResponse.fromJson(Map<String, dynamic> json) {
    return TrainingDevelopmentResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      trainingDevelopement: (json['trainingDevelopement'] as List<dynamic>?)
              ?.map((e) => TrainingDevelopmentItem.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'trainingDevelopement':
          trainingDevelopement.map((e) => e.toJson()).toList(),
    };
  }
}

class TrainingDevelopmentItem {
  final String id;
  final String period;
  final String category;
  final String empId;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  TrainingDevelopmentItem({
    required this.id,
    required this.period,
    required this.category,
    required this.empId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TrainingDevelopmentItem.fromJson(Map<String, dynamic> json) {
    return TrainingDevelopmentItem(
      id: json['ID'] ?? '',
      period: json['Period'] ?? '',
      category: json['Category'] ?? '',
      empId: json['EmpID'] ?? '',
      description: json['Description'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Period': period,
      'Category': category,
      'EmpID': empId,
      'Description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
