import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bloc/application/application_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/application/application_event.dart';
import 'package:flutter_application_1/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/login/login_event.dart';
import 'package:flutter_application_1/presentation/bloc/login/login_state.dart';
import 'package:flutter_application_1/presentation/widgets/widgets_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state.isSucesso) {
              BlocProvider.of<ApplicationBloc>(context).add(
                ApplicationLoginEvent(token: state.token!),
              );
            }
            if (state.isErro) {
              WidgetHelper.showError(context, state.erro!);
            }
            return Container(
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                colors: [Color(0xFF311B92), Color(0xFF6A1B9A), Colors.white],
                stops: [0.5, 0.8, 0.1],
                center: Alignment(0, -1),
                focal: Alignment(-0.1, -0.4),
                focalRadius: 1.5,
              )),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 400, left: 50, right: 50),
                    child: TextFormField(
                      controller: _usarioController,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                        suffixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                      controller: _senhaController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                        suffixIcon: Icon(Icons.vpn_key),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: RadialGradient(
                        colors: [
                          Color(0xFFFF8A65),
                          Color(0xFFFFAB91),
                          Colors.orange
                        ],
                      )),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () =>
                            BlocProvider.of<LoginBloc>(context).add(
                          LoginPressedButtonEvent(
                            usuario: _usarioController.text,
                            senha: _senhaController.text,
                          ),
                        ),
                        child: Text(
                          'Realizar login',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
