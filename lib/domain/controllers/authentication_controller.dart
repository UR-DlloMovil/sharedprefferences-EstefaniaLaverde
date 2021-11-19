import 'package:get/get.dart';
import 'package:f_authentication_template/data/repositories/local_preferences.dart';

class AuthenticationController extends GetxController {
  LocalPreferences lp = LocalPreferences();

  var _logged = false.obs; //Comienzo en falso para mostrar la página de login

  bool get logged => _logged.value;

  void setLogged(bool l) {
    _logged.value = l;
    update();
  }

  AuthenticationController() {
    init();
  }

  void init() async {
    //Lo que hace al inicial el controlador
    _logged.value = await lp.retrieveData("logged") ?? false;
    setLogged(false);
  }

  Future<bool> registerUser(String user, String pass) async {
    //Guardo la info en SP
    await lp.storeData("email", user);
    await lp.storeData("password", pass);

    //Retorno true para saber que si se registro
    return Future.value(true);
  }

  Future<bool> login(user, password) async {
    String userT = await lp.retrieveData("email") ?? "";
    String passwordT = await lp.retrieveData("password") ?? "";

    //Verificar si ya esta guardado el usuario
    if (userT == user && passwordT == password) {
      await lp.storeData("logged", true);
      setLogged(true);
    } else {
      await lp.storeData("logged", false);
      setLogged(false);
    }

    return Future.value(_logged.value);
  }

  Future<bool> signup(user, password) async {
    String userT = await lp.retrieveData("email") ?? "";

    //Miro si el usuario ya se guardó
    if (userT != user) {
      await registerUser(user, password);
      return Future.value(true);
    }

    return Future.value(false);
  }

  Future<bool> logout() async {
    await lp.storeData("logged", false);

    //Cambio el estado de logged para volver a login
    setLogged(false);
    return Future.value(true);
  }
}
