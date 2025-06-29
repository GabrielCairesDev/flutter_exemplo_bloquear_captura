# Flutter Exemplo - Bloquear Captura de Tela

Este projeto demonstra como bloquear capturas de tela e gravações em aplicações Flutter, utilizando código nativo Android.

## 📱 Funcionalidades

- **Bloqueio de Screenshots/Bloqueio de Gravações**: Impede que usuários gravem ou tirem capturas de tela da aplicação
- **Controle Dinâmico**: Permite ativar/desativar a proteção em tempo real
- **Verificação de Estado**: Interface para verificar se a proteção está ativa

## 🏗️ Arquitetura do Projeto

O projeto segue uma arquitetura limpa com separação clara de responsabilidades:

```
lib/
├── core/
│   ├── app/
│   │   └── app_widget.dart          # Widget principal da aplicação
│   └── routes/
│       └── app_routes.dart          # Configuração de rotas
├── presentation/
│   └── home/
│       └── view/
│           └── home_view.dart       # Tela principal com controles
├── utils/
│   └── screen_security.dart         # Utilitário para comunicação com Android
└── main.dart                        # Ponto de entrada da aplicação
```

## 🔧 Como Funciona

### 1. Interface Flutter
A aplicação possui uma interface simples com:
- **Switch**: Para ativar/desativar a proteção de tela
- **Botão "Verificar"**: Para verificar o estado atual da proteção
- **Indicador Visual**: Mostra se a proteção está ativa ou inativa

### 2. Comunicação com Android Nativo
O projeto utiliza `MethodChannel` para comunicação entre Flutter e código nativo Android:

```dart
// Flutter - lib/utils/screen_security.dart
static const _channel = MethodChannel('security.channel');
```

### 3. Implementação Android
A funcionalidade de segurança é implementada no lado Android usando:

- **MainActivity.kt**: Configura o canal de comunicação e gerencia as chamadas
- **ScreenSecurityManager.kt**: Implementa a lógica de segurança usando `FLAG_SECURE`

```kotlin
// Ativa a proteção
window.setFlags(
    WindowManager.LayoutParams.FLAG_SECURE,
    WindowManager.LayoutParams.FLAG_SECURE
)
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (versão 3.8.1 ou superior)
- Android Studio / VS Code
- Dispositivo Android ou emulador

### Passos para Execução

1. **Clone o repositório**
   ```bash
   git clone https://github.com/GabrielCairesDev/flutter_exemplo_bloquear_captura.git
   cd flutter_exemplo_bloquear_captura
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Execute a aplicação**
   ```bash
   flutter run
   ```


### Limitações
- Funciona apenas em dispositivos Android
- Não impede gravações físicas (câmera externa)
- Alguns apps de assistência podem contornar a proteção

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento multiplataforma
- **Dart**: Linguagem de programação
- **Kotlin**: Linguagem nativa Android
- **MethodChannel**: Comunicação Flutter-Nativo
- **WindowManager**: API Android para controle de janelas

## 📁 Estrutura de Arquivos Importantes

### Flutter (Dart)
- `lib/main.dart` - Ponto de entrada
- `lib/utils/screen_security.dart` - Interface de comunicação com Android
- `lib/presentation/home/view/home_view.dart` - Interface do usuário

### Android (Kotlin)
- `android/app/src/main/kotlin/com/flutter_exemplo_bloquear_captura/MainActivity.kt` - Configuração do canal
- `android/app/src/main/kotlin/com/flutter_exemplo_bloquear_captura/security/ScreenSecurityManager.kt` - Lógica de segurança

## 🔍 Casos de Uso

Este projeto é útil para aplicações que precisam proteger conteúdo sensível:

- **Apps Financeiros**: Proteger dados bancários
- **Apps Corporativos**: Proteger informações confidenciais
- **Apps de Streaming**: Proteger conteúdo premium
- **Apps de Saúde**: Proteger dados médicos

## 📚 Recursos e Referências

- **Repositório GitHub**: [flutter_exemplo_bloquear_captura](https://github.com/GabrielCairesDev/flutter_exemplo_bloquear_captura.git)
- **Artigo Tutorial**: [Flutter: Como Desativar e Ativar Captura de Tela](https://medium.com/@gabriel.araujo.caires/flutter-como-desativar-e-ativar-captura-de-tela-50ef46ef8301)

---

![Flutter Screen Security](https://miro.medium.com/v2/resize:fit:590/format:webp/1*8A6LxaCn-pr_A8TWfkzn8A.png)