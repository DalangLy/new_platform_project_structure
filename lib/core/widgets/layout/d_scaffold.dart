import 'package:flutter/material.dart';

class DScaffold extends StatelessWidget {
  final Widget body;
  final List<DBreadCrumb> breadCrumbs;
  final VoidCallback? onBackTapped;
  const DScaffold({Key? key, required this.body, this.breadCrumbs = const [], this.onBackTapped,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CustomScaffold(
      appBar: _CustomAppBar(breadCrumbs: breadCrumbs, onBackTapped: onBackTapped,),
      body: body,
    );
  }
}

class DBreadCrumb{
  final String title;
  final VoidCallback? onTapped;
  const DBreadCrumb({required this.title, this.onTapped,});
}

class _CustomScaffold extends StatelessWidget {
  final _CustomAppBar appBar;
  final Widget body;
  const _CustomScaffold({Key? key, required this.appBar, required this.body,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar,
          Expanded(child: body,),
        ],
      ),
    );
  }
}


class _CustomAppBar extends StatefulWidget {
  final List<DBreadCrumb> breadCrumbs;
  final VoidCallback? onBackTapped;
  const _CustomAppBar({Key? key, required this.breadCrumbs, this.onBackTapped,}) : super(key: key);

  @override
  State<_CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<_CustomAppBar> {
  final List<Widget> _breadCrumbs = [];
  @override
  void initState() {
    super.initState();

    for (var element in widget.breadCrumbs) {
      final bool isLast = widget.breadCrumbs.indexOf(element) == (widget.breadCrumbs.length - 1);
      if(isLast){
        _breadCrumbs.add(_DBreadCrumbItem(title: element.title, onTapped: element.onTapped,));
      }
      else {
        _breadCrumbs.add(_DBreadCrumbItem(title: element.title, onTapped: element.onTapped,));
        const Text(' / ');
      }
    }

    //refresh ui
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if(widget.onBackTapped == null){
            return Row(
              children: _breadCrumbs
            );
          }
          else {
            return Row(
              children: [
                _buildBackButton(),
                ..._breadCrumbs,
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildBackButton(){
    return Tooltip(
      message: 'Back',
      child: IconButton(
        onPressed: widget.onBackTapped,
        icon: const Icon(Icons.chevron_left,),
      ),
    );
  }
}

class _DBreadCrumbItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTapped;
  const _DBreadCrumbItem({Key? key, required this.title, this.onTapped,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 50,
        maxWidth: 120,
      ),
      child: Tooltip(
        message: title,
        child: TextButton(
          onPressed: onTapped,
          child: Text(title, overflow: TextOverflow.ellipsis, maxLines: 1,),
        ),
      ),
    );
  }
}

