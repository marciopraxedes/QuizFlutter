import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int total;

  Resultado(this.total);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Parabéns $total',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
