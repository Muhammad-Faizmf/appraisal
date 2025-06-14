import 'package:Appraisal/appraisal/screens/appraisal.dart';
import 'package:Appraisal/core/hive_services.dart';
import 'package:Appraisal/utils/colors.dart';
import 'package:Appraisal/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, bool> expandedState = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      body: Container(
        color: ColorConstant.bgColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Header
              Container(
                color: ColorConstant.primaryDark,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Appraisal",
                      style: AppStyle.moduleScreeenHeader,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.blue),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          HiveService.getName().toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        IconButton(
                            onPressed: () async {
                              await Hive.box('appraisal_session').clear();
                               GoRouter.of(context).pushReplacement("/"); },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Appraisal(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
