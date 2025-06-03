// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? status;
  String? message;
  LoginData? loginData;
  String? tokken;

  LoginModel({
    this.status,
    this.message,
    this.loginData,
    this.tokken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        loginData: json["loginData"] == null
            ? null
            : LoginData.fromJson(json["loginData"]),
        tokken: json["tokken"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "loginData": loginData?.toJson(),
        "tokken": tokken,
      };
}

class LoginData {
  String? stdEmpId;
  int? empId;
  String? departmentName;
  int? departmentId;
  String? name;
  String? positionName;
  int? uFirstSupervisorId;
  String? uFirstSupervisorName;
  int? uSecondSupervisorId;
  String? uSecondSupervisorName;
  String? userCode;
  String? password;
  String? subDepartment;
  int? subDepartmentId;
  int? positionId;
  String? locationName;
  String? email;
  int? locationId;
  String? positionType;
  int? positionTypeId;
  String? employeeContractType;
  String? adminSupervisor;
  DateTime? joinDate;
  String? tenureInYears;
  int? tenureInDays;
  int? grade;
  String? gradeName;
  int? grossSalary;
  String? uFlgActive;
  int? bonus;
  int? totalSalary;

  LoginData({
    this.stdEmpId,
    this.empId,
    this.departmentName,
    this.departmentId,
    this.name,
    this.positionName,
    this.uFirstSupervisorId,
    this.uFirstSupervisorName,
    this.uSecondSupervisorId,
    this.uSecondSupervisorName,
    this.userCode,
    this.password,
    this.subDepartment,
    this.subDepartmentId,
    this.positionId,
    this.locationName,
    this.email,
    this.locationId,
    this.positionType,
    this.positionTypeId,
    this.employeeContractType,
    this.adminSupervisor,
    this.joinDate,
    this.tenureInYears,
    this.tenureInDays,
    this.grade,
    this.gradeName,
    this.grossSalary,
    this.uFlgActive,
    this.bonus,
    this.totalSalary,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        stdEmpId: json["StdEmpId"],
        empId: json["EmpID"],
        departmentName: json["DepartmentName"],
        departmentId: json["DepartmentId"],
        name: json["Name"],
        positionName: json["PositionName"],
        uFirstSupervisorId: json["U_FirstSupervisorID"],
        uFirstSupervisorName: json["U_FirstSupervisorName"],
        uSecondSupervisorId: json["U_SecondSupervisorID"],
        uSecondSupervisorName: json["U_SecondSupervisorName"],
        userCode: json["UserCode"],
        password: json["Password"],
        subDepartment: json["SubDepartment"],
        subDepartmentId: json["SubDepartmentId"],
        positionId: json["positionID"],
        locationName: json["LocationName"],
        email: json["Email"],
        locationId: json["LocationId"],
        positionType: json["PositionType"],
        positionTypeId: json["PositionTypeID"],
        employeeContractType: json["EmployeeContractType"],
        adminSupervisor: json["AdminSupervisor"],
        joinDate:
            json["JoinDate"] == null ? null : DateTime.parse(json["JoinDate"]),
        tenureInYears: json["TenureInYears"],
        tenureInDays: json["TenureInDays"],
        grade: json["Grade"],
        gradeName: json["GradeName"],
        grossSalary: json["GrossSalary"],
        uFlgActive: json["U_flgActive"],
        bonus: json["BONUS"],
        totalSalary: json["TotalSalary"],
      );

  Map<String, dynamic> toJson() => {
        "StdEmpId": stdEmpId,
        "EmpID": empId,
        "DepartmentName": departmentName,
        "DepartmentId": departmentId,
        "Name": name,
        "PositionName": positionName,
        "U_FirstSupervisorID": uFirstSupervisorId,
        "U_FirstSupervisorName": uFirstSupervisorName,
        "U_SecondSupervisorID": uSecondSupervisorId,
        "U_SecondSupervisorName": uSecondSupervisorName,
        "UserCode": userCode,
        "Password": password,
        "SubDepartment": subDepartment,
        "SubDepartmentId": subDepartmentId,
        "positionID": positionId,
        "LocationName": locationName,
        "Email": email,
        "LocationId": locationId,
        "PositionType": positionType,
        "PositionTypeID": positionTypeId,
        "EmployeeContractType": employeeContractType,
        "AdminSupervisor": adminSupervisor,
        "JoinDate": joinDate?.toIso8601String(),
        "TenureInYears": tenureInYears,
        "TenureInDays": tenureInDays,
        "Grade": grade,
        "GradeName": gradeName,
        "GrossSalary": grossSalary,
        "U_flgActive": uFlgActive,
        "BONUS": bonus,
        "TotalSalary": totalSalary,
      };
}
