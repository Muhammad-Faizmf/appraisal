import 'package:Appraisal/appraisal/provider/appriasal_provider.dart';
import 'package:Appraisal/core/easyloading_config.dart';
import 'package:Appraisal/core/hive_services.dart';
import 'package:Appraisal/core/routes.dart';
import 'package:Appraisal/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  await HiveService.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => AppraisalProvider()),
    ],
    child: MyApp(),
  ));

  EasyloadingConfiguraiton().configLoading();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Appraisal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
