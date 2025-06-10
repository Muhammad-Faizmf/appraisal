import 'package:appraisal_project/appraisal/screens/appraisal.dart';
import 'package:appraisal_project/core/hive_services.dart';
import 'package:appraisal_project/utils/colors.dart';
import 'package:appraisal_project/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: Row(
        children: [
          // Sidebar
          // Container(
          //   color: ColorConstant.menuBGColor,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: Text(""),
          //       ),
          //       Expanded(
          //         child: Container(
          //           // height: 200.0,
          //           width: 250,
          //           color: Colors.grey[100],
          //           child: Consumer<AppraisalProvider>(
          //             builder: (context, provider, _) {
          //               return ListView(
          //                 children:
          //                     provider.menues.asMap().entries.map((entry) {
          //                   final index = entry.key;
          //                   final menu = entry.value;
          //                   return Center(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         ListTile(
          //                           title: Text(
          //                             menu.title!,
          //                             style: AppStyle.moduleScreeenHeader,
          //                           ),
          //                         ),
          //                         ...menu.subMenu!
          //                             .asMap()
          //                             .entries
          //                             .map((subEntry) {
          //                           final subIndex = subEntry.key;
          //                           final sub = subEntry.value;
          //                           final isHovered =
          //                               provider.hoveredItem == sub.title;
          //                           final isSelected =
          //                               provider.selectedSubMenuIndex ==
          //                                   subIndex;

          //                           return MouseRegion(
          //                             onEnter: (_) =>
          //                                 provider.onHover(sub.title),
          //                             onExit: (_) {
          //                               provider.onHoverExit();
          //                             },
          //                             child: GestureDetector(
          //                               onTap: () {
          //                                 provider.selectedSubMenu(
          //                                   index,
          //                                   subIndex,
          //                                 );
          //                               },
          //                               child: Container(
          //                                 color: isSelected
          //                                     ? Colors.orange
          //                                     : isHovered
          //                                         ? Colors.blue[100]
          //                                         : Colors.transparent,
          //                                 padding: const EdgeInsets.symmetric(
          //                                   horizontal: 16,
          //                                   vertical: 12,
          //                                 ),
          //                                 child: Text(
          //                                   sub.title!,
          //                                   style: TextStyle(
          //                                     color: isSelected
          //                                         ? Colors.white
          //                                         : isHovered
          //                                             ? Colors.blue[900]
          //                                             : Colors.black,
          //                                     fontWeight: isSelected
          //                                         ? FontWeight.bold
          //                                         : FontWeight.normal,
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                           );
          //                         }),
          //                       ],
          //                     ),
          //                   );
          //                 }).toList(),
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: EdgeInsets.only(bottom: 20.0),
          //           alignment: Alignment.bottomCenter,
          //           child: Text(
          //             "Powered By 1.0.0",
          //             style: AppStyle.appVersion,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Main area
          Expanded(
            child: Container(
              color: ColorConstant.bgColor,
              child: Column(
                children: [
                  // Top Header
                  Container(
                    color: ColorConstant.primaryDark,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(),
                            IconButton(
                                onPressed: () {
                                  HiveService.deleteHiveData();
                                  GoRouter.of(context).go("/");
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Module name
                  // Container(
                  //   padding: const EdgeInsets.all(16),
                  //   alignment: Alignment.centerLeft,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Consumer<AppraisalProvider>(
                  //         builder: (context, provider, _) {
                  //           return Text(
                  //             provider.menues[provider.selectedMenuIndex].title
                  //                 .toString(),
                  //             style: AppStyle.moduleScreeenHeader,
                  //           );
                  //         },
                  //       ),
                  //       // Consumer<AppraisalProvider>(
                  //       //   builder: (context, provider, _) {
                  //       //     return Text(
                  //       //       '${provider.menues[provider.selectedMenuIndex].title} / '
                  //       //       '${provider.menues[provider.selectedMenuIndex].subMenu?[provider.selectedSubMenuIndex].title}',
                  //       //       style: AppStyle.txtPath,
                  //       //     );
                  //       //   },
                  //       // )
                  //     ],
                  //   ),
                  // ),

                  // Content
                  // Expanded(
                  //   child: Consumer<AppraisalProvider>(
                  //     builder: (context, provider, _) {
                  //       return provider.selectedMenuIndex == 0 &&
                  //               provider.selectedSubMenuIndex == 0
                  //           ? Appraisal()
                  //           : Text("My Appraisal");
                  //     },
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        color: Colors.red
                            .withOpacity(0.1), // Helps visually debug layout
                        child: Appraisal(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
