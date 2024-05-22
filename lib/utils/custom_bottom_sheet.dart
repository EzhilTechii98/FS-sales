import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final List<String> data;

  CustomBottomSheet({required this.data});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  TextEditingController _searchController = TextEditingController();
  List<String> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(widget.data);
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = widget.data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child:  TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide()),
                    hintText: 'Search...',
                  ),
                  onChanged: _filterData,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),

          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredData[index]),
                  onTap: () {
                    // Add your onTap logic here
                    Navigator.pop(context, _filteredData[index]);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Add your button logic here
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}

