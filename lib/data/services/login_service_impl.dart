import 'package:flutter_application_1/domain/entities/entities/login.dart';
import 'package:flutter_application_1/domain/services/login_service.dart';

class LoginServiceImpl extends LoginService {
  @override
  Future<Login> obtenhaLogin(
      {required String usuario, required String senha}) async {
    if (usuario == 'Wilson' && senha == 'souocara') {
      return Login(usuario: usuario, senha: senha, token: 'token');
    }
    throw Exception("Login inválido");
  }
}
