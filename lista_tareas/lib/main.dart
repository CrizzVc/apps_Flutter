import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
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

  Future<User> getData() async{
    var url = Uri.https('nekos.best','/api/v2/neko');
    var response = await http.get(url);
    if(response.statusCode == 200){
      User dataa = User(response.body);
      return dataa;
    }else{
      throw Exception('error al cargar los datos');
    }
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/userData.json');
    // print('Contenido del JSON: $response');
    final jsonLocal = await json.decode(response);
    setState(() {
      userData = jsonLocal['items'];
    });

  }

  // Future<User> getInfo() async {
  //   final response = await Dio().get('https://jsonplaceholder.typicode.com/users/${idu}');
  //   var data = response.data;
  //   User userInfo = new User(data);
  //   return userInfo;
  // }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<User>(
          future: getData(), 
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return esperando() ;
            } else if(snapshot.hasError){
              
              return Text('${snapshot.error}');
            } else {
              User data = snapshot.data!;
              final _screens = [
                home(),
                // Page2(data: multiData),
                // page5(data: userData),
                // page3(),
                // page4(),
                
              ];
              
              return _screens[1];
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

