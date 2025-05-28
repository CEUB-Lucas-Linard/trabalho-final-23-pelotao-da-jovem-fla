// Arquivo: lib/screens/apply_success_screen.dart

import 'package:flutter/material.dart';

class ApplySuccessScreen extends StatelessWidget {
  final String jobTitle;

  const ApplySuccessScreen({super.key, required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar opcional, pode ser removida para uma tela mais limpa
      // appBar: AppBar(
      //   title: Text('Sucesso!'),
      //   automaticallyImplyLeading: false, // Remove o botão de voltar
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.green,
                size: 100.0,
              ),
              const SizedBox(height: 24.0),
              Text(
                'Candidatura Enviada!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Sua candidatura (simulada) para a vaga de "$jobTitle" foi registrada com sucesso.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Boa sorte no processo seletivo!',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              ElevatedButton.icon(
                icon: const Icon(Icons.list_alt_outlined),
                label: const Text('Ver Outras Vagas'),
                onPressed: () {
                  // Navega de volta para a tela de listagem de vagas, limpando a pilha de navegação.
                  // Isso garante que o usuário não volte para as telas de formulário/confirmação.
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
