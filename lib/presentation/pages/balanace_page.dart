import 'package:flutter/material.dart';
import 'package:my_notes/repositories/balance_week_repository.dart';
import 'package:my_notes/utils/week_day.dart';
import 'package:my_notes/widgets/enter_form_value.dart';
import 'package:my_notes/widgets/list_values_week.dart';
import 'package:provider/provider.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final TextEditingController balance = TextEditingController();
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final repository = context.watch<BalanceWeekRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda de Ganhos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          EnterFormValue(balance: balance, repository: repository),
          const ListValuesWeek(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Página inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Dias e Valores',
          )
        ],
      ),
    );
  }
}
