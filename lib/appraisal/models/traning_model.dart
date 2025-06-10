import 'dart:convert';

/// Convert JSON string to [TrainingDevelopmentResponse] object
TrainingDevelopmentResponse traningModelFromJson(String str) =>
    TrainingDevelopmentResponse.fromJson(json.decode(str));

/// Convert [TrainingDevelopmentResponse] object to JSON string
String traningModelToJson(TrainingDevelopmentResponse data) =>
    json.encode(data.toJson());

/// Root response model
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

/// Individual training item model
class TrainingDevelopmentItem {
  final String id;
  final String period;
  final String category;
  final String? createrName;
  final int? createrId;
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
    this.createrName,
    this.createrId,
  });

  factory TrainingDevelopmentItem.fromJson(Map<String, dynamic> json) {
    return TrainingDevelopmentItem(
      id: json['ID'] ?? '',
      period: json['Period'] ?? '',
      category: json['Category'] ?? '',
      empId: json['EmpID'] ?? '',
      description: json['Description'] ?? '',
      createrName: json['CreaterName'],
      createrId: int.tryParse(json['createrId']?.toString() ?? ''),
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
      'CreaterName': createrName,
      'createrId': createrId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}