import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../app_vendor/app_vendor_export.dart';

class DDataTableValue{
  final String columnName;
  final String value;
  const DDataTableValue(this.columnName, this.value,);
}

class DDataTable extends StatefulWidget {
  final int rowsPerPage;
  final List<ResponseEntity> data;
  final List<String> headerTitles;
  final List<DDataTableValue> Function(ResponseEntity entity) valueBuilder;
  final Function(String selectedId)? onDeleteTapped;
  final Function(String selectedId)? onRowSelected;
  final Function(String selectedId)? onEditTapped;
  const DDataTable({Key? key, this.rowsPerPage = 10, required this.data, required this.headerTitles, required this.valueBuilder, this.onDeleteTapped, this.onRowSelected, this.onEditTapped,}) : super(key: key);

  @override
  State<DDataTable> createState() => _DDataTableState();
}

class _DDataTableState extends State<DDataTable> {

  late DataGridSource sampleDataSource;

  @override
  void initState() {
    super.initState();

    sampleDataSource = EntityDataSource(
      allData: widget.data, rowsPerPage: widget.rowsPerPage,
      builder: (dataGridRow){
        return DataGridRow(
          cells: widget.valueBuilder(dataGridRow).map<DataGridCell>((e){
            final String columnName = e.columnName.replaceAll(' ', '');
            return DataGridCell(columnName: columnName.toLowerCase(), value: e.value);
          }).toList(),
        );
      }
    );

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SfDataGridTheme(
              data: SfDataGridThemeData(
                headerColor: const Color(0xff009889),
              ),
              child: SfDataGrid(
                source: sampleDataSource,
                columnWidthMode: ColumnWidthMode.fill,
                allowPullToRefresh: true,
                allowSorting: true,
                onSelectionChanging:
                    (List<DataGridRow> a, List<DataGridRow>? b) {
                  if(widget.onRowSelected != null){
                    final String selectedId =
                        a.first.getCells().first.value;
                    widget.onRowSelected!(selectedId);
                  }
                  return false;
                },
                selectionMode: SelectionMode.single,
                allowSwiping: true,
                onSwipeStart: (DataGridSwipeStartDetails? d) {
                  final bool swipeRightToLeft = d!.swipeDirection ==
                      DataGridRowSwipeDirection.startToEnd;
                  if (swipeRightToLeft) {
                    return false; //disable swipe right to left
                  }
                  return true;
                },
                swipeMaxOffset: 100,
                endSwipeActionsBuilder:
                    (BuildContext context, DataGridRow dgr, int index) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if(widget.onDeleteTapped == null){
                              return;
                            }
                            final String selectedId =
                                dgr.getCells().first.value;
                            widget.onDeleteTapped!(selectedId);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if(widget.onEditTapped == null){
                              return;
                            }
                            final String selectedId =
                                dgr.getCells().first.value;
                            widget.onEditTapped!(selectedId);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                highlightRowOnHover: true,
                tableSummaryRows: [
                  GridTableSummaryRow(
                    showSummaryInRow: false,
                    columns: [
                      const GridSummaryColumn(
                          name: 'Id',
                          columnName: 'id',
                          summaryType: GridSummaryType.count)
                    ],
                    position: GridTableSummaryRowPosition.bottom,
                  )
                ],
                shrinkWrapRows: true,
                //dynamic height
                columns: widget.headerTitles.map<GridColumn>((e) {
                  final String columnName = e.replaceAll(' ', '');
                  return GridColumn(
                    visible: columnName.toLowerCase() == 'id' ? false : true,
                    columnName: columnName.toLowerCase(),
                    label: Container(
                      alignment: Alignment.center,
                      child: Text(e, style: const TextStyle(overflow: TextOverflow.ellipsis,),),
                    ),
                  );
                }).toList(),
                // columns: <GridColumn>[
                //   GridColumn(
                //     visible: false,
                //     columnName: 'id',
                //     label: Container(
                //       alignment: Alignment.center,
                //       child: const Text('Id', style: TextStyle(overflow: TextOverflow.ellipsis,),),
                //     ),
                //   ),
                //   GridColumn(
                //     columnName: 'code',
                //     label: Container(
                //       alignment: Alignment.center,
                //       child: const Text('Code', style: TextStyle(overflow: TextOverflow.ellipsis,),),
                //     ),
                //   ),
                //   GridColumn(
                //     columnName: 'createdDate',
                //     label: Container(
                //       alignment: Alignment.center,
                //       child: const Text('Created Date', style: TextStyle(overflow: TextOverflow.ellipsis,),),
                //     ),
                //   ),
                //   GridColumn(
                //     columnName: 'modifiedDate',
                //     label: Container(
                //       alignment: Alignment.center,
                //       child: const Text('Modified Date', style: TextStyle(overflow: TextOverflow.ellipsis,),),
                //     ),
                //   ),
                // ],
              ),
            ),
            SfDataPager(
              pageCount: _roundUp(widget.data.length / widget.rowsPerPage),
              delegate: sampleDataSource,
            ),
          ],
        ),
      ),
    );
  }

  double _roundUp(double value) {
    return value.ceil().toDouble();
  }
}


class EntityDataSource extends DataGridSource {
  final List<ResponseEntity> _allData;
  late List<ResponseEntity> _paginatedData;
  final int _rowsPerPage;
  final DataGridRow Function(ResponseEntity entity) builder;

  EntityDataSource({
    required List<ResponseEntity> allData,
    required int rowsPerPage,
    required this.builder,
  })  : _allData = allData,
        _rowsPerPage = rowsPerPage {
    if (_rowsPerPage < _allData.length) {
      _paginatedData =
          _allData.getRange(0, _rowsPerPage).toList(growable: false);
    } else {
      _paginatedData =
          _allData.getRange(0, _allData.length).toList(growable: false);
    }
    _buildPaginatedDataGridRows();
  }

  late List<DataGridRow> _dataGridRows;

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row
          .getCells()
          .map<Widget>(
            (e) => Container(
          alignment: Alignment.center,
          child: Text(e.value),
        ),
      )
          .toList(),
    );
  }

  //handle pull to refresh method
  @override
  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Loaded More');
    notifyListeners();
  }

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Text('$summaryValue results'),
    );
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    if (startIndex < _allData.length) {
      if (endIndex <= _allData.length) {
        _paginatedData =
            _allData.getRange(startIndex, endIndex).toList(growable: false);
      } else {
        _paginatedData = _allData
            .getRange(startIndex, _allData.length)
            .toList(growable: false);
      }
      _buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      _paginatedData = [];
    }
    return true;
  }

  void _buildPaginatedDataGridRows() {
    _dataGridRows = _paginatedData.map<DataGridRow>((dataGridRow) {
      return builder(dataGridRow);
      // final Item entity = dataGridRow as Item;
      // return DataGridRow(
      //   cells: [
      //     DataGridCell(
      //       columnName: 'id',
      //       value: entity.id,
      //     ),
      //     DataGridCell(
      //       columnName: 'code',
      //       value: entity.code,
      //     ),
      //     DataGridCell(
      //       columnName: 'createddate',
      //       value: entity.createdDate.toString(),
      //     ),
      //     DataGridCell(
      //       columnName: 'modifieddate',
      //       value: entity.modifiedDate.toString(),
      //     ),
      //   ],
      // );
    }).toList(growable: false);
  }
}