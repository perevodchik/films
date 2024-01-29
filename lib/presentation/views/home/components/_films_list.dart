part of '../home_view.dart';

class _FilmsList extends StatefulWidget {
  const _FilmsList(this.films);

  final List<FilmListItem> films;

  @override
  State<StatefulWidget> createState() => _FilmsListState();
}

class _FilmsListState extends State<_FilmsList> {
  _FilmsDataSource? _dataSource;

  @override
  void initState() {
    super.initState();

    _dataSource = _FilmsDataSource(
      films: widget.films,
      onFilmSelected: _onFilmSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.films.isEmpty || _dataSource == null) {
      return const EmptyResultMessage();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: PaginatedDataTable(
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('Poster')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Description')),
        ],
        columnSpacing: 16,
        dataRowMaxHeight: 100,
        horizontalMargin: 16,
        source: _dataSource!,
      ),
    );
  }

  void _onFilmSelected(FilmListItem film) {
    context.push(Routes.film.path(args: ['${film.id}']));
  }
}

class _FilmsDataSource extends DataTableSource {
  _FilmsDataSource({
    required this.films,
    required this.onFilmSelected,
  });

  final List<FilmListItem> films;
  final ValueChanged<FilmListItem> onFilmSelected;

  @override
  int get rowCount => films.length;

  @override
  DataRow? getRow(int index) {
    if (index >= films.length) {
      return null;
    }

    return _buildDataRow(films[index]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  DataRow _buildDataRow(FilmListItem film) {
    return DataRow(
      onSelectChanged: (_) {
        onFilmSelected(film);
      },
      cells: [
        DataCell(
          film.posterUrl == null
              ? const Placeholder(fallbackWidth: 75)
              : Image.network(
                  film.posterUrl!,
                  width: 75,
                ),
        ),
        DataCell(
          SizedBox(
            width: 75,
            child: _FilmsTableCellText(film.name),
          ),
        ),
        DataCell(
          SizedBox(
            width: 200,
            child: _FilmsTableCellText(film.descriptions),
          ),
        ),
      ],
    );
  }
}
