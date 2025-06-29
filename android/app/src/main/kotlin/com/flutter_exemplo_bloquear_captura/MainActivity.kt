package com.example.flutter_exemplo_bloquear_captura

import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.flutter_exemplo_bloquear_captura.security.ScreenSecurityManager

class MainActivity : FlutterActivity() {

    // Nome do canal de comunicação com Flutter
    private val CHANNEL = "security.channel"
    
    // Gerenciador de segurança da tela
    private lateinit var screenSecurityManager: ScreenSecurityManager

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Inicializa o gerenciador de segurança
        screenSecurityManager = ScreenSecurityManager(window)

        // Configura o canal de comunicação com Flutter
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    // Ativa a proteção da tela
                    "enableSecure" -> {
                        screenSecurityManager.enableSecure()
                        result.success(null)
                    }
                    // Desativa a proteção da tela
                    "disableSecure" -> {
                        screenSecurityManager.disableSecure()
                        result.success(null)
                    }
                    // Verifica se a proteção está ativada
                    "isSecureEnabled" -> {
                        result.success(screenSecurityManager.isSecure())
                    }
                    // Método não implementado
                    else -> result.notImplemented()
                }
            }
    }
}
