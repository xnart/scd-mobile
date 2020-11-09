import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {

  final Widget child;

  const FormCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
