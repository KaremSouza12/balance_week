import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

extension DateTimeExtension on DateTime {
  String? weekdayName() {
    initializeDateFormatting();
    // final now = DateTime.now();
    // final month = now.month < 10 ? "0${now.month}" : now.month;

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
    // final name = DateTime.now().weekdayName();
    final day = DateTime.now().day;
    final month = DateTime.now().month;
    final year = DateTime.now().year;

    return "$day/$month/$year";
  }

  Map<String, String> getDaysOfWeek(String? locale) {
    initializeDateFormatting();
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final days = List.generate(7, (index) => index).map((value) =>
        DateFormat(DateFormat.DAY, locale)
            .format(firstDayOfWeek.add(Duration(days: value))));
    final weekdayName = <String>[
      'Segunda-Feira',
      'Terça-Feira',
      'Quarta-Feira',
      'Qunta-Feira',
      'Sexta-Feira',
      'Sábado',
      'Dominfo',
    ];

    final map = Map<String, String>.fromIterables(days, weekdayName);
    return map;
  }
}
