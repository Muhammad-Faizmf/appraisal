import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static String empId = 'EMPID';
  static String stdEmpId = 'STDEMPID';
  static String image = 'image';
  static String name = 'NAME';
  static String gradeId = 'GRADEID';
  static String greadeName = 'GRADENAME';
  static String positionId = 'POSITIONID';
  static String positionName = 'POSITIONNAME';
  static String positionTypeId = 'POSITIONTYPEID';
  static String positionTypeName = 'POSITIONTYPEName';
  static String departmentID = 'DEPARTMENTID';
  static String departmentName = 'DEPARTMENTName';
  static String subDepartmentId = 'SUBDEPARTMENTID';
  static String subDepartmentName = 'SUBDEPARTMENTName';

  static String locationId = "LOCAITONID";
  static String locationName = "LOCATIONNAME";

  static String companyID = "COMPANYID";
  static String companyName = "COMPANYNAME";
  static String gender = "GENDER";
  static String dateOfJoining = "DATEOFJOINING";

  static String tokken = "TOKKENN";
  static String rememberMe = "REMEMBERME";
  static String contractType = "CONTRACTTYPE";
  static String tenureInDays = "TENUREINDAYS";
  static String tenureInYears = "TENUREINYEARS";
  static String grossSalary = "GROSSSALARY";
  static String totalSalary = "TotalSalary";
  static String userCode = "USERCODE";
  static String bonus = "BONUS";
  static String login = "LOGIN";
  static String firstSupervisorId = "FIRSTSUPERVISORID";
  static String secondSupervisorId = "SECONDSUPERVISORID";

  static Box? _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('appraisal_session');
  }

  static void setLogin(bool value) {
    _box!.put(login, value);
  }

  static bool? getLogin() {
    return _box?.get(login) ?? false;
  }

  static void setEmpId(int value) {
    _box!.put(empId, value);
  }

  static int? getEmpId() {
    return _box!.get(empId);
  }

  static void setStdEmpId(String value) {
    _box!.put(stdEmpId, value);
  }

  static String? getStdEmpId() {
    return _box!.get(stdEmpId);
  }

  static void setProfileImage(String? value) {
    _box!.put(image, value);
  }

  static String? getProfileImage() {
    return _box!.get(image);
  }

  static void setName(String value) {
    _box!.put(name, value);
  }

  static String? getName() {
    return _box!.get(name, defaultValue: '').toString().trim().replaceAll(
          RegExp(' +'),
          ' ',
        );
  }

  static void setGradeId(int value) {
    _box!.put(gradeId, value);
  }

  static int? getGradeId() {
    return _box?.get(gradeId);
  }

  static void setGradeName(String value) {
    _box!.put(greadeName, value);
  }

  static void setFirstSupervisorId(int value) {
    _box!.put(firstSupervisorId, value);
  }

  static int? getFirstSupervisorId() {
    return _box!.get(firstSupervisorId);
  }

  static void setSecondSupervisorId(int value) {
    _box!.put(secondSupervisorId, value);
  }

  static int? getSecondSupervisorId() {
    return _box!.get(secondSupervisorId);
  }

  static String? getGradeName() {
    return _box!.get(greadeName);
  }

  static int? getPositionId() {
    return _box?.get(positionId);
  }

  static void setPositionId(int value) {
    _box!.put(positionId, value);
  }

  static String getPositionName() {
    return _box!.get(positionName);
  }

  static void setPositionName(String value) {
    _box!.put(positionName, value);
  }

  static int getPostitionTypeID() {
    return _box!.get(positionTypeId);
  }

  static void setPostionTypeId(int value) {
    _box!.put(positionTypeId, value);
  }

  static String getPositionTypeName() {
    return _box!.get(positionTypeName);
  }

  static void setPostionTypeName(String value) {
    _box!.put(positionTypeName, value);
  }

  static int? getDepartmentId() {
    return _box?.get(departmentID);
  }

  static void setDepartmentId(int value) {
    _box!.put(departmentID, value);
  }

  static String getDepartmentName() {
    return _box!.get(departmentName);
  }

  static void setDepartmentName(String value) {
    _box!.put(departmentName, value);
  }

  static int getLocationId() {
    return _box!.get(locationId);
  }

  static void setLocationId(int value) {
    _box!.put(locationId, value);
  }

  static String getLocationName() {
    return _box!.get(locationName);
  }

  static void setLocationName(String value) {
    _box!.put(locationName, value);
  }

  static void setCompanyId(int value) {
    _box!.put(companyID, value);
  }

  static int? getCompanyId() {
    return _box?.get(companyID);
  }

  static void setCompanyName(String value) {
    _box!.put(companyName, value);
  }

  static String getCompanyName() {
    return _box!.get(companyName);
  }

  static void setGender(String value) {
    _box!.put(gender, value);
  }

  static String getGender() {
    return _box!.get(gender);
  }

  static void setTokken(String value) {
    _box!.put(tokken, value);
  }

  static String getTokken() {
    return _box!.get(tokken);
  }

  static void setRememberMe(bool value) {
    _box!.put(rememberMe, value);
  }

  static bool? getRememberMe() {
    return _box?.get(rememberMe) ?? false;
  }

  static void setDateOfJoining(String value) {
    _box!.put(dateOfJoining, value);
  }

  static String getDateOfJoining() {
    return _box?.get(dateOfJoining);
  }

  static void setContractType(String value) {
    _box!.put(contractType, value);
  }

  static String getContractType() {
    return _box?.get(contractType);
  }

  static void setTenureInDays(int value) {
    _box!.put(tenureInDays, value);
  }

  static void setTenureInYears(String value) {
    _box!.put(tenureInYears, value);
  }

  static String getTenureInDays() {
    return _box?.get(tenureInDays);
  }

  static String getTenureInYears() {
    return _box?.get(tenureInYears);
  }

  static void setSubDepartmentId(int value) {
    _box!.put(subDepartmentId, value);
  }

  static void getSubDepartmentId() {
    _box!.get(subDepartmentId);
  }

  static void setSubDepartmentName(String value) {
    _box!.put(subDepartmentName, value);
  }

  static String getSubDepartmentName() {
    return _box?.get(subDepartmentName);
  }

  static void setGrossSalary(double value) {
    _box!.put(grossSalary, value);
  }

  static void getGrossSalary() {
    _box!.get(grossSalary);
  }

  static void setTotalSalary(double value) {
    _box!.put(totalSalary, value);
  }

  static void getTotalSalary() {
    _box!.get(totalSalary);
  }

  static void setBonus(double value) {
    _box!.put(bonus, value);
  }

  static void getBonus() {
    _box!.get(bonus);
  }

  static deleteHive() async {
    await _box!.deleteFromDisk();
  }

  static void deleteHiveData()  async{
    _box!.put(login, false);
    _box!.put(tenureInDays, "");
    _box!.put(tokken, "");
  }
}
