import 'dart:convert';

// We are using this model for chief remarks not HR

HRRemarksResponse hrRemarksModelFromJson(String str) =>
    HRRemarksResponse.fromJson(json.decode(str));
String hrRemarksModelToJson(HRRemarksResponse data) =>
    json.encode(data.toJson());

class HRRemarksResponse {
  final bool status;
  final String message;
  final List<HRRemarkItem> hrRemarks;

  HRRemarksResponse({
    required this.status,
    required this.message,
    required this.hrRemarks,
  });

  factory HRRemarksResponse.fromJson(Map<String, dynamic> json) {
    return HRRemarksResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      hrRemarks: (json['hrRemarks'] as List<dynamic>?)
              ?.map((e) => HRRemarkItem.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'hrRemarks': hrRemarks.map((e) => e.toJson()).toList(),
    };
  }
}

class HRRemarkItem {
  final String id;
  final String period;
  final String category;
  final String empId;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  HRRemarkItem({
    required this.id,
    required this.period,
    required this.category,
    required this.empId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HRRemarkItem.fromJson(Map<String, dynamic> json) {
    return HRRemarkItem(
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
