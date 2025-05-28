// Arquivo: lib/screens/job_list_screen.dart

import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../services/job_service.dart';
import '../widgets/job_list_item.dart';
// import 'job_detail_screen.dart'; // Já importado em job_list_item para onTap

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final JobService _jobService = JobService();
  late Future<List<JobModel>> _jobsFuture;
  List<JobModel> _allJobs = [];
  List<JobModel> _filteredJobs = [];

  // Controladores e variáveis para filtros
  final TextEditingController _searchController = TextEditingController();
  String? _selectedType; // "Remoto", "Presencial", "Híbrido"
  String? _selectedArea; // "TI", "Marketing", etc.

  // Opções para os filtros (poderiam vir de uma API ou serem fixas)
  final List<String> _jobTypes = ["Todos", "Remoto", "Presencial", "Híbrido"];
  final List<String> _jobAreas = [
    "Todos",
    "TI",
    "Marketing",
    "Design",
    "Administração",
    "Vendas",
    "Recursos Humanos"
  ]; // Exemplo

  @override
  void initState() {
    super.initState();
    _jobsFuture = _loadJobs();
    _searchController.addListener(_applyFilters);
  }

  Future<List<JobModel>> _loadJobs() async {
    try {
      _allJobs = await _jobService.getAllJobs();
      _applyFilters(); // Aplica filtros iniciais (se houver) ou mostra todos
      return _filteredJobs; // Retorna a lista já filtrada para o FutureBuilder
    } catch (e) {
      // Tratar erro, talvez mostrar uma mensagem na UI
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar vagas: $e')),
        );
      }
      return []; // Retorna lista vazia em caso de erro
    }
  }

  void _applyFilters() {
    setState(() {
      _filteredJobs = _allJobs.where((job) {
        final matchesKeyword = _searchController.text.isEmpty ||
            job.title
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            job.company
                .toLowerCase()
                .contains(_searchController.text.toLowerCase());

        final matchesType = _selectedType == null ||
            _selectedType == "Todos" ||
            job.type.toLowerCase() == _selectedType!.toLowerCase();

        final matchesArea = _selectedArea == null ||
            _selectedArea == "Todos" ||
            job.area.toLowerCase() == _selectedArea!.toLowerCase();

        return matchesKeyword && matchesType && matchesArea;
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vagas Disponíveis'),
        // Adicionar um botão para limpar filtros, se desejado
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.refresh),
        //     onPressed: () {
        //       _searchController.clear();
        //       setState(() {
        //         _selectedType = null;
        //         _selectedArea = null;
        //         _applyFilters(); // Recarrega com filtros limpos
        //       });
        //     },
        //   )
        // ],
      ),
      body: Column(
        children: [
          _buildFilterSection(), // Seção de filtros
          Expanded(
            child: FutureBuilder<List<JobModel>>(
              future: _jobsFuture, // Usa o future que carrega e filtra inicialmente
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting && _allJobs.isEmpty) {
                  // Mostra o loading apenas se _allJobs ainda não foi populado
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Erro ao carregar vagas: ${snapshot.error}'));
                }
                // Não precisamos mais de snapshot.data aqui, pois _filteredJobs é atualizado via setState

                if (_allJobs.isEmpty && snapshot.connectionState != ConnectionState.waiting) {
                   return const Center(child: Text('Nenhuma vaga cadastrada no momento.'));
                }

                if (_filteredJobs.isEmpty) {
                  return const Center(
                      child: Text('Nenhuma vaga encontrada para os filtros aplicados.'));
                }

                // Exibe a lista filtrada
                return RefreshIndicator(
                  onRefresh: () async {
                     // Atualiza a _jobsFuture para forçar o recarregamento e reconstrução do FutureBuilder
                     // Isso garante que o CircularProgressIndicator seja mostrado durante o refresh.
                    setState(() {
                      _jobsFuture = _loadJobs();
                    });
                    await _jobsFuture; // Espera o carregamento completar
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _filteredJobs.length,
                    itemBuilder: (context, index) {
                      final job = _filteredJobs[index];
                      return JobListItem(job: job);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget para a seção de filtros
  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Campo de busca por texto
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Buscar por título, empresa...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Filtros de Tipo e Área em uma linha
          Row(
            children: [
              // Filtro por Tipo de Vaga
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedType,
                  hint: const Text('Tipo'),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.work_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  ),
                  items: _jobTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type == "Todos" ? null : type, // "Todos" se torna null
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedType = newValue;
                      _applyFilters();
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              // Filtro por Área de Atuação
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedArea,
                  hint: const Text('Área'),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.category_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  ),
                  items: _jobAreas.map((String area) {
                    return DropdownMenuItem<String>(
                      value: area == "Todos" ? null : area, // "Todos" se torna null
                      child: Text(area),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedArea = newValue;
                      _applyFilters();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}