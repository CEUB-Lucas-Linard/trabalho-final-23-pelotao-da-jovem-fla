// Arquivo: lib/widgets/job_list_item.dart

import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../screens/job_detail_screen.dart'; // Para navegação ao clicar

// Widget reutilizável para exibir um item individual na lista de vagas.
class JobListItem extends StatelessWidget {
  final JobModel job;

  const JobListItem({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Movido para o cardTheme global
      // elevation: 3, // Movido para o cardTheme global
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Movido para o cardTheme global
      child: InkWell(
        borderRadius: BorderRadius.circular(10), // Para efeito de toque no Card
        onTap: () {
          // Navega para a tela de detalhes da vaga ao clicar no item
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobDetailScreen(jobId: job.id), // Passa o ID da vaga
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo da Empresa (se disponível)
              if (job.companyLogoUrl != null && job.companyLogoUrl!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    job.companyLogoUrl!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback para um ícone caso a imagem não carregue
                      return Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(Icons.business, color: Colors.grey[600], size: 30),
                      );
                    },
                  ),
                ),
              if (job.companyLogoUrl != null && job.companyLogoUrl!.isNotEmpty)
                const SizedBox(width: 12),

              // Informações da Vaga
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey, // Cor do título da vaga
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job.company,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.work_outline, size: 16, color: Colors.teal),
                        const SizedBox(width: 4),
                        Text(
                          job.type,
                          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.category_outlined, size: 16, color: Colors.teal),
                        const SizedBox(width: 4),
                        Expanded( // Para evitar overflow se a área for muito longa
                          child: Text(
                            job.area,
                            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (job.location != null && job.location!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 16, color: Colors.teal),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                job.location!,
                                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              // Ícone de seta para indicar clicabilidade
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}