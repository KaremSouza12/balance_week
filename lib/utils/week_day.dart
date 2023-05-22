extension DateTimeExtension on DateTime {
  String? weekdayName() {
    const Map<int, String> weekdayName = {
      1: "Segunda-Feira",
      2: "Terça-Feira",
      3: "Quarta-Feira",
      4: "Quinta-Feira",
      5: "Sexta-Feira",
      6: "Sábado",
      7: "Domingo"
    };
    return weekdayName[weekday];
  }

  String? getData() {
    final name = DateTime.now().weekdayName();
    final day = DateTime.now().day;
    final month = DateTime.now().month;
    final year = DateTime.now().year;

    return "$day/$month/$year";
  }
}
