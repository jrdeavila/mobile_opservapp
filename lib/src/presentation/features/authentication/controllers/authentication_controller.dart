import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@injectable
class LoginCtrl extends GetxController {
  late final _validatorService = getIt<IValidatorService>();
  final Rx<String?> _email = Rx<String?>(null);
  final Rx<String?> _password = Rx<String?>(null);
  final RxBool _rememberMe = RxBool(false);

  final RxMap<String, List> _errors = RxMap({});

  List<String> errors(String key) => _errors[key]?.cast<String>() ?? [];
  bool get rememberMe => _rememberMe.value;
  String? get email => _email.value;
  String? get password => _password.value;

  void setEmail(String value) => _email.value = value;
  void setPassword(String value) => _password.value = value;
  void setRememberMe(bool? value) => _rememberMe.value = value ?? false;

  @override
  void onReady() {
    super.onReady();
    _loadFromCache();

    _validatorService.onListen((p0) {
      _errors.value = p0;
    });
  }

  void _loadFromCache() {
    Future.delayed(1.seconds, () {
      getIt<CacheService>().read("rememberMe").then((value) {
        if (value == "1") {
          _rememberMe.value = true;
          getIt<CacheService>().read("email").then((value) {
            _email.value = value;
          });
          getIt<CacheService>().read("password").then((value) {
            _password.value = value;
          });
        }
      });
    });
  }

  void submit() {
    _validatorService.deleteErrors();

    if (_email.value == null || _email.value!.isEmpty) {
      _validatorService.saveErrors({
        "email": ["El correo electronico es requerido"],
        'password': ["La contraseña es requerida"]
      });
      return;
    }

    getIt<ILoginUseCase>()
        .login(
      LoginRequest(
        email: email!,
        password: password!,
      ),
    )
        .then((value) {
      if (rememberMe) {
        _saveOnCache();
      }
      Get.find<SessionController>().onLogin();
    });
  }

  void _saveOnCache() {
    getIt<CacheService>().save("email", _email.value!);
    getIt<CacheService>().save("password", _password.value!);
    getIt<CacheService>().save("rememberMe", _rememberMe.value ? "1" : "0");
  }

  void goToRegister() {
    Get.offAllNamed(registerRoute);
  }
}

class RegisterController extends GetxController {
  late final _validatorService = getIt<IValidatorService>();
  final Rx<String?> _name = Rx<String?>(null);
  final Rx<String?> _email = Rx<String?>(null);
  final Rx<String?> _password = Rx<String?>(null);
  final Rx<String?> _confirmPassword = Rx<String?>(null);

  final RxMap<String, List> _errors = RxMap({});

  List<String> errors(String key) => _errors[key]?.cast<String>() ?? [];
  String? get name => _name.value;
  String? get email => _email.value;
  String? get password => _password.value;
  String? get confirmPassword => _confirmPassword.value;

  void setName(String value) => _name.value = value;
  void setEmail(String value) => _email.value = value;
  void setPassword(String value) => _password.value = value;
  void setConfirmPassword(String value) => _confirmPassword.value = value;

  @override
  void onReady() {
    super.onReady();
    _validatorService.onListen((p0) {
      _errors.value = p0;
    });
  }

  void submit() {
    _validatorService.deleteErrors();

    if (_email.value == null ||
        _email.value!.isEmpty ||
        _password.value == null ||
        _password.value!.isEmpty ||
        _name.value == null ||
        _name.value!.isEmpty ||
        _confirmPassword.value == null ||
        _confirmPassword.value!.isEmpty) {
      return;
    }

    getIt<IRegisterUseCase>()
        .register(
      RegisterRequest(
        email: email!,
        password: password!,
        name: name!,
        confirmPassword: confirmPassword!,
      ),
    )
        .then((value) {
      Get.find<SessionController>().onRegiter();
    });
  }

  void goToLogin() {
    Get.offAllNamed(loginRoute);
  }
}
