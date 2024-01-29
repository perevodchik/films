import 'package:flutter/cupertino.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    this.error,
    super.key,
  });

  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${error ?? 'Something went wrong :('}'),
    );
  }
}
