import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            const SizedBox(height: 50),
            _buildGoogleSignInButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'MIRROR',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _signInWithGoogle(context),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Image.asset('assets/imagens/logo.png'),
      ),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // O usuário cancelou o login

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print('Usuário logado: ${userCredential.user?.displayName}');

      // Navegar para a próxima tela ou realizar outra ação
      // Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print('Erro ao fazer login com Google: $e');
      // Adicionar tratamento de erro adequado aqui
    }
  }
}
