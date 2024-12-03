import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Mudando a cor de fundo
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Mirror',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold, // Mudando o estilo da fonte
          ),
        ),
        toolbarHeight: 70, // Aumentando a altura da AppBar
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.teal, // Mudando a cor da AppBar
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adicionando espaçamento nas laterais
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(),
            SizedBox(height: 20),
            _buildUserInfo(user.displayName ?? 'Usuário', Colors.teal[200]!, 25),
            SizedBox(height: 10),
            _buildUserInfo(user.email ?? 'Email', Colors.teal[200]!, 18),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 90,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: user.photoURL != null
            ? Image.network(user.photoURL!, fit: BoxFit.cover)
            : Icon(Icons.person, size: 60, color: Colors.teal),
      ),
    );
  }

  Widget _buildUserInfo(String info, Color color, double fontSize) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2, color: Colors.teal),
      ),
      child: Text(
        info,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.teal, // Mudando a cor do BottomAppBar
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sair',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop(); // Redirecionando para a tela anterior
              },
              icon: Icon(Icons.exit_to_app, color: Colors.white, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
