// import 'dart:js_interop';

import 'package:flutter/material.dart';

class FiltersWidget extends StatefulWidget {
  // final String name;
  final String title;
  final String subtitle;

  final bool initialState;
  final Function(bool newValue) valueOnChange;

  const FiltersWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.initialState,
      required this.valueOnChange});

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  var _filterSet = false;

  @override
  void initState() {
    super.initState();
    _filterSet = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _filterSet,
      onChanged: (isChecked) {
        widget.valueOnChange(isChecked);
        setState(() {
          _filterSet = isChecked;
        });
      },
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

//for line 51
//Here i cant access title directly bcz of diff class so in
// statefull widget there is a rule that we can access above variable by
// widget.title ==> writing like this
