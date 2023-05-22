import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_notes/models/balance_week.dart';
import 'package:my_notes/repositories/balance_week_repository.dart';
import 'package:my_notes/utils/format_date.dart';
import 'package:my_notes/utils/week_day.dart';
import 'package:my_notes/widgets/list_values_week.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    final repository = context.watch<BalanceWeekRepository>();

    double sumTotal() {
      double total = 0.0;
      for (var element in repository.balanceWeek) {
        total += element.totalWeek as double;
      }
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
              Text(
                '${DateTime.now().weekdayName()}: ${DateTime.now().getData()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
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
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor informe o valor';
              }
              return null;
            },
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
              final id = widget.repository.createData(
                BalanceWeek(
                  nameDayWeek: DateTime.now().weekdayName(),
                  dateOfDayWeek: FormateDate.getCurrentDate(),
                  totalWeek: double.parse(widget.balance.text),
                  valueOfDayWeek: double.parse(widget.balance.text),
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
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListValuesWeek(),
          ),
        ),
      ],
    );
  }
}
