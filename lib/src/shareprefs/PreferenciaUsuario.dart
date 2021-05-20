import 'package:preferencias_app/src/pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instance = new PreferenciasUsuario._();

  factory PreferenciasUsuario() {
    return _instance;
  }

  PreferenciasUsuario._();

  SharedPreferences _prefs;


  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }



  // GET

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('color') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('color', value);
  }

  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  get ultimaPantalla {
    return _prefs.getString('pantalla') ?? HomePage.routeName;
  }

  set ultimaPantalla(String value) {
    _prefs.setString('pantalla', value);
  }


}
