import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Singleton(as: IValidatorService)
class CacheValidatorService implements IValidatorService {
  final Map<String, List> _errors = {};
  void Function(Map<String, List> value)? _listener;

  @override
  void deleteErrors() {
    _errors.clear();
    _listener?.call(_errors);
  }

  @override
  void saveErrors(Map<String, List> errors) {
    errors.addAll(errors);
    _listener?.call(errors);
  }

  @override
  void onListen(void Function(Map<String, List> value) listener) {
    _listener = listener;
    _listener!(_errors);
  }
}
