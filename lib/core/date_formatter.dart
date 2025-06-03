import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  // Default format based on the locale of the device
  static String defaultFormat(DateTime dateTime) {
    return DateFormat.yMd().format(dateTime);
  }

  static String convertDateFormat(String dateString) {
    DateTime dateTime = DateFormat('MM-dd-yyyy').parse(dateString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  // ISO 8601 format
  static String iso8601Format(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(dateTime);
  }

  // Long date format (e.g., December 31, 2022)
  static String longDateFormat(DateTime dateTime) {
    return DateFormat.yMMMMd().format(dateTime);
  }

  // Short date format (e.g., Dec 31, 2022)
  static String shortDateFormat(DateTime dateTime) {
    return DateFormat.yMMMd().format(dateTime);
  }

  // Time format (e.g., 23:59:59)
  static String timeFormat(DateTime? dateTime) {
    return DateFormat('hh:mm a').format(dateTime!);
  }

  static String timeFormatToFullTime(String timeStr) {
    // Define the input format for parsing the time string
    DateFormat inputFormat = DateFormat('hh:mm a');

    // Parse the input time string
    DateTime parsedTime = inputFormat.parse(timeStr);

    // Format the parsed time to HH:mm:ss (e.g., 08:30:00)
    return DateFormat('HH:mm:ss').format(parsedTime);
  }

  static TimeOfDay parseTime2(String timeString) {
    final format = DateFormat('hh:mm a');
    final dateTime = format.parse(timeString);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  // Custom format (e.g., Saturday, December 31, 2022)
  static String customFormat(DateTime dateTime) {
    return DateFormat('EEEE, MMMM d, yyyy').format(dateTime);
  }

  static String yearMonthDayFormat(DateTime? dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime!);
  }

  static TimeOfDay? parseTime(String timeString) {
    final parts = timeString.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  static String dayMonthYearFormat(DateTime? dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime!);
  }

  static double calculateTimeDifference(String time1, String time2) {
    int hour1 = int.parse(time1.split(':')[0]);
    int minute1 = int.parse(time1.split(':')[1].split(' ')[0]);
    String ampm1 = time1.split(' ')[1];

    int hour2 = int.parse(time2.split(':')[0]);
    int minute2 = int.parse(time2.split(':')[1].split(' ')[0]);
    String ampm2 = time2.split(' ')[1];

    if (ampm1 == 'PM' && hour1 != 12) hour1 += 12;
    if (ampm2 == 'PM' && hour2 != 12) hour2 += 12;

    int totalMinutes1 = hour1 * 60 + minute1;
    int totalMinutes2 = hour2 * 60 + minute2;
    int differenceInMinutes = (totalMinutes2 - totalMinutes1).abs();

    // Convert difference to decimal hours
    double differenceInHours = differenceInMinutes / 60.0;

    return differenceInHours;
  }

  static int calculateDays(String fromDateStr, String toDateStr) {
    if (fromDateStr.isNotEmpty && toDateStr.isNotEmpty) {
      List<int> fromDateParts = fromDateStr.split('-').map(int.parse).toList();
      List<int> toDateParts = toDateStr.split('-').map(int.parse).toList();

      DateTime fromDate =
          DateTime(fromDateParts[2], fromDateParts[1], fromDateParts[0]);
      DateTime toDate =
          DateTime(toDateParts[2], toDateParts[1], toDateParts[0]);

      Duration difference = toDate.difference(fromDate);

      return difference.inDays + 1;
    } else {
      return 0;
    }
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    try {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101));
      return picked;

      //return DateFormat('dd-MM-yyyy').format(picked);
    } catch (e) {
      EasyLoading.showToast(e.toString());
    }
    return null;
  }

  String formatTimeOfDaysAsString(String? timeStr) {
    // Parse the input time string
    final timeParts = timeStr!.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    // Calculate the hour of the period
    final hourOfPeriod = hour % 12 == 0 ? 12 : hour % 12;
    final minuteStr = minute.toString().padLeft(2, '0');
    final period = hour < 12 ? 'AM' : 'PM';

    // Return the formatted time string
    return '$hourOfPeriod:$minuteStr $period';
  }
}
