import 'package:flutter/material.dart';
import 'screens/job_list_screen.dart'; // Tela principal de listagem de vagas
// import 'utils/app_theme.dart'; // Opcional: para um tema customizado

void main() {
  runApp(const JobApp());
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Vagas',
      theme: ThemeData(
        // Você pode customizar o tema aqui ou usar um arquivo separado (app_theme.dart)
        primarySwatch: Colors.blueGrey, // Cor primária
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.teal, // Cor de destaque
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0, // Remove a sombra da AppBar para um look mais moderno
          backgroundColor: Colors.blueGrey, // Cor da AppBar
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white), // Cor dos ícones na AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Cor de fundo dos botões elevados
            foregroundColor: Colors.white, // Cor do texto dos botões elevados
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.teal, width: 2),
          ),
          labelStyle: const TextStyle(color: Colors.blueGrey),
        ),
      ),
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      home: const JobListScreen(), // Define a tela inicial do aplicativo
    );
  }
}