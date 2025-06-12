import 'dart:convert';

import 'package:Appraisal/appraisal/models/get_all_kpis.dart';
import 'package:Appraisal/appraisal/models/group_kpi_model.dart';

import 'package:Appraisal/appraisal/models/hr_remarks_model.dart';
import 'package:Appraisal/appraisal/models/menu_model.dart';
import 'package:Appraisal/appraisal/models/heirarchy_appraisal_model.dart';
import 'package:Appraisal/appraisal/models/strength_model.dart';
import 'package:Appraisal/appraisal/models/traning_model.dart'
    show TrainingDevelopmentItem, traningModelFromJson;
import 'package:Appraisal/core/base_client.dart';
import 'package:Appraisal/core/core_urls.dart';
import 'package:Appraisal/core/hive_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppraisalProvider extends ChangeNotifier {
  TextEditingController minGradeController = TextEditingController();
  TextEditingController maxGradeController = TextEditingController();
  TextEditingController minSalaryController = TextEditingController();
  TextEditingController maxSalaryController = TextEditingController();
  TextEditingController grossSalaryController = TextEditingController();
  TextEditingController incrementController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  final TextEditingController strengthController = TextEditingController();
  final TextEditingController weaknessController = TextEditingController();
  final TextEditingController trainingController = TextEditingController();
  final TextEditingController chiefRemarksController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final List<String> evaluations = ['1', '2', '3', '4', '5'];

  List<StrengthWeakness>? strengths;
  List<StrengthWeakness>? weakness;

  bool showAppraisalDetails = false;
  int? selectedApprisalHeirarchyIndex;

  List<Heirarchy>? heirarchyAppraisal;
  List<Heirarchy>? realHeirarchyAppraisal;

  List<TrainingDevelopmentItem>? hrTraning;
  List<MapEntry<int, Map<String, dynamic>>> groupedList = [];
  List<HRRemarkItem>? chroRemarks;

  List<Kpi>? kpisModel;
  List<GroupedKpi>? groupedKpis;

  bool isBioResponseTrue = false;

  int selectedBtnIndex = 0;
  int hoveredBtnIndex = -1;

  List<MenuModel> menues = [
    MenuModel(
      title: 'Appraisal',
      subMenu: [
        MenuModel(title: 'Appraisal'),
      ],
    ),
  ];

  List<String> tabs = [
    "Employee Bio Data",
    "General",
    "Remarks & Recommendation",
  ];

  int selectedMenuIndex = 0;
  int selectedSubMenuIndex = 0;
  String? hoveredItem;

  void onHover(val) {
    hoveredItem = val;
    notifyListeners();
  }

  void onHoverExit() {
    hoveredItem = null;
    notifyListeners();
  }

  void setHoveredBtnIndex(int index) {
    hoveredBtnIndex = index;
    notifyListeners();
  }

  void setSelectedBtnIndex(int index) {
    selectedBtnIndex = index;
    notifyListeners();
  }

  void selectedSubMenu(int menuIndex, int subMenuIndex) {
    selectedMenuIndex = menuIndex;
    selectedSubMenuIndex = subMenuIndex;
    notifyListeners();
  }

  showAppraisal() {
    showAppraisalDetails = !showAppraisalDetails;
    notifyListeners();
  }

  setAppraisalIndex(index) {
    selectedApprisalHeirarchyIndex = index;
    selectedBtnIndex = 0;
    notifyListeners();
  }

  resetApprisalValues() {
    selectedApprisalHeirarchyIndex = null;
    showAppraisalDetails = false;
    isBioResponseTrue = false;
    searchController.clear();
    notifyListeners();
  }

  resetFields() {
    strengthController.clear();
    weaknessController.clear();
    trainingController.clear();
    chiefRemarksController.clear();
    notifyListeners();
  }

  onChangedFirstEvaluation(value, parentIndex, childIndex) {
    groupedKpis?[parentIndex].kpis[childIndex].firstSupervisorMarks =
        int.tryParse(value);
    notifyListeners();
  }

  onChangedSecondEvaluation(value, parentIndex, childIndex) {
    groupedKpis?[parentIndex].kpis[childIndex].secondSupervisorMarks =
        int.tryParse(value);
    notifyListeners();
  }

  getStrengthAndWeakness() async {
    strengths = null;
    weakness = null;
    try {
      EasyLoading.show(status: "Fetching hierarchy...");

      final response = await BaseClient.get(
        baseUrl,
        "appraisal/getStrengthWeakness?EmpID=${heirarchyAppraisal![selectedApprisalHeirarchyIndex!].empId.toString()}",
      );
      if (response.body.isNotEmpty) {
        final parsed = strengthModelFromJson(response.body);

        strengths = parsed.strengthWeakness
            .where((e) => e.category == "Strength")
            .toList();
        weakness = parsed.strengthWeakness
            .where((e) => e.category == "Weakness")
            .toList();
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }

    notifyListeners();
  }

  getHierarchyAppraisal() async {
    try {
      EasyLoading.show(status: "Feching heirarchy...");
      final response = await BaseClient.get(
        baseUrl,
        "appraisal/heirarchy?empId=${HiveService.getEmpId()}",
      );
      heirarchyAppraisal = realHeirarchyAppraisal =
          heirarchyModelFromJson(response.body).heirarchy;
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  addChiefRemarks() async {
    try {
      EasyLoading.show(status: "Adding HR remarks...");
      final response = await BaseClient.post(
          baseUrl: baseUrl,
          api: "appraisal/addHRRemarks",
          payloadObj: {
            "Category": "HR Remarks",
            "EmpID": heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
                .empId
                .toString(),
            "Description": chiefRemarksController.text.trim()
          });
      if (response.statusCode == 200) {
        chroRemarks ??= [];

        final newRemarks = HRRemarkItem(
          id: "0",
          period: "2025-1",
          category: "HR Remarks",
          empId: heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
              .empId
              .toString(),
          description: chiefRemarksController.text.trim(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        chroRemarks!.add(newRemarks);
        chiefRemarksController.clear();
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  getTraning() async {
    groupedList = [];
    try {
      EasyLoading.show(status: "Feching traning...");
      final response = await BaseClient.get(
        baseUrl,
        "appraisal/getTraining?EmpID=${heirarchyAppraisal![selectedApprisalHeirarchyIndex!].empId.toString()}",
      );
      hrTraning = traningModelFromJson(response.body).trainingDevelopement;

    //  final groupedData = groupByCreater(hrTraning!);

   
      final groupedData = groupByCreater(
        traningModelFromJson(response.body).trainingDevelopement,
      );

      groupedList = groupedData.entries.toList();
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  getCHRORemarks() async {
    try {
      EasyLoading.show(status: "Feching hr remarks...");
      final response = await BaseClient.get(
        baseUrl,
        "appraisal/getHRRemarks?EmpID=${heirarchyAppraisal![selectedApprisalHeirarchyIndex!].empId.toString()}",
      );
      chroRemarks = hrRemarksModelFromJson(response.body).hrRemarks;
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  addTraining() async {
    groupedList = [];
    try {
      EasyLoading.show(status: "Adding traning...");
      final response = await BaseClient.post(
          baseUrl: baseUrl,
          api: "appraisal/addTraining",
          payloadObj: {
            "createrId": HiveService.getEmpId().toString(),
            "EmpID": heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
                .empId
                .toString(),
            "Description": trainingController.text.trim()
          });



      if (response.statusCode == 200) {
        hrTraning ??= [];

        final newHrTraning = TrainingDevelopmentItem(
          id: "0",
          period: "2025-1",
          createrId: HiveService.getEmpId(),
          createrName: "${HiveService.getName()} Training Recommendation",
          category: "Traning & Development",
          empId: heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
              .empId
              .toString(),
          description: trainingController.text.trim(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        hrTraning!.add(newHrTraning);
        trainingController.clear();
        final groupedData = groupByCreater(hrTraning!);
        groupedList = groupedData.entries.toList();
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  List<GroupedKpi> groupKpis(List<Kpi> kpiList) {
    Map<int, List<Kpi>> map = {};

    for (var kpi in kpiList) {
      if (kpi.employeeKpId != null) {
        map.putIfAbsent(kpi.employeeKpId!, () => []).add(kpi);
      }
    }

    return map.entries.map((e) {
      return GroupedKpi(
        employeeKpiId: e.key,
        groupHeader: e.value.first.groupHeader ?? '',
        kpis: e.value,
      );
    }).toList();
  }

  Map<int, Map<String, dynamic>> groupByCreater(
      List<TrainingDevelopmentItem> trainingList) {
    final Map<int, Map<String, dynamic>> grouped = {};

    for (var item in trainingList) {
      if (grouped.containsKey(item.createrId)) {
        grouped[item.createrId]!['descriptions'].add(item.description);
      } else {
        grouped[item.createrId!] = {
          'createrName': item.createrName,
          'descriptions': [item.description],
        };
      }
    }

    return grouped;
  }

  createBio(index) async {
    try {
      Map<String, dynamic> payload = {
        "Period": '2025-1',
        "EmpID": heirarchyAppraisal?[index].empId.toString(),
        "DepartmentName": heirarchyAppraisal?[index].departmentName,
        "DepartmentId": heirarchyAppraisal?[index].departmentId.toString(),
        "Name": heirarchyAppraisal?[index].name,
        "PositionName": heirarchyAppraisal?[index].positionName,
        "U_FirstSupervisorID":
            heirarchyAppraisal?[index].firstSupervisorEmpId.toString(),
        "U_FirstSupervisorName": heirarchyAppraisal?[index].firstSupervisorName,
        "U_SecondSupervisorID":
            heirarchyAppraisal?[index].secondSupervisorEmpId.toString(),
        "U_SecondSupervisorName":
            heirarchyAppraisal?[index].uSecondSupervisorName,
        "UserCode": heirarchyAppraisal?[index].userCode,
        "Password": heirarchyAppraisal?[index].password,
        "SubDepartment": heirarchyAppraisal?[index].subDepartment,
        "SubDepartmentId":
            heirarchyAppraisal?[index].subDepartmentId.toString(),
        "positionID": heirarchyAppraisal?[index].positionId.toString(),
        "LocationName": heirarchyAppraisal?[index].locationName,
        "MobileNo": '+11234567890',
        "Email": heirarchyAppraisal?[index].email,
        "LocationId": heirarchyAppraisal?[index].locationId.toString(),
        "PositionType": heirarchyAppraisal?[index].positionType,
        "PositionTypeID": heirarchyAppraisal?[index].positionTypeId.toString(),
        "EmployeeContractType": heirarchyAppraisal?[index].employeeContractType,
        "AdminSupervisor": heirarchyAppraisal?[index].adminSupervisor,
        "TenureInDays": heirarchyAppraisal?[index].tenureInDays.toString(),
        "Grade": heirarchyAppraisal?[index].grade.toString(),
        "GradeName": heirarchyAppraisal?[index].gradeName,
        "BONUS": heirarchyAppraisal?[index].bonus.toString(),
        "JoinDate": heirarchyAppraisal?[index].joinDate,
        "TotalSalary": heirarchyAppraisal?[index].totalSalary.toString()
      };

      EasyLoading.show(status: "Creating bio...");
      final response = await BaseClient.post(
        baseUrl: baseUrl,
        api: "appraisal/createBio",
        payloadObj: payload,
      );

      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == true) {
        isBioResponseTrue = true;
      } else {
        EasyLoading.showError(
          jsonResponse['message'] ?? "Something went wrong",
        );
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  createKpis(index) async {
    try {
      EasyLoading.show(status: "Creating kpi's...");
      final response = await BaseClient.post(
        baseUrl: baseUrl,
        api: "appraisal/createKpis",
        payloadObj: {
          "departmentId": heirarchyAppraisal?[index].departmentId.toString(),
          "U_FirstSupervisorID":
              heirarchyAppraisal?[index].firstSupervisorEmpId.toString(),
          "U_SecondSupervisorID":
              heirarchyAppraisal?[index].secondSupervisorEmpId.toString(),
          "EmpID": heirarchyAppraisal?[index].empId.toString()
        },
      );
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == true) {
        kpisModel = kpiModelFromJson(response.body).kpis;
        groupedKpis = groupKpis(kpisModel!);
        setAppraisalIndex(index);
        showAppraisal();
        // if (kpisModel != null && isBioResponseTrue) {}
      } else {
        EasyLoading.showInfo(
          jsonResponse['message'] ?? "Something went wrong",
        );
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  void addStrength() async {
    final text = strengthController.text.trim();
    try {
      EasyLoading.show(status: "Adding strength...");
      final response = await BaseClient.post(
        baseUrl: baseUrl,
        api: "appraisal/addStrengthWeakness",
        payloadObj: {
          "Category": "Strength",
          "SN": (strengths == null ? "1" : strengths!.length + 1).toString(),
          "EmpID": heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
              .empId
              .toString(),
          "Description": text
        },
      );

      if (response.statusCode == 200) {
        strengths ??= [];

        final newStrength = StrengthWeakness(
          id: "0",
          period: "2025-1",
          category: "Strength",
          sn: (strengths!.length + 1).toString(),
          empId: heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
              .empId
              .toString(),
          description: text,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        strengths!.add(newStrength);
        strengthController.clear();
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }

    notifyListeners();
  }

  void addWeakness() async {
    final text = weaknessController.text.trim();
    try {
      EasyLoading.show(status: "Adding weakness...");
      final response = await BaseClient.post(
        baseUrl: baseUrl,
        api: "appraisal/addStrengthWeakness",
        payloadObj: {
          "Category": "Weakness",
          "SN": (weakness == null ? "1" : weakness!.length + 1).toString(),
          "EmpID": heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
              .empId
              .toString(),
          "Description": text
        },
      );
      if (response.statusCode == 200) {
        weakness ??= [];

        final newWeakness = StrengthWeakness(
          id: "0",
          period: "2025-1",
          category: "Weakness",
          sn: (weakness!.length + 1).toString(),
          empId: heirarchyAppraisal![selectedApprisalHeirarchyIndex!]
              .empId
              .toString(),
          description: text,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        weakness!.add(newWeakness);
        weaknessController.clear();
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }

    notifyListeners();
  }

  addFirstSupervisorRemarks(String? id, int? remarks) async {
    try {
      EasyLoading.show(status: "Adding first supervisor remarks...");
      await BaseClient.put(
        baseUrl: baseUrl,
        api: "appraisal/updateFirst",
        payloadObj: {"id": id, "FirstSupervisor_Marks": remarks.toString()},
      );
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  addSecondSupervisorRemarks(String? id, int? remarks) async {
    try {
      EasyLoading.show(status: "Adding second supervisor remarks...");
      await BaseClient.put(
        baseUrl: baseUrl,
        api: "appraisal/updateSecond",
        payloadObj: {"id": id, "SecondSupervisor_Marks": remarks.toString()},
      );
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
    notifyListeners();
  }

  void searchAdjustmentApprisal(String query) {
    try {
      if (query.isEmpty) {
        heirarchyAppraisal = realHeirarchyAppraisal;
      } else {
        heirarchyAppraisal = realHeirarchyAppraisal!.where((element) {
          return element.empId
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase()) ||
              element.name
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase()) ||
              element.positionName
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase()) ||
              element.departmentName
                  .toString()
                  .toLowerCase()
                  .contains(query.toString().toLowerCase());
        }).toList();
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
    notifyListeners();
  }
}