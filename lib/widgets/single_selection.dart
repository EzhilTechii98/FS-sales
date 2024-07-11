import 'package:flutter/material.dart';

class SingleSelectionDialog extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onChanged;

  const SingleSelectionDialog({
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select an option'),
      content: SingleChildScrollView(
        child: ListBody(
          children: options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedOption,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                  Navigator.of(context).pop();
                }
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
