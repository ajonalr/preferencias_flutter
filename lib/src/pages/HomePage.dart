import 'package:flutter/material.dart';
import 'package:preferencias_app/src/shareprefs/PreferenciaUsuario.dart';
import 'package:preferencias_app/src/widgets/MenuWidget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    prefs.ultimaPantalla = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferecias de Usuarios'),
        backgroundColor: (prefs.colorSecundario) ? Colors.cyan: Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundarior: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de Usuario: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
