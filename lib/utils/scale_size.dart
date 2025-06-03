import 'package:flutter/material.dart';

class ScaleSize {
  static double getHorizontalWidth({
    required BuildContext context,
    required double width,
  }) {
    double maxDesignWidth = 1440.0;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicSize = (width / maxDesignWidth) * screenWidth;

    return dynamicSize;
  }

  // static double getHorizontalWidthTab(
  //     {required BuildContext context, required double width}) {
  //   double maxDesignWidth = 960.0;
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double dynamicSize = (width / maxDesignWidth) * screenWidth;

  //   return dynamicSize;
  // }

  static double getVerticalHeight(
      {required BuildContext context, required double heightparam}) {
    // Get the actual screen height using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double maxDesignHeight = 1024.0;
    // Calculate the dynamic size
    double dynamicSize = (heightparam / maxDesignHeight) * screenHeight;

    return dynamicSize;
  }

  // static double getTabletHorizontalWidth({
  //   required BuildContext context,
  //   required double width,
  // }) {
  //   double maxDesignWidth = 1096.0;
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double dynamicSize = (width / maxDesignWidth) * screenWidth;

  //   return dynamicSize;
  // }
}
