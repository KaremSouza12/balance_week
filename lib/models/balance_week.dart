class BalanceWeek {
  int? id;
  String? nameDayWeek;
  String? dateOfDayWeek;
  double? totalWeek;
  double? valueOfDayWeek;

  BalanceWeek({
    this.id,
    required this.nameDayWeek,
    required this.dateOfDayWeek,
    required this.totalWeek,
    required this.valueOfDayWeek,
  });

  BalanceWeek.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nameDayWeek = json['nameDayWeek'];
    dateOfDayWeek = json['dateOfDayWeek'];
    totalWeek = json['totalWeek'];
    valueOfDayWeek = json['valueOfDayWeek'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameDayWeek'] = nameDayWeek;
    data['dateOfDayWeek'] = dateOfDayWeek;
    data['totalWeek'] = totalWeek;
    data['valueOfDayWeek'] = valueOfDayWeek;
    return data;
  }

  @override
  String toString() {
    return 'Account{id:$id,nameDayWeek: $nameDayWeek, dateOfDayWeek: $dateOfDayWeek,totalWeek: $totalWeek, valueOfDayWeek:$valueOfDayWeek}';
  }
}
