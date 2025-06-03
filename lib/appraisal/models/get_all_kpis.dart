import 'dart:convert';

KpiModel kpiModelFromJson(String str) => KpiModel.fromJson(json.decode(str));
String kpiModelToJson(KpiModel data) => json.encode(data.toJson());

class KpiModel {
  bool? status;
  String? message;
  List<Kpi>? kpis;

  KpiModel({
    this.status,
    this.message,
    this.kpis,
  });

  factory KpiModel.fromJson(Map<String, dynamic> json) => KpiModel(
        status: json["status"],
        message: json["message"],
        kpis: json["kpis"] == null
            ? []
            : List<Kpi>.from(json["kpis"].map((x) => Kpi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "kpis": kpis == null
            ? []
            : List<dynamic>.from(kpis!.map((x) => x.toJson())),
      };
}

class Kpi {
  String? id;
  String? period;
  DateTime? date;
  int? empId;
  int? kpiId;
  int? firstSupervisorMarks;
  int? secondSupervisorMarks;
  int? firstSupervisorEmplId;
  int? secondSupervisorEmplId;
  int? sn;
  int? employeeKpId;
  String? category;
  String? groupHeader;
  String? childDescription;

  Kpi({
    this.id,
    this.period,
    this.date,
    this.empId,
    this.kpiId,
    this.firstSupervisorMarks,
    this.secondSupervisorMarks,
    this.firstSupervisorEmplId,
    this.secondSupervisorEmplId,
    this.sn,
    this.category,
    this.groupHeader,
    this.employeeKpId,
    this.childDescription,
  });

  factory Kpi.fromJson(Map<String, dynamic> json) => Kpi(
        id: json["ID"],
        period: json["Period"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        empId: json["EmpID"],
        kpiId: json["KPI_ID"],
        firstSupervisorMarks:
            json["FirstSupervisor_Marks"] as int?, // safely cast
        secondSupervisorMarks: json["SecondSupervisor_Marks"] as int?,
        firstSupervisorEmplId: json["FirstSupervisor_EmplID"],
        secondSupervisorEmplId: json["SecondSupervisor_EmplID"],
        sn: json["SN"],
        category: json["CateGory"]?.trim(),
        groupHeader: json["GroupHeader"],
        employeeKpId: json["EmployeeKPIID"],
        childDescription: json["ChildDescription"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Period": period,
        "Date": date?.toIso8601String(),
        "EmpID": empId,
        "KPI_ID": kpiId,
        "FirstSupervisor_Marks": firstSupervisorMarks,
        "SecondSupervisor_Marks": secondSupervisorMarks,
        "FirstSupervisor_EmplID": firstSupervisorEmplId,
        "SecondSupervisor_EmplID": secondSupervisorEmplId,
        "SN": sn,
        "CateGory": category,
        "GroupHeader": groupHeader,
        "EmployeeKPIID": employeeKpId,
        "ChildDescription": childDescription,
      };
}
