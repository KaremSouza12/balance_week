class FormateDate {
  static String getCurrentDate() {
    final now = DateTime.now();
    final month = now.month < 10 ? "0${now.month}" : now.month;

    final formattedDate = "${now.day}-$month-${now.year}";

    return formattedDate.toString();
  }
}
