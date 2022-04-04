import 'package:flutter/material.dart';

class DScaffoldBody extends StatelessWidget {
  final Function(String? searchValue)? onSearchChanged;
  final Widget child;
  final VoidCallback? onAddTapped;
  final VoidCallback? onRefreshTapped;
  final VoidCallback? onFilterTapped;
  const DScaffoldBody({Key? key, this.onSearchChanged, required this.child, this.onAddTapped, this.onRefreshTapped, this.onFilterTapped,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(color: Colors.transparent, height: 8.0,),
          Flexible(child: child),
        ],
      ),
    );
  }

  Widget _buildHeader(context){
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          _buildSearchBox(context),
          const Spacer(),
          ..._buildActionsButtons(),
        ],
      ),
    );
  }

  List<Widget> _buildActionsButtons(){
    return [
      IconButton(onPressed: onFilterTapped, icon: const Icon(Icons.filter_alt)),
      IconButton(onPressed: onRefreshTapped, icon: const Icon(Icons.refresh)),
      IconButton(onPressed: onAddTapped, icon: const Icon(Icons.add)),
    ];
  }

  Widget _buildSearchBox(context){
    return SizedBox(
      width: MediaQuery.of(context).size.width * (1/5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search',
          ),
          onChanged: onSearchChanged,
        ),
      ),
    );
  }
}
