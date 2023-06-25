import 'package:flutter/material.dart';

class UpdateForm extends StatefulWidget {
  const UpdateForm({
    required this.nameDayWeek,
    required this.dateOfDayWeek,
    required this.totalday,
    required this.valueOfDayWeek,
    required this.hourOfDayWeek,
    super.key,
  });

  final TextEditingController nameDayWeek;
  final TextEditingController dateOfDayWeek;
  final TextEditingController totalday;
  final TextEditingController valueOfDayWeek;
  final TextEditingController hourOfDayWeek;

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 56.0,
                  child: Center(
                      child: Text(
                    'Adicionar conta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.addressState,
                    ),
                  ) // Your desired title
                      ),
                ),
                Positioned(
                  left: 330.0,
                  top: 8.0,
                  child: IconButton(
                    icon: Icon(Icons.close), // Your desired icon
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 30, 10),
              child: TextFormField(
                controller: widget.dateOfDayWeek,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.list,
                    color: Colors.grey.shade500,
                  ),
                  hintText: 'Título da conta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 30, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Colors.grey.shade500,
                  ),
                  hintText: 'Valor da conta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: widget.hourOfDayWeek,
                keyboardType: TextInputType.number,
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                // ],
                validator: (value) {
                  if (value!.isEmpty) return 'Informe o valor do saldo';
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 30, 10),
              child: TextFormField(
                controller: widget.nameDayWeek,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Colors.grey.shade500,
                  ),
                  hintText: 'Data de vencimento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());
                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));

                  // widget.dueDateController.text =
                  //     utilsServices.formatDateTime(date!);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text(
                        'Não',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 130,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      onPressed: () {
                        // if (widget.titleController.text == '' ||
                        //     widget.dueDateController.text == '' ||
                        //     widget.valueAccount.text == '') {
                        //   Fluttertoast.showToast(
                        //       msg: "Preencha um dos campos",
                        //       toastLength: Toast.LENGTH_SHORT,
                        //       gravity: ToastGravity.TOP,
                        //       timeInSecForIosWeb: 1,
                        //       backgroundColor: Colors.black38,
                        //       textColor: Colors.white,
                        //       fontSize: 16.0);
                        // } else {
                        //   final data = Account(
                        //     title: widget.titleController.text,
                        //     dueDate: widget.dueDateController.text,
                        //     status: false,
                        //     valueAccount:
                        //         double.parse(widget.valueAccount.text),
                        //   );

                        //   widget.isUpdate == true
                        //       ? widget.accountsRepository.updateValues(
                        //           widget.idCount,
                        //           widget.titleController.text,
                        //           widget.dueDateController.text,
                        //           double.parse(widget.valueAccount.text),
                        //           widget.status,
                        //         )
                        //       : widget.accountsRepository.createData(data);
                        //   clearInputs();
                        // }
                      },
                      child: const Text(
                        'Sim',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
