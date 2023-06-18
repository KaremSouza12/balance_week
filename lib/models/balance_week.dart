class BalanceWeek {
  int? id;
  String? nameDayWeek;
  String? dateOfDayWeek;
  double? totalday;
  double? valueOfDayWeek;
  String? hourOfDayWeek;

  BalanceWeek(
      {this.id,
      required this.nameDayWeek,
      required this.dateOfDayWeek,
      required this.totalday,
      required this.valueOfDayWeek,
      required this.hourOfDayWeek});

  BalanceWeek.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nameDayWeek = json['nameDayWeek'];
    dateOfDayWeek = json['dateOfDayWeek'];
    totalday = json['totalday'];
    valueOfDayWeek = json['valueOfDayWeek'];
    hourOfDayWeek = json['hourOfDayWeek'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameDayWeek'] = nameDayWeek;
    data['dateOfDayWeek'] = dateOfDayWeek;
    data['totalday'] = totalday;
    data['valueOfDayWeek'] = valueOfDayWeek;
    data['hourOfDayWeek'] = hourOfDayWeek;
    return data;
  }

  @override
  String toString() {
    return 'Account{id:$id,nameDayWeek: $nameDayWeek, dateOfDayWeek: $dateOfDayWeek,totalday: $totalday, valueOfDayWeek:$valueOfDayWeek, hourOfDayWeek:$hourOfDayWeek}';
  }
}
