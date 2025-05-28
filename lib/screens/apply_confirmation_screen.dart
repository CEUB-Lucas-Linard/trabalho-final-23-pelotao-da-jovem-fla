// Arquivo: lib/screens/apply_confirmation_screen.dart

import 'package:flutter/material.dart';
import 'apply_success_screen.dart'; // Tela de sucesso da candidatura

class ApplyConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic> applicationData;

  const ApplyConfirmationScreen({super.key, required this.applicationData});

  @override
  Widget build(BuildContext context) {
    // Função para simular o envio da candidatura
    void _confirmAndSendApplication() {
      // Aqui você poderia, no futuro, adicionar lógica para enviar os dados para um backend real.
      // Por enquanto, apenas navegamos para a tela de sucesso.
      print('Dados da candidatura (simulado): $applicationData');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ApplySuccessScreen(
            jobTitle: applicationData['jobTitle'] as String? ?? 'Vaga selecionada',
          ),
        ),
        (Route<dynamic> route) => route.isFirst, // Remove todas as rotas anteriores até a primeira (JobListScreen)
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Candidatura enviada com sucesso! (Simulado)'),
          backgroundColor: Colors.green,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirme seus Dados'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Por favor, revise os dados da sua candidatura para a vaga:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              applicationData['jobTitle'] as String? ?? 'Vaga não especificada',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal),
            ),
            const Divider(height: 30),

            _buildInfoTile('Nome Completo:', applicationData['name'] as String),
            _buildInfoTile('Email:', applicationData['email'] as String),
            _buildInfoTile('Telefone:', applicationData['phone'] as String),

            if (applicationData['linkedin'] != null && (applicationData['linkedin'] as String).isNotEmpty)
              _buildInfoTile('LinkedIn:', applicationData['linkedin'] as String),

            if (applicationData['coverLetter'] != null && (applicationData['coverLetter'] as String).isNotEmpty)
              _buildInfoTile('Carta de Apresentação:', applicationData['coverLetter'] as String, isMultiline: true),

            const SizedBox(height: 30),
            Text(
              'Ao clicar em "Confirmar Candidatura", você concorda que seus dados (simulados) sejam processados.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _confirmAndSendApplication,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Botão largo
              ),
              child: const Text('Confirmar Candidatura'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Volta para o formulário para edição
              },
              style: TextButton.styleFrom(minimumSize: const Size(double.infinity, 40)),
              child: const Text('Editar Informações'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value, {bool isMultiline = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 15, height: isMultiline ? 1.4 : 1.0),
          ),
        ],
      ),
    );
  }
}