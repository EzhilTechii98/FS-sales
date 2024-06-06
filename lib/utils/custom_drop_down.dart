import 'package:flutter/material.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CustomMultiSelectDropdown extends StatefulWidget {
  final List<ValueItem> options;
  final Function(List<ValueItem>) onOptionSelected;

  CustomMultiSelectDropdown({
    Key? key,
     required this.options,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  _CustomMultiSelectDropdownState createState() =>
      _CustomMultiSelectDropdownState();
}

class _CustomMultiSelectDropdownState extends State<CustomMultiSelectDropdown> {
  List<ValueItem> _selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MultiSelectDropDown(
          onOptionSelected: (selectedOptions) {
            setState(() {
              _selectedOptions = selectedOptions;
            });
          },
          options: widget.options,
          selectionType: SelectionType.multi,
          dropdownHeight: 300,
          optionTextStyle: TextStyle(fontSize: 16),
          selectedOptionIcon: Icon(Icons.check_circle),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onOptionSelected(_selectedOptions);
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Multi Select Dropdown Example'),
//         ),
//         body: MultiSelectDropdownExample(),
//       ),
//     );
//   }
// }
//
// class MultiSelectDropdownExample extends StatelessWidget {
//   final List<ValueItem> _options = [
//     ValueItem(label: 'Option 1', value: '1'),
//     ValueItem(label: 'Option 2', value: '2'),
//     ValueItem(label: 'Option 3', value: '3'),
//     ValueItem(label: 'Option 4', value: '4'),
//     ValueItem(label: 'Option 5', value: '5'),
//     ValueItem(label: 'Option 6', value: '6'),
//   ];
//
//   void _handleUpdate(List<ValueItem> selectedOptions) {
//     print('Selected options: $selectedOptions');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomMultiSelectDropdown(
//       options: _options,
//       onOptionSelected: _handleUpdate,
//     );
//   }
// }
