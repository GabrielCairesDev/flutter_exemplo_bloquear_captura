package com.example.flutter_exemplo_bloquear_captura.security

import android.view.Window
import android.view.WindowManager

// Classe responsável por gerenciar a segurança da tela
class ScreenSecurityManager(private val window: Window) {

    // Flag para controlar se a segurança está ativada
    private var isSecureEnabled = false

    // Ativa a proteção da tela (bloqueia screenshots e gravações)
    fun enableSecure() {
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE
        )
        isSecureEnabled = true
    }

    // Desativa a proteção da tela
    fun disableSecure() {
        window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
        isSecureEnabled = false
    }

    // Verifica se a proteção está ativada
    fun isSecure(): Boolean = isSecureEnabled
}
