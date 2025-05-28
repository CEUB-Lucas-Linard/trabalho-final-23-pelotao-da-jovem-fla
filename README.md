
---

## 8. Aplicativo de Vagas de Emprego Simples

**Tema**: Ofertas de trabalho, estágio  
**Conceitos**:
- Consumo de API (pode ser fictícia ou real, como LinkedIn Jobs, se possível)
- Filtro e busca de dados (uso de coleções em Dart e exibição condicional de resultados)

**Sugestão de Funcionalidades**:
- Listagem das vagas (remotas, presenciais, por área)
- Detalhes da vaga (descrição, requisitos, benefícios)
- Botão para “candidatar-se” (fluxo pode ser simulado se não houver back-end real)

---
# Task Manager

Aplicação Dart simples baseada em uma **história de usuário**.

## História de Usuário

> Como usuário de um sistema de tarefas,  
> quero adicionar e visualizar tarefas,  
> para poder organizar meu dia a dia.

## Como Executar

```bash
dart lib/task_manager.dart



---

# Observações Metodológicas

- **Complexidade Ajustável**: Todos os projetos podem ser **escalados** em complexidade. Para equipes que avançarem rápido, é possível integrar mais funcionalidades (ex.: autenticação, Firestore, push notifications etc.).
- **Documentação e Boas Práticas**: Incentive o uso de **Git** desde o início, testes básicos (Unit ou Widget Tests) e uma estrutura clara de pastas.
- **Avaliação Gradual**: Recomenda-se desenvolvimento em **sprints quinzenais**, onde cada equipe mostra o que foi implementado e recebe feedback contínuo.

# Rubrica

# **Rubrica de Correção**
**Escala de menções**:
- **II** (Inferior)
- **MI** (Médio Inferior)
- **MM** (Médio)
- **MS** (Médio Superior)
- **SS** (Superior)

A avaliação será composta por **3 dimensões**:
1. **Documentação**
2. **Qualidade Técnica do Código**
3. **Design do Produto**

Cada uma recebe menção na escala acima, com base nos critérios descritos a seguir.

---

## 1. Documentação

| Menção | Critérios de Avaliação                                                                                                                                                                                                         |
|-------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **II** | **Ausência ou nível extremamente baixo de documentação.**<br>• Quase nenhum registro de requisitos, funcionalidades ou instruções.<br>• Não há clareza sobre instalação/configuração.                                          |
| **MI** | **Documentação muito básica e incompleta.**<br>• Registra apenas parte das funcionalidades (sem detalhes de uso).<br>• Organização confusa, dificultando o entendimento do projeto.                                            |
| **MM** | **Documentação suficiente para compreensão inicial.**<br>• Descreve instalação, execução e funcionalidades principais.<br>• É simples, porém cobre o essencial sem muito detalhamento.                                         |
| **MS** | **Documentação bem organizada e clara.**<br>• Explica objetivos, arquitetura, instruções de uso e dependências.<br>• Inclui breves instruções de contribuição ou boas práticas internas.                                       |
| **SS** | **Documentação completa e profissional.**<br>• Fornece visão geral, diagramas de arquitetura, explicações de design e fluxos.<br>• Traz referências, exemplos de uso, tutoriais e instruções avançadas (deploy, testes, etc.). |

---

## 2. Qualidade Técnica do Código

| Menção | Critérios de Avaliação                                                                                                                                                                                                |
|-------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **II** | **Código desorganizado e pouco funcional.**<br>• Falhas constantes de execução e alta quantidade de bugs.<br>• Não segue convenções mínimas de estilo ou boas práticas.                                               |
| **MI** | **Código funcional, porém frágil.**<br>• Muitas “gambiarras” e pouca legibilidade.<br>• Falta de padronização (nomes de variáveis, formatação etc.).<br>• Baixa modularização.                                        |
| **MM** | **Código funcional e relativamente claro.**<br>• Erros pontuais, mas arquitetura minimamente organizada.<br>• Boas práticas seguidas em parte (nomes de variáveis, estrutura de pastas etc.).                         |
| **MS** | **Código bem estruturado e legível.**<br>• Padrões e convenções de estilo respeitados (lint, formatação, nomenclatura).<br>• Uso consistente de técnicas de versionamento e boas práticas (mensagens de commit etc.). |
| **SS** | **Código de alto nível de qualidade e manutenção.**<br>• Modularização clara e uso de padrões arquiteturais (ex.: MVC, MVVM, Bloc etc.).<br>• Inclui testes automatizados, tratamento de erros e escalabilidade.      |

---

## 3. Design do Produto

| Menção | Critérios de Avaliação                                                                                                                                                                                |
|-------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **II** | **Design confuso e pouco intuitivo.**<br>• Layout inconsistente, difícil de navegar.<br>• Ausência de padronização visual ou preocupações com usabilidade.                                            |
| **MI** | **Design minimamente utilizável, mas sem refinamento.**<br>• Falta hierarquia visual (cores, tipografia).<br>• Ajustes básicos de responsividade ou navegação ausentes ou insuficientes.              |
| **MM** | **Design simples, porém coerente.**<br>• Navegação compreensível e layouts básicos funcionais.<br>• Uso razoável de cores, espaçamentos e padrões de UI/UX.                                           |
| **MS** | **Design organizado, alinhado a boas práticas de UX.**<br>• Navegação fluida, responsividade adequada.<br>• Elementos visuais com boa harmonia e padronização (ícones, cores, tipografia).            |
| **SS** | **Design profissional, elegante e com alta usabilidade.**<br>• Layout responsivo, com animações/transições bem aplicadas.<br>• Excelência em coerência visual, consistência e experiência do usuário. |

---

## Observações Finais

- A **menção final** em cada aspecto deve refletir **o nível predominante** observado no projeto.
- O professor pode realizar um balanceamento, considerando também **entregas parciais**, **evolução** ao longo do desenvolvimento e a **consistência geral** entre documentação, código e design.
