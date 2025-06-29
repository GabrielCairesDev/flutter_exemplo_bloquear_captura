import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Classe utilitária para gerenciar a segurança da tela
class ScreenSecurity {
  // Canal de comunicação com o código nativo Android
  static const _channel = MethodChannel('security.channel');

  // Ativa a proteção da tela (bloqueia screenshots e gravações)
  static Future<void> enableSecure() async {
    try {
      await _channel.invokeMethod('enableSecure');
      debugPrint('Segurança de captura de tela foi ativada');
    } catch (e) {
      debugPrint('Erro ao ativar segurança de tela: $e');
    }
  }

  // Desativa a proteção da tela
  static Future<void> disableSecure() async {
    try {
      await _channel.invokeMethod('disableSecure');
      debugPrint('Segurança de captura de tela foi desativada');
    } catch (e) {
      debugPrint('Erro ao desativar segurança de tela: $e');
    }
  }

  // Verifica se a proteção da tela está ativada
  static Future<bool> isSecureEnabled() async {
    try {
      final bool? result = await _channel.invokeMethod<bool>('isSecureEnabled');
      debugPrint(
        'Segurança de captura de tela está ${result == true ? 'ativada' : 'desativada'}',
      );
      return result ?? false;
    } catch (e) {
      debugPrint('Erro ao verificar segurança de tela: $e');
      return false;
    }
  }
}
