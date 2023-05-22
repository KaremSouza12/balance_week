import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_notes/presentation/pages/balanace_page.dart';
import 'package:my_notes/repositories/balance_week_repository.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => BalanceWeekRepository(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
      home: const BalancePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String finalDate = '';
  final now = DateTime.now();
  late DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

  getCurrentDate() {
    final now = DateTime.now();

    // var dateParse = findLastDateOfNextWeek(now);

    var formattedDate = "${now.day}/${now.month}/${now.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  lastDayOfMonth.day,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${index + 1}",
                        ),
                        () {
                          final currentDate =
                              lastDayOfMonth.add(Duration(days: index + 1));

                          final dateName = DateFormat('E').format(currentDate);
                          return Text(dateName);
                        }()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
