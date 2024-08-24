
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/professor_home_screen.dart';
import 'screens/sala_detalhes_screen.dart';
import 'screens/aluno_home_screen.dart';

class Routes {
  // Definindo os nomes das rotas
  static const String login = '/';
  static const String cadastro = '/cadastro';
  static const String professorHome = '/professor-home';
  static const String salaDetalhes = '/sala-detalhes';
  static const String alunoHome = '/aluno-home';

  // Função para gerar as rotas com base nos nomes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case cadastro:
        return MaterialPageRoute(builder: (_) => CadastroScreen());
      case professorHome:
        return MaterialPageRoute(builder: (_) => ProfessorHomeScreen());
      case salaDetalhes:
        final String salaId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => SalaDetalhesScreen(),
        );
      case alunoHome:
        return MaterialPageRoute(builder: (_) => AlunoHomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
