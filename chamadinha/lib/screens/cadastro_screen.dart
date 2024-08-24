// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../routes.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _role = 'Aluno';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'role': _role,
      });

      Navigator.pushReplacementNamed(
        context,
        _role == 'Aluno' ? Routes.alunoHome : Routes.professorHome,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar. Tente novamente.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              label: 'Nome',
            ),
            TextField(
              controller: _emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              label: 'Senha',
              obscureText: true,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _role,
              items: ['Aluno', 'Professor'].map((String role) {
                return DropdownMenuItem(value: role, child: Text(role));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _role = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Selecione o papel'),
            ),
            SizedBox(height: 20),
            Button(
              text: 'Cadastrar',
              onPressed: _register,
            ),
          ],
        ),
      ),
    );
  }
}