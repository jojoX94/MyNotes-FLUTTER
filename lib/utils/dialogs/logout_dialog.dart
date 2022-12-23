import 'package:flutter/material.dart';
import 'package:mynotes/utils/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(
  BuildContext context,
) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log Out',
    content: 'Are you sure to want Log Out?',
    optionBuilder: () => {'Cancel': false, 'LogOut': true},
  ).then(
    (value) => value ?? false,
  );
}
