import 'package:flutter/material.dart';
import 'package:mynotes/utils/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String title) {
  return showGenericDialog(
    context: context,
    title: title,
    content: 'A errer occured',
    optionBuilder: () => {
      'OK': null,
    },
  );
}
