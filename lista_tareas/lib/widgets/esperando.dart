import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class esperando extends StatelessWidget {
  const esperando({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.fourRotatingDots(color: Color.fromARGB(255, 54, 124, 255), size: 100),
          Text(''),
          Text('Cargando...', style: TextStyle(color: const Color.fromARGB(255, 121, 121, 121),))
        ]
      )
    );
  }
}