// Arquivo: lib/models/job_model.dart

// Define a estrutura de dados para uma vaga de emprego.
class JobModel {
  final String id;
  final String title; // Título da vaga
  final String company; // Nome da empresa
  final String type; // Tipo da vaga: "Remoto", "Presencial"
  final String area; // Área de atuação: "TI", "Administração", "Marketing", etc.
  final String description; // Descrição detalhada da vaga
  final List<String> requirements; // Lista de requisitos (experiência, qualificações)
  final List<String> benefits; // Lista de benefícios oferecidos
  final String? location; // Localização da vaga (para vagas presenciais, opcional)
  final double? salary; // Salário (opcional)
  final String? companyLogoUrl; // URL para o logo da empresa (opcional)

  JobModel({
    required this.id,
    required this.title,
    required this.company,
    required this.type,
    required this.area,
    required this.description,
    required this.requirements,
    required this.benefits,
    this.location,
    this.salary,
    this.companyLogoUrl,
  });

  // Método de fábrica para criar uma instância de JobModel a partir de um mapa JSON.
  // Isso é útil ao consumir dados de uma API.
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] as String,
      title: json['title'] as String,
      company: json['company'] as String,
      type: json['type'] as String,
      area: json['area'] as String,
      description: json['description'] as String,
      // Garante que 'requirements' e 'benefits' sejam lidos como List<String>
      requirements: List<String>.from(json['requirements'] as List? ?? []),
      benefits: List<String>.from(json['benefits'] as List? ?? []),
      location: json['location'] as String?,
      // Converte 'salary' para double, se existir
      salary: (json['salary'] as num?)?.toDouble(),
      companyLogoUrl: json['companyLogoUrl'] as String?,
    );
  }

  // Método para converter uma instância de JobModel de volta para um mapa JSON.
  // Pode ser útil se você precisar enviar dados para um backend.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'type': type,
      'area': area,
      'description': description,
      'requirements': requirements,
      'benefits': benefits,
      'location': location,
      'salary': salary,
      'companyLogoUrl': companyLogoUrl,
    };
  }
}