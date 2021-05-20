import 'package:flutter/material.dart';
import 'package:preferencias_app/src/widgets/MenuWidget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferecias de Usuarios'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundarior'),
          Divider(),
          Text('Genero'),
          Divider(),
          Text('Nombre de Usuario'),
          Divider(),
        ],
      ),
    );
  }

 
}
