// Arquivo: lib/screens/apply_form_screen.dart

import 'package:flutter/material.dart';
import 'apply_confirmation_screen.dart'; // Tela de confirmação

class ApplyFormScreen extends StatefulWidget {
  final String jobId;
  final String jobTitle;

  const ApplyFormScreen({super.key, required this.jobId, required this.jobTitle});

  @override
  State<ApplyFormScreen> createState() => _ApplyFormScreenState();
}

class _ApplyFormScreenState extends State<ApplyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _linkedinController = TextEditingController(); // Opcional
  final _coverLetterController = TextEditingController(); // Opcional: Carta de apresentação simples

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _linkedinController.dispose();
    _coverLetterController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Coleta os dados do formulário
      final applicationData = {
        'jobId': widget.jobId,
        'jobTitle': widget.jobTitle,
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'linkedin': _linkedinController.text.isNotEmpty ? _linkedinController.text : null,
        'coverLetter': _coverLetterController.text.isNotEmpty ? _coverLetterController.text : null,
      };

      // Navega para a tela de confirmação, passando os dados
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplyConfirmationScreen(applicationData: applicationData),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, corrija os erros no formulário.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidatar-se para ${widget.jobTitle}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Preencha seus dados para a vaga:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                widget.jobTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal),
              ),
              const SizedBox(height: 24),

              // Campo Nome
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo*',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome completo.';
                  }
                  if (value.trim().split(' ').length < 2) {
                    return 'Por favor, insira nome e sobrenome.';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Campo Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email*',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email.';
                  }
                  final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (!emailRegex.hasMatch(value)) {
                    return 'Por favor, insira um email válido.';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Campo Telefone
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone (com DDD)*',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu telefone.';
                  }
                  if (value.replaceAll(RegExp(r'\D'), '').length < 10) {
                     return 'Telefone inválido. Inclua o DDD.';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Campo LinkedIn (Opcional)
              TextFormField(
                controller: _linkedinController,
                decoration: const InputDecoration(
                  labelText: 'Perfil LinkedIn (opcional)',
                  prefixIcon: Icon(Icons.link),
                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                 validator: (value) {
                  if (value != null && value.isNotEmpty && !value.toLowerCase().contains('linkedin.com')) {
                    return 'Por favor, insira um link válido do LinkedIn.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo Carta de Apresentação (Opcional)
              TextFormField(
                controller: _coverLetterController,
                decoration: const InputDecoration(
                  labelText: 'Carta de Apresentação (opcional)',
                  prefixIcon: Icon(Icons.note_alt_outlined),
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 30),

              // Botão de Enviar
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Revisar e Enviar Candidatura'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
