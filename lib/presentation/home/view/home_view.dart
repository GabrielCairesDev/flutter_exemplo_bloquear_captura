import 'package:flutter/material.dart';
import 'package:flutter_exemplo_bloquear_captura/utils/screen_security.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isSecure = false; // estado do switch
  bool _isSecureEnabled = false; // estado da segurança

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // switch para ativar e desativar a segurança
            Switch(
              value: _isSecure,
              onChanged: (value) async {
                if (value) {
                  // ativar segurança
                  await ScreenSecurity.enableSecure();
                } else {
                  // desativar segurança
                  await ScreenSecurity.disableSecure();
                }
                // atualizar o estado do switch
                setState(() {
                  _isSecure = value;
                });
              },
            ),
            // botão para verificar o estado da segurança
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isSecureEnabled ? Colors.green : Colors.red,
              ),
              onPressed: () async {
                // verificar o estado da segurança
                final isSecure = await ScreenSecurity.isSecureEnabled();
                // atualizar o estado da segurança
                setState(() {
                  _isSecureEnabled = isSecure;
                });
              },
              child: const Text(
                'Verificar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // texto para exibir o estado da segurança
            Text(
              'Estado da segurança: ${_isSecureEnabled ? 'Ativada' : 'Desativada'}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
