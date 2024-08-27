import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/aluno_home_screen.dart';
import 'screens/professor_home_screen.dart';
import 'screens/sala_detalhes_screen.dart';

class Routes {
  static const String login = '/login';
  static const String cadastro = '/cadastro';
  static const String alunoHome = '/aluno_home';
  static const String professorHome = '/professor_home';
  static const String salaDetalhes = '/sala_detalhes';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case cadastro:
        return MaterialPageRoute(builder: (_) => CadastroScreen());
      case alunoHome:
        return MaterialPageRoute(builder: (_) => AlunoHomeScreen());
      case professorHome:
        return MaterialPageRoute(builder: (_) => ProfessorHomeScreen());
      case salaDetalhes:
        return MaterialPageRoute(builder: (_) => SalaDetalhesScreen(salaId: '',));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Rota não definida')),
          ),
        );
    }
  }
}
