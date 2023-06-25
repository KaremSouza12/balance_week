import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes/presentation/pages/balanace_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    Future.delayed(const Duration(seconds: 2)).then(
      (_) => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const BalancePage()),
          ),
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigoAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/notes.png',
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Meus ganhos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.indigo),
            ),
            const SizedBox(height: 10),
            const Text(
              'Carregando...',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
