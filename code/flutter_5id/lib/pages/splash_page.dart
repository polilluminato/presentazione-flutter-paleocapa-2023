import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splash.png",
              width: screenSize.width * .7,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 48),
              child: Text(
                "5ID Paleocapa",
                style: textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Benvenuti nell'applicazione della 5ID al Pietro Paleocapa di Bergamo. Clicca sul bottone qui sotto per accedere!",
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Accedi"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
