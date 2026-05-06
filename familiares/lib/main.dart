import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
// Placeholder
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Familiares',
      theme: appTheme(),
      home: const Scaffold(
        body: Center(
          child: Text('Hola Mundo'),
        ),
      ),
    );
  }
}