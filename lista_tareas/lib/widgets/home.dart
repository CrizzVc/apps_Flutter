import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: 450,
            height: 200,
            padding: EdgeInsets.all(20),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hola, Cris', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,)),
                Text('Contacto: user@gmail.com', style: TextStyle(fontSize: 16, color: Colors.white,)),
                Text('Saldo: 250.75', style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(255, 0, 80, 201),
            ),
          ),
    
          Text('Tareas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    
          Container(
            child:  Column(
              spacing: 20,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 450,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Icon(Icons.shopping_cart, color: Colors.white), 
                        decoration: BoxDecoration( 
                          border: Border.all(color: const Color.fromARGB(255, 195, 213, 243)),
                          color: const Color.fromARGB(255, 208, 220, 240),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('Comprar comida', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Alta prioridad', style: TextStyle(fontSize: 12, color: Colors.red)),
                        ]),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  width: 450,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  width: 450,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      );
  }
}
