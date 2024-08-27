// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor = Colors.white,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // Se `width` for nulo, o botão ocupará toda a largura disponível
      height: height ?? 50.0, // Altura padrão do botão é 50
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: color ?? Theme.of(context).primaryColor, // Cor do texto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Borda arredondada
          ),
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
