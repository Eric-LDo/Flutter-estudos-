// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:camera/camera.dart';
import 'package:intl/intl.dart';

class SalaDetalhesScreen extends StatefulWidget {
  @override
  _SalaDetalhesScreenState createState() => _SalaDetalhesScreenState();
}

class _SalaDetalhesScreenState extends State<SalaDetalhesScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _selecionarHorario(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null && time != _selectedTime) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  void _fazerChamada() {
    // Lógica para fazer a chamada manualmente
  }

  void _reconhecimentoFacial() async {
    // Lógica para reconhecimento facial usando a câmera
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final salaId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Sala'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Horário Selecionado: ${_selectedTime.format(context)}'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selecionarHorario(context),
              child: Text('Selecionar Horário'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fazerChamada,
              child: Text('Fazer Chamada'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _reconhecimentoFacial,
              child: Text('Chamada pelo Reconhecimento Facial'),
            ),
            // Mais widgets aqui para exibir a lista de alunos e enviar a chamada
          ],
        ),
      ),
    );
  }
}