import 'package:flutter/material.dart';

class ConfirmDialog {
  BuildContext context;
  String title, body;
  Function onConfirmed;

  ConfirmDialog(this.context, this.title, this.body, this.onConfirmed) {
    showDialog(
      context: context,
      builder: (BuildContext mContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(mContext, 'No'),
                child: const Text('No')),
            TextButton(
              onPressed: () {
                onConfirmed();
                Navigator.pop(mContext, 'Yes');
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
