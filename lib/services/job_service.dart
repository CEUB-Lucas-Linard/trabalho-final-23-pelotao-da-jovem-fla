// Arquivo: lib/services/job_service.dart

import 'dart:async'; // Para Future.delayed
// import 'dart:convert'; // Para jsonDecode ao usar API real
// import 'package:http/http.dart' as http; // Para fazer requisições HTTP
import '../models/job_model.dart';

// Classe responsável por buscar e fornecer os dados das vagas.
// Inicialmente, usará dados mockados.
class JobService {
  // URL base da API (exemplo, substituir pela URL real quando disponível)
  // final String _baseUrl = 'https://sua-api.com/vagas';

  // Lista mockada de vagas para simulação
  final List<JobModel> _mockJobs = [
    JobModel(
      id: '1',
      title: 'Desenvolvedor Flutter Sênior',
      company: 'InovaTech Soluções Digitais',
      type: 'Remoto',
      area: 'TI',
      description:
          'Estamos em busca de um Desenvolvedor Flutter Sênior apaixonado por criar aplicativos móveis incríveis e de alta performance. Você será responsável por liderar o desenvolvimento de novas funcionalidades, mentorar desenvolvedores juniores e garantir a qualidade do código.',
      requirements: [
        '5+ anos de experiência com Dart e Flutter.',
        'Experiência com gerenciamento de estado (Provider, Riverpod, BLoC).',
        'Conhecimento em testes unitários e de widget.',
        'Experiência com APIs RESTful e GraphQL.',
        'Publicação de apps nas lojas (App Store, Google Play).'
      ],
      benefits: [
        'Salário competitivo',
        'Plano de saúde e odontológico',
        'Vale Refeição/Alimentação',
        'Horário flexível',
        'Auxílio home office'
      ],
      salary: 12000.00,
      companyLogoUrl: 'https://placehold.co/100x100/007BFF/FFFFFF?text=IT', // Placeholder logo
      location: null, // Remoto não tem localização específica
    ),
    JobModel(
      id: '2',
      title: 'Analista de Marketing Digital Pleno',
      company: 'Marketing Masters Co.',
      type: 'Presencial',
      area: 'Marketing',
      description:
          'Procuramos um Analista de Marketing Digital Pleno para gerenciar campanhas online, otimizar SEO, analisar métricas e criar conteúdo engajador. O candidato ideal é criativo, analítico e proativo.',
      requirements: [
        'Experiência com Google Ads e Facebook Ads.',
        'Conhecimento em SEO e ferramentas de análise (Google Analytics).',
        'Habilidade em criação de conteúdo e copywriting.',
        'Formação em Marketing, Publicidade ou áreas correlatas.'
      ],
      benefits: [
        'Vale Transporte',
        'Seguro de Vida',
        'Day off no aniversário',
        'Cursos e Treinamentos'
      ],
      location: 'São Paulo, SP',
      salary: 6500.00,
      companyLogoUrl: 'https://placehold.co/100x100/FFC107/000000?text=MM', // Placeholder logo
    ),
    JobModel(
      id: '3',
      title: 'Estágio em Design Gráfico',
      company: 'Estúdio Criativo Visual',
      type: 'Híbrido',
      area: 'Design',
      description:
          'Oportunidade de estágio para estudantes de Design Gráfico. O estagiário auxiliará na criação de peças gráficas para mídias sociais, materiais de marketing e identidade visual de clientes. Buscamos alguém com vontade de aprender e crescer na área.',
      requirements: [
        'Cursando Design Gráfico, Publicidade ou similar.',
        'Conhecimento em Adobe Photoshop e Illustrator.',
        'Portfólio com projetos (mesmo que acadêmicos).',
        'Boa comunicação e organização.'
      ],
      benefits: ['Bolsa Auxílio', 'Auxílio Transporte', 'Possibilidade de efetivação'],
      location: 'Curitiba, PR',
      salary: 1500.00,
      companyLogoUrl: 'https://placehold.co/100x100/28A745/FFFFFF?text=EC', // Placeholder logo
    ),
     JobModel(
      id: '4',
      title: 'Engenheiro de Dados Pleno',
      company: 'Data Insights Corp.',
      type: 'Remoto',
      area: 'TI',
      description:
          'Buscamos um Engenheiro de Dados Pleno para projetar, construir e manter pipelines de dados escaláveis e confiáveis. Você trabalhará com grandes volumes de dados, utilizando tecnologias de Big Data e Cloud.',
      requirements: [
        'Experiência com Python e SQL.',
        'Conhecimento em ferramentas de ETL/ELT.',
        'Experiência com plataformas de cloud (AWS, GCP ou Azure).',
        'Familiaridade com Spark, Hadoop ou similar.'
      ],
      benefits: [
        'Plano de Stock Options',
        'Budget para desenvolvimento profissional',
        'Cultura de trabalho colaborativa'
      ],
      salary: 9500.00,
      companyLogoUrl: 'https://placehold.co/100x100/17A2B8/FFFFFF?text=DI', // Placeholder logo
    ),
  ];

  // Método para buscar todas as vagas (atualmente mockado).
  // Simula um delay de rede.
  Future<List<JobModel>> getAllJobs() async {
    await Future.delayed(const Duration(seconds: 1)); // Simula latência da rede
    return List.from(_mockJobs); // Retorna uma cópia da lista mockada
  }

  // Método para buscar uma vaga específica pelo ID (atualmente mockado).
  Future<JobModel?> getJobById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockJobs.firstWhere((job) => job.id == id);
    } catch (e) {
      return null; // Retorna null se não encontrar a vaga
    }
  }

  // Exemplo de como seria um método para buscar vagas de uma API real:
  /*
  Future<List<JobModel>> fetchJobsFromApi() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // Se a API retornar uma lista de jobs diretamente:
        List<dynamic> body = jsonDecode(response.body);
        List<JobModel> jobs = body
            .map((dynamic item) => JobModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return jobs;
      } else {
        // Se o servidor não retornar um 200 OK, lance uma exceção.
        throw Exception('Falha ao carregar vagas da API: ${response.statusCode}');
      }
    } catch (e) {
      // Tratar erros de rede ou parsing
      print('Erro ao buscar vagas da API: $e');
      // Retornar uma lista vazia ou relançar a exceção
      return [];
    }
  }
  */
}