import 'package:flutter/material.dart';
import 'package:preferencias_app/src/shareprefs/PreferenciaUsuario.dart';
import 'package:preferencias_app/src/widgets/MenuWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorsecundario;
  int _genero;
  String _nombre = 'Pedro';
  final prefs = new PreferenciasUsuario();
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorsecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: prefs.nombre);
    prefs.ultimaPantalla = SettingsPage.routeName;
  }

  _setSelectedRadio(int valor) {
    setState(() {
      prefs.genero = valor;
      _genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        centerTitle: true,
        backgroundColor: (prefs.colorSecundario) ? Colors.cyan: Colors.blue,

      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Setting',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorsecundario,
            title: Text('Color Secundario'),
            onChanged: (value) {
              setState(() {
                _colorsecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre del Usuario',
              ),
              onChanged: (value) {
                prefs.nombre = value;
              },
              controller: _textController,
            ),
          ),
        ],
      ),
    );
  }
}
