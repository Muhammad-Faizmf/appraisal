// To parse this JSON data, do
//
//     final heirarchyModel = heirarchyModelFromJson(jsonString);

import 'dart:convert';

HeirarchyModel heirarchyModelFromJson(String str) =>
    HeirarchyModel.fromJson(json.decode(str));

String heirarchyModelToJson(HeirarchyModel data) => json.encode(data.toJson());

class HeirarchyModel {
  bool status;
  String message;
  List<Heirarchy> heirarchy;

  HeirarchyModel({
    required this.status,
    required this.message,
    required this.heirarchy,
  });

  factory HeirarchyModel.fromJson(Map<String, dynamic> json) => HeirarchyModel(
        status: json["status"],
        message: json["message"],
        heirarchy: List<Heirarchy>.from(
            json["heirarchy"].map((x) => Heirarchy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "heirarchy": List<dynamic>.from(heirarchy.map((x) => x.toJson())),
      };
}

class Heirarchy {
  final String name;
  final String stdEmpId;
  final int empId;
  final String departmentName;
  final int departmentId;
  final String positionName;
  final int minSalary;
  final int maxSalary;
  final int uMinGradeId;
  final String minGradeName;
  final int uMaxGradeId;
  final String maxGradeName;
  final int firstSupervisorEmpId;
  final String firstSupervisorName;
  final int secondSupervisorEmpId;
  final String uSecondSupervisorName;
  final String userCode;
  final String password;
  final String subDepartment;
  final int subDepartmentId;
  final int positionId;
  final String locationName;
  final String email;
  final int locationId;
  final String positionType;
  final int positionTypeId;
  final String employeeContractType;
  final String? adminSupervisor;
  final String joinDate;
  final String tenureInYears;
  final int tenureInDays;
  final int grade;
  final String gradeName;
  final int grossSalary;
  final String uFlgActive;
  final int bonus;
  final double totalSalary;
  final int departmentalChiefId;
  final String departmentalChiefName;

  Heirarchy({
    required this.name,
    required this.stdEmpId,
    required this.empId,
    required this.departmentName,
    required this.departmentId,
    required this.positionName,
    required this.minSalary,
    required this.maxSalary,
    required this.uMinGradeId,
    required this.minGradeName,
    required this.uMaxGradeId,
    required this.maxGradeName,
    required this.firstSupervisorEmpId,
    required this.firstSupervisorName,
    required this.secondSupervisorEmpId,
    required this.uSecondSupervisorName,
    required this.userCode,
    required this.password,
    required this.subDepartment,
    required this.subDepartmentId,
    required this.positionId,
    required this.locationName,
    required this.email,
    required this.locationId,
    required this.positionType,
    required this.positionTypeId,
    required this.employeeContractType,
    this.adminSupervisor,
    required this.joinDate,
    required this.tenureInYears,
    required this.tenureInDays,
    required this.grade,
    required this.gradeName,
    required this.grossSalary,
    required this.uFlgActive,
    required this.bonus,
    required this.totalSalary,
    required this.departmentalChiefId,
    required this.departmentalChiefName,
  });

  factory Heirarchy.fromJson(Map<String, dynamic> json) {
    return Heirarchy(
      name: json['Name'],
      stdEmpId: json['StdEmpId'],
      empId: json['EmpID'],
      departmentName: json['DepartmentName'],
      departmentId: json['DepartmentId'],
      positionName: json['PositionName'],
      minSalary: json['MinSalary'],
      maxSalary: json['MaxSalary'],
      uMinGradeId: json['U_MinGradeID'],
      minGradeName: json['MinGradeName'],
      uMaxGradeId: json['U_MaxGradeID'],
      maxGradeName: json['MaxGradeName'],
      firstSupervisorEmpId: json['FirstSupervisorEmpId'],
      firstSupervisorName: json['FirstSupervisorName'],
      secondSupervisorEmpId: json['SecondSupervisorEmpId'],
      uSecondSupervisorName: json['U_SecondSupervisorName'],
      userCode: json['UserCode'],
      password: json['Password'],
      subDepartment: json['SubDepartment'],
      subDepartmentId: json['SubDepartmentId'],
      positionId: json['PositionID'],
      locationName: json['LocationName'],
      email: json['Email'],
      locationId: json['LocationId'],
      positionType: json['PositionType'],
      positionTypeId: json['PositionTypeID'],
      employeeContractType: json['EmployeeContractType'],
      adminSupervisor: json['AdminSupervisor'],
      joinDate: json['JoinDate'],
      tenureInYears: json['TenureInYears'],
      tenureInDays: json['TenureInDays'],
      grade: json['Grade'],
      gradeName: json['GradeName'],
      grossSalary: json['GrossSalary'],
      uFlgActive: json['U_flgActive'],
      bonus: json['BONUS'],
      totalSalary: json['TotalSalary'],
      departmentalChiefId: json['DepartmentalChielfID'],
      departmentalChiefName: json['DepartmentalChielfName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'StdEmpId': stdEmpId,
      'EmpID': empId,
      'DepartmentName': departmentName,
      'DepartmentId': departmentId,
      'PositionName': positionName,
      'MinSalary': minSalary,
      'MaxSalary': maxSalary,
      'U_MinGradeID': uMinGradeId,
      'MinGradeName': minGradeName,
      'U_MaxGradeID': uMaxGradeId,
      'MaxGradeName': maxGradeName,
      'FirstSupervisorEmpId': firstSupervisorEmpId,
      'FirstSupervisorName': firstSupervisorName,
      'SecondSupervisorEmpId': secondSupervisorEmpId,
      'U_SecondSupervisorName': uSecondSupervisorName,
      'UserCode': userCode,
      'Password': password,
      'SubDepartment': subDepartment,
      'SubDepartmentId': subDepartmentId,
      'PositionID': positionId,
      'LocationName': locationName,
      'Email': email,
      'LocationId': locationId,
      'PositionType': positionType,
      'PositionTypeID': positionTypeId,
      'EmployeeContractType': employeeContractType,
      'AdminSupervisor': adminSupervisor,
      'JoinDate': joinDate,
      'TenureInYears': tenureInYears,
      'TenureInDays': tenureInDays,
      'Grade': grade,
      'GradeName': gradeName,
      'GrossSalary': grossSalary,
      'U_flgActive': uFlgActive,
      'BONUS': bonus,
      'TotalSalary': totalSalary,
      'DepartmentalChielfID': departmentalChiefId,
      'DepartmentalChielfName': departmentalChiefName,
    };
  }
}
