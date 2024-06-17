import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mobile_opservapp/lib.dart';

void handlerException(
  Object exception,
  StackTrace stack,
) {
  final handler = getIt<IHandlerExceptionService>();
  handler.handlerException(exception, stack);
  log("=================== Handler Exception ===================");
  if (kDebugMode) {
    print(exception);
  }
}
