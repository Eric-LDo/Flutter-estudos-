// lib/screens/professor_home_screen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chamadinha/routes.dart';

class ProfessorHomeScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salas'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('salas').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var salas = snapshot.data!.docs;

          return ListView.builder(
            itemCount: salas.length,
            itemBuilder: (context, index) {
              var sala = salas[index];
              return ListTile(
                title: Text(sala['nome']),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.salaDetalhes,
                    arguments: sala.id,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
