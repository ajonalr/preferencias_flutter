import 'package:flutter/material.dart';
import 'package:preferencias_app/src/widgets/MenuWidget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorsecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        centerTitle: true,
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
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            onChanged: (value) {
              setState(() {
                _genero = value;
              });
            },
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: (value) {
              setState(() {
                _genero = value;
              });
            },
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
              onChanged: (value) {},
              controller: _textController,
            ),
          ),
        ],
      ),
    );
  }
}
