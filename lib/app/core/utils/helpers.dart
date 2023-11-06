class Helpers {
  String dayHourMinuteSecondFunction(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String days = twoDigits(duration.inDays);
    String hours = twoDigits(duration.inHours.remainder(24));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return days +
        ' ' +
        " Hari " +
        hours +
        " Jam " +
        minutes +
        " Menit " +
        seconds +
        " Detik";
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
