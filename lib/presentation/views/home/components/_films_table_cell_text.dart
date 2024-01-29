part of '../home_view.dart';

class _FilmsTableCellText extends StatelessWidget {
  const _FilmsTableCellText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
