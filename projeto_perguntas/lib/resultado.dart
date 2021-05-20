import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int total;
  final void Function() reiniciar;
  Resultado(this.total, this.reiniciar);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Parabéns $total',
              style: TextStyle(fontSize: 28),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: reiniciar,
              child: const Text('Reiniciar?'),
            ),
          ],
        ),
      ),
    );
  }
}
