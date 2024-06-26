import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchableCheckboxListDialog extends StatefulWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final Function(List<String>) onChanged;

  const SearchableCheckboxListDialog({
    Key? key,
    required this.options,
    required this.selectedOptions,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchableCheckboxListDialogState createState() => _SearchableCheckboxListDialogState();
}

class _SearchableCheckboxListDialogState extends State<SearchableCheckboxListDialog> {
  late List<String> _filteredOptions;

  @override
  void initState() {
    _filteredOptions = widget.options;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _filteredOptions = widget.options
                          .where((option) => option.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _filteredOptions = widget.options;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                for (String option in _filteredOptions)
                  CheckboxListTile(
                    title: Text(option),
                    value: widget.selectedOptions.contains(option),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          widget.selectedOptions.add(option);
                        } else {
                          widget.selectedOptions.remove(option);
                        }
                      });
                    },
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.onChanged(widget.selectedOptions);
              },
            ),
          ],
        );
      }
    );
  }
}
