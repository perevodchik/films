import 'package:flutter/cupertino.dart';

class EmptyResultMessage extends StatelessWidget {
  const EmptyResultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No results'));
  }
}
