import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../locator/locator.dart';
import 'enms/snackbar_type.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.red,
    textColor: Colors.white,
    mainButtonTextColor: Colors.black,
  ));

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.blueAndYellow,
    config: SnackbarConfig(

      backgroundColor: Colors.blueAccent,
      textColor: Colors.yellow,
      borderRadius: 1,
      dismissDirection: DismissDirection.horizontal,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.greenAndRed,
    config: SnackbarConfig(
      backgroundColor: Colors.white,
      titleColor: Colors.green,
      messageColor: Colors.red,
      borderRadius: 1,
    ),
  );
}