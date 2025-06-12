import 'package:Appraisal/appraisal/models/get_all_kpis.dart';


class GroupedKpi {
  int employeeKpiId;
  String groupHeader;
  List<Kpi> kpis;

  GroupedKpi({
    required this.employeeKpiId,
    required this.groupHeader,
    required this.kpis,
  });
}
