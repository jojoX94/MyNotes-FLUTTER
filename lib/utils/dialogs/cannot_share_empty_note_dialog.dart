import 'package:flutter/cupertino.dart';
import 'package:mynotes/utils/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Sharing',
    content: 'You cannot share a empty note!',
    optionBuilder: () => {
      'OK': null,
    },
  );
}
