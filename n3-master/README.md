Aluno: Enzo Coelho Rossa.
Tela de Login: Na tela de login, ao pressionar o botão (imagem da logo do aplicativo), o processo de login é iniciado usando a ferramenta google_sign_in para autenticação via Google.

Tela Inicial: Na tela inicial, na parte do Bottom Navigation Bar, há um botão para logout. Ao ser pressionado, o usuário é desconectado da conta atualmente logada.

Dependências Utilizadas:

firebase_auth: ^5.3.3
google_sign_in: ^6.2.2
firebase_core: ^3.8.0
flutter_launcher_icons: ^0.13.1
Versões do Flutter/Dart:

Flutter 3.24.3
Dart 3.5.3
Versão mínima do SDK: 23

Como importar o projeto:

Obtenha o link do projeto no GitHub e insira-o no software utilizado para o desenvolvimento do aplicativo.
Como configurar o projeto:

Após importar o projeto, execute o comando flutter pub get para instalar as dependências necessárias.
Crie um projeto no Firebase e habilite a autenticação na aba de criação.
Na página inicial do projeto no Firebase, inicie a conexão com o Flutter.
No terminal, execute o comando firebase login e siga as instruções exibidas.
Para obter a chave SHA-1 necessária para o Google Sign-in, use um dos seguintes comandos:
./gradlew signingReport
keytool -exportcert -keystore "seu caminho de diretório do debug.keystore" -list -v
No Firebase, acesse as configurações do projeto e, na seção "Apps Android", insira a chave SHA-1 obtida.
