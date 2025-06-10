import 'package:appraisal_project/core/base_client.dart';
import 'package:appraisal_project/core/core_urls.dart';
import 'package:appraisal_project/core/date_formatter.dart';
import 'package:appraisal_project/core/hive_services.dart';
import 'package:appraisal_project/login/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final bool _rememberPassword = false;
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  bool get rememberPassword => _rememberPassword;

  LoginModel? loginModel;

  setObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  bool validateLogin() {
    if (userName.text.trim().isEmpty) {
      EasyLoading.showInfo("Enter employee id");
      return false;
    }
    if (password.text.trim().isEmpty) {
      EasyLoading.showInfo("Enter password");
      return false;
    }
    return true;
  }

  login(context) async {
    EasyLoading.show(status: "Logging in...");
    try {
      var response = await BaseClient.login(
        baseUrl: baseUrl,
        api: "appraisal/login",
        payloadObj: {
          "userName": userName.text,
          "password": password.text,
        },
      );
      loginModel = loginModelFromJson(response.body);

      if (loginModel?.status == true) {
        HiveService.setTokken(loginModel!.tokken);
        HiveService.setLogin(true);
        HiveService.setEmpId(loginModel!.loginData.empId);
        HiveService.setStdEmpId(loginModel!.loginData.stdEmpId);
        HiveService.setFirstSupervisorId(
            loginModel!.loginData.uFirstSupervisorId);
        HiveService.setSecondSupervisorId(
            loginModel!.loginData.uSecondSupervisorId);
        HiveService.setName(loginModel!.loginData.name);
        HiveService.setDepartmentId(loginModel!.loginData.departmentId);
        HiveService.setDepartmentName(loginModel!.loginData.departmentName);
        HiveService.setPositionId(loginModel!.loginData.positionId);
        HiveService.setPositionName(loginModel!.loginData.positionName);
        HiveService.setLocationId(loginModel!.loginData.locationId);
        HiveService.setLocationName(loginModel!.loginData.locationName);
        HiveService.setPostionTypeId(loginModel!.loginData.positionTypeId);
        HiveService.setPostionTypeName(loginModel!.loginData.positionType);
        HiveService.setDateOfJoining(DateFormatter.dayMonthYearFormat(
          loginModel!.loginData.joinDate,
        ));
        HiveService.setTenureInDays(
          loginModel!.loginData.tenureInDays,
        );
        HiveService.setTenureInYears(
          loginModel!.loginData.tenureInYears,
        );
        HiveService.setGradeId(
          loginModel!.loginData.grade,
        );
        HiveService.setGradeName(
          loginModel!.loginData.gradeName,
        );
        HiveService.setContractType(
          loginModel!.loginData.employeeContractType,
        );
        HiveService.setSubDepartmentId(
          loginModel!.loginData.subDepartmentId,
        );
        HiveService.setSubDepartmentName(
          loginModel!.loginData.subDepartment,
        );
        HiveService.setGrossSalary(
          loginModel!.loginData.grossSalary.toDouble(),
        );
        HiveService.setTotalSalary(
          loginModel!.loginData.totalSalary!.toDouble(),
        );
        HiveService.setBonus(
          loginModel!.loginData.bonus!.toDouble(),
        );
        EasyLoading.showSuccess(loginModel!.message);
        GoRouter.of(context).pushReplacement("/dashboard");
      } else {
        EasyLoading.showError(loginModel!.message);
      }
      password.clear();
      userName.clear();
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }

    // return true;
  }
}
