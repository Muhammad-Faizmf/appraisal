// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool status;
    String message;
    LoginData loginData;
    String tokken;

    LoginModel({
        required this.status,
        required this.message,
        required this.loginData,
        required this.tokken,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        loginData: LoginData.fromJson(json["loginData"]),
        tokken: json["tokken"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "loginData": loginData.toJson(),
        "tokken": tokken,
    };
}

class LoginData {
    String stdEmpId;
    int empId;
    String departmentName;
    int departmentId;
    String name;
    String positionName;
    int uFirstSupervisorId;
    String uFirstSupervisorName;
    int uSecondSupervisorId;
    String uSecondSupervisorName;
    String userCode;
    String password;
    String subDepartment;
    int subDepartmentId;
    int positionId;
    String locationName;
    String email;
    int locationId;
    String positionType;
    int positionTypeId;
    String employeeContractType;
    String adminSupervisor;
    DateTime joinDate;
    String tenureInYears;
    int tenureInDays;
    int grade;
    String gradeName;
    int grossSalary;
    String uFlgActive;
    dynamic bonus;
    dynamic totalSalary;

    LoginData({
        required this.stdEmpId,
        required this.empId,
        required this.departmentName,
        required this.departmentId,
        required this.name,
        required this.positionName,
        required this.uFirstSupervisorId,
        required this.uFirstSupervisorName,
        required this.uSecondSupervisorId,
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
        required this.adminSupervisor,
        required this.joinDate,
        required this.tenureInYears,
        required this.tenureInDays,
        required this.grade,
        required this.gradeName,
        required this.grossSalary,
        required this.uFlgActive,
        required this.bonus,
        required this.totalSalary,
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
        joinDate: DateTime.parse(json["JoinDate"]),
        tenureInYears: json["TenureInYears"],
        tenureInDays: json["TenureInDays"],
        grade: json["Grade"],
        gradeName: json["GradeName"],
        grossSalary: json["GrossSalary"],
        uFlgActive: json["U_flgActive"],
        bonus: json["BONUS"]??0,
        totalSalary: json["TotalSalary"]??0,
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
        "JoinDate": joinDate.toIso8601String(),
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
