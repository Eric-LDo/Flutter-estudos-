// lib/screens/aluno_home_screen.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlunoHomeScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Aulas'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('aulas').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var aulas = snapshot.data!.docs;

          return ListView.builder(
            itemCount: aulas.length,
            itemBuilder: (context, index) {
              var aula = aulas[index];
              return ListTile(
                title: Text(aula['nome']),
                onTap: () {
                  // Lógica para matrícula
                },
              );
            },
          );
        },
      ),
    );
  }
}
