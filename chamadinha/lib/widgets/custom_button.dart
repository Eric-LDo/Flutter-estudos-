import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Faz o botão ocupar toda a largura disponível
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, 
          backgroundColor: color, // Cor do texto do botão
          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding vertical
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}