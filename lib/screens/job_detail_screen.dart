// Arquivo: lib/screens/job_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../services/job_service.dart';
import 'apply_form_screen.dart'; // Tela do formulário de candidatura

class JobDetailScreen extends StatefulWidget {
  final String jobId; // Recebe o ID da vaga para buscar os detalhes

  const JobDetailScreen({super.key, required this.jobId});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  final JobService _jobService = JobService();
  Future<JobModel?>? _jobDetailFuture;

  @override
  void initState() {
    super.initState();
    _jobDetailFuture = _jobService.getJobById(widget.jobId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Vaga'),
      ),
      body: FutureBuilder<JobModel?>(
        future: _jobDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text(snapshot.hasError
                  ? 'Erro ao carregar detalhes: ${snapshot.error}'
                  : 'Vaga não encontrada.'),
            );
          }

          final job = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho com Logo, Título e Empresa
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (job.companyLogoUrl != null && job.companyLogoUrl!.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          job.companyLogoUrl!,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Icon(Icons.business, color: Colors.grey[500], size: 35),
                            );
                          },
                        ),
                      ),
                    if (job.companyLogoUrl != null && job.companyLogoUrl!.isNotEmpty)
                      const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.title,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[800],
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            job.company,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey[700],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Informações rápidas: Tipo, Área, Localização, Salário
                _buildInfoRow(Icons.work_outline, 'Tipo', job.type),
                _buildInfoRow(Icons.category_outlined, 'Área', job.area),
                if (job.location != null && job.location!.isNotEmpty)
                  _buildInfoRow(Icons.location_on_outlined, 'Localização', job.location!),
                if (job.salary != null)
                  _buildInfoRow(Icons.attach_money_outlined, 'Salário', 'R\$ ${job.salary!.toStringAsFixed(2)}'),

                const Divider(height: 30, thickness: 1),

                // Descrição da Vaga
                _buildSectionTitle(context, 'Descrição da Vaga'),
                Text(
                  job.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),

                // Requisitos
                _buildSectionTitle(context, 'Requisitos'),
                if (job.requirements.isNotEmpty)
                  ...job.requirements.map((req) => _buildListItem(req)).toList()
                else
                  const Text("Nenhum requisito específico informado."),
                const SizedBox(height: 20),

                // Benefícios
                _buildSectionTitle(context, 'Benefícios'),
                if (job.benefits.isNotEmpty)
                  ...job.benefits.map((ben) => _buildListItem(ben)).toList()
                else
                  const Text("Nenhum benefício específico informado."),
                const SizedBox(height: 30),

                // Botão de Candidatar-se
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplyFormScreen(jobId: job.id, jobTitle: job.title),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text('Candidatar-se Agora'),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.teal,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, size: 18, color: Colors.teal),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey[700]),
          const SizedBox(width: 10),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}