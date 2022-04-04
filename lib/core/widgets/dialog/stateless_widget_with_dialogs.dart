import 'package:flutter/material.dart';

class StatelessWidgetWithDialogs extends StatelessWidget {
  const StatelessWidgetWithDialogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showMyAlert(context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hello World')));
  }

  void hideDLoadingDialog(context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> showDLoadingDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      useRootNavigator: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Loading'),
                Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}