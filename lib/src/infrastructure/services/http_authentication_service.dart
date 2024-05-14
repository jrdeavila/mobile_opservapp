import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: IAuthenticationService)
class HttpAuthenticationService implements IAuthenticationService {
  final IHttpClient _httpClient;

  HttpAuthenticationService(this._httpClient);

  @override
  Future<User> getUser() {
    return _httpClient.post("/a/client/me").then(
          (value) => userFromJSON(value),
        );
  }

  @override
  Future<String> login(String email, String password) {
    return _httpClient.post(
      "/a/client/login",
      data: {
        "email": email,
        "password": password,
      },
    ).then(
      (value) => value["access_token"],
    );
  }

  @override
  Future<void> logout() {
    return _httpClient.post("/a/client/logout");
  }

  @override
  Future<String> refreshToken() {
    return _httpClient.post("/a/client/refresh-token").then(
          (value) => value["access_token"],
        );
  }

  @override
  Future<String> register(
      String name, String email, String password, String confirmPassword) {
    return _httpClient.post(
      "/a/client/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      },
    ).then(
      (value) => value["access_token"],
    );
  }
}
