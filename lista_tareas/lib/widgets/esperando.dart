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
          LoadingAnimationWidget.fourRotatingDots(color: Color.fromARGB(255, 255, 151, 54), size: 100),
          Text(''),
          Text('Cargando...', style: TextStyle(color: Colors.white,))
        ]
      )
    );
  }
}