import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/user.dart';
import 'widgets/home.dart';
import 'widgets/esperando.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var userData = [];
  int? idu;

  Future<User> getData() async {
    var url = Uri.https('crizzvc.github.io', '/apps_Flutter/api.json');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      User dataa = User.fromRawJson(response.body);
      print('Contenido del JSON: ${response.body}');
      return dataa;
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
          future: getData(), 
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return esperando() ;
            } else if(snapshot.hasError){
              
              return Text('${snapshot.error}');
            } else {
              User data = snapshot.data!;

              return Home(user: data);
              // return esperando();
            }
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

