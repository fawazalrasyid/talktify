import 'dart:math';

import 'package:intl/intl.dart';

class Helpers {
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  int generateRandomNumber() {
    Random random = Random();

    return random.nextInt(1001);
  }

  String formatDateTime(DateTime dateTime) {
    String startTime = DateFormat.Hm().format(dateTime);
    String endTime = DateFormat.Hm().format(
      dateTime.add(const Duration(hours: 1)),
    );
    String date = DateFormat('dd MMM y').format(dateTime);

    return '$startTime - $endTime, $date';
  }

  String dayHourFunction(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(1, "0");
    String days = twoDigits(duration.inDays);
    String hours = twoDigits(duration.inHours.remainder(24));
    return "$days Hari $hours Jam";
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
