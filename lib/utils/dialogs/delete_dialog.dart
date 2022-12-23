import 'package:flutter/material.dart';
import 'package:mynotes/utils/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(
  BuildContext context,
) {
  return showGenericDialog(
    context: context,
    title: 'Delete',
    content: 'Are you sure uou want to delete this item',
    optionBuilder: () => {
      'cancel': false,
      'Yes': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
