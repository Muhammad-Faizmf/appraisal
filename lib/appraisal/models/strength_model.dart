import 'dart:convert';

StrengthModel strengthModelFromJson(String str) =>
    StrengthModel.fromJson(json.decode(str));
String strengthModelToJson(StrengthModel data) => json.encode(data.toJson());

class StrengthModel {
  final bool status;
  final String message;
  final List<StrengthWeakness> strengthWeakness;

  StrengthModel({
    required this.status,
    required this.message,
    required this.strengthWeakness,
  });

  factory StrengthModel.fromJson(Map<String, dynamic> json) {
    return StrengthModel(
      status: json['status'],
      message: json['message'],
      strengthWeakness: List<StrengthWeakness>.from(
        json['strengthweakness'].map((x) => StrengthWeakness.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'strengthweakness': strengthWeakness.map((x) => x.toJson()).toList(),
      };
}

class StrengthWeakness {
  final String id;
  final String period;
  final String category;
  final String sn;
  final String empId;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  StrengthWeakness({
    required this.id,
    required this.period,
    required this.category,
    required this.sn,
    required this.empId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StrengthWeakness.fromJson(Map<String, dynamic> json) {
    return StrengthWeakness(
      id: json['ID'],
      period: json['Period'],
      category: json['Category'],
      sn: json['SN'],
      empId: json['EmpID'],
      description: json['Description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Period': period,
        'Category': category,
        'SN': sn,
        'EmpID': empId,
        'Description': description,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
