import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_notes/models/balance_week.dart';
import 'package:my_notes/repositories/balance_week_repository.dart';
import 'package:provider/provider.dart';

List<String> list = <String>[
  'Segunda-Feira',
  'Terça-Feira',
  'Quarta-Feira',
  'Quinta-Feira',
  'Sexta-Feira',
  'Sábado',
  'Domingo',
];

String _name = '';

class EnterFormValue extends StatefulWidget {
  const EnterFormValue({
    super.key,
    required this.balance,
    required this.repository,
  });

  final TextEditingController balance;
  final BalanceWeekRepository repository;

  @override
  State<EnterFormValue> createState() => _EnterFormValueState();
}

class _EnterFormValueState extends State<EnterFormValue> {
  @override
  void initState() {
    super.initState();
  }

  String getDate() {
    final now = DateTime.now();
    if (now.hour == 00 || now.hour <= 06) {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      final month =
          yesterday.month < 10 ? "0${yesterday.month}" : yesterday.month;

      final formattedDate = "${yesterday.day}-$month-${yesterday.year}";

      print('DATA DE OTEM: $formattedDate');
      return formattedDate.toString();
    } else {
      final month = now.month < 10 ? "0${now.month}" : now.month;

      final currentDate = "${now.day}-$month-${now.year}";

      return currentDate.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final repository = context.watch<BalanceWeekRepository>();
    double valuetotal = 0.0;
    final getcurrentdate = DateTime.now();
    String hour =
        "${getcurrentdate.hour}:${getcurrentdate.minute}:${getcurrentdate.second}";

    double sumTotal() {
      double total = 0.0;
      for (var element in repository.balanceWeek) {
        total += element.totalday as double;
      }
      valuetotal = total;
      return total;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: DropdownWeek()),
              // Text(
              //   '${DateTime.now().weekdayName()}: ${DateTime.now().getData()}',
              //   style: const TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //   ),
              // ),
              Text(
                'Total:${sumTotal()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            controller: widget.balance,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              focusColor: Colors.white,
              prefixIcon: const Icon(
                Icons.monetization_on_outlined,
                color: Colors.grey,
              ),
              // errorText: "Erro",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.indigo, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey,
              // hintText: "Valor ganho no dia",
              // hintStyle: const TextStyle(
              //   color: Colors.grey,
              //   fontSize: 16,
              //   fontFamily: "verdana_regular",
              //   fontWeight: FontWeight.w400,
              // ),
              labelText: "Valor ganho no dia",
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontFamily: "verdana_regular",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              if (widget.balance.text == '') {
                Fluttertoast.showToast(
                  msg: "Campo não preenchido, favor informar o valor",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black38,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              } else {
                print(valuetotal);
                widget.repository.createData(
                  BalanceWeek(
                    nameDayWeek: _name,
                    dateOfDayWeek: getDate(),
                    totalday: double.parse(widget.balance.text),
                    valueOfDayWeek: double.parse(widget.balance.text),
                    hourOfDayWeek: hour,
                  ),
                );
                Fluttertoast.showToast(
                  msg: "Valor Salvo",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black38,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                widget.balance.text = '';
              }
            },
            child: const Text(
              'Guardar Valor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        // const Expanded(
        //   child: Padding(
        //     padding: EdgeInsets.all(16.0),
        //     child: ListValuesWeek(),
        //   ),
        // ),
      ],
    );
  }
}

class DropdownWeek extends StatefulWidget {
  const DropdownWeek({
    super.key,
  });

  @override
  State<DropdownWeek> createState() => _DropdownWeekState();
}

class _DropdownWeekState extends State<DropdownWeek> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.indigo),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          _name = dropdownValue;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
