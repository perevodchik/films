part of '../home_view.dart';

class _SearchField extends StatefulWidget {
  const _SearchField({required this.onQueryChanged});

  final ValueChanged<String> onQueryChanged;

  @override
  State<StatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  late final Debounce _debounce;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _debounce = Debounce();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _debounce.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onQueryChanged,
      onSubmitted: _onSubmitted,
    );
  }

  void _onQueryChanged(String query) {
    if (query.length < 2) {
      return;
    }

    _debounce.run(() => widget.onQueryChanged(query));
  }

  void _onSubmitted(String query) {
    _debounce.stop();

    widget.onQueryChanged(query);
  }
}
