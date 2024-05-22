

import 'package:dms_dealers/utils/appBar.dart';
import 'package:dms_dealers/utils/app_utils.dart';
import 'package:dms_dealers/utils/custom_bottom_sheet.dart';
import 'package:dms_dealers/utils/custom_textForm_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import '../../utils/custom_button.dart';
import 'employee_detail_bloc.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen({Key? key}) : super(key: key);

  @override
  _EmployeeDetailsScreenState createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  late EmployeeDetailsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<EmployeeDetailsBloc>(context);

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {},
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is InitialState) {
              return const Center(
                child: Text(''),
              );
            } else if (state is SuccessState) {

            }
            return  SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(
                  title: "Employee Details",
                  actions: const [

                    Icon(Icons.edit_rounded),
                    SizedBox(width: 20,),
                  ],
                ),
                body:  SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // employee name
                        CustomTextStyle(text: 'Employee Name'),
                        CustomTextForm(
                          hintText: '',
                          labelText: '',
                        ),

                        // email address
                        CustomTextStyle(text: 'Email Address'),
                        CustomTextForm(
                          hintText: '',
                          labelText: '',

                        ),

                        //phone number
                        CustomTextStyle(text: 'Phone Number'),
                        CustomTextForm(
                          keyboardType: TextInputType.number,
                          hintText: '',
                          labelText: '',

                        ),

                        // team
                        CustomTextStyle(text: 'Team'),
                        CustomTextForm(
                          hintText: '',
                          labelText: '',

                        ),

                        //Designation
                        CustomTextStyle(text: 'Designation'),
                        CustomTextForm(
                          hintText: '',
                          labelText: '',
                        ),

                        //Reporting manager
                        CustomTextStyle(text: 'Reporting manager'),
                        CustomTextForm(
                          hintText: '',
                          labelText: '',
                        ),
                        //industry

                        CustomButton(
                          text: 'Select Industry',
                          onPressed: () {
                            final List<String> dynamicData = ['Item 1', 'Item 2', 'Item 3']; // Your dynamic data here
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomBottomSheet(data: dynamicData);
                              },
                            );
                            print('Button clicked');
                          },
                          buttonColor: Colors.purple,
                          // Customize button color
                          textColor: Colors.white,
                          // Customize text color
                          fontSize: 14.0, // Customize font size
                        ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Chip(
                          label: Text('Health'),
                          backgroundColor: Colors.deepOrangeAccent.shade100,
                        ),
                        SizedBox(width: 10), // Space between the chips
                        Chip(
                          label: Text('Manufacture'),
                          backgroundColor: Colors.deepOrangeAccent.shade100,
                        ),
                      ],
                    ),

                        //Technology
                        CustomButton(
                          text: 'Select Technology',
                          onPressed: () {
                            final List<String> dynamicData = ['Item 1', 'Item 2', 'Item 3']; // Your dynamic data here
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomBottomSheet(data: dynamicData);
                              },
                            );
                            print('Button clicked');
                          },
                          buttonColor: Colors.purple,
                          // Customize button color
                          textColor: Colors.white,
                          // Customize text color
                          fontSize: 14.0, // Customize font size
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Chip(
                              label: Text('Android'),
                              backgroundColor: Colors.greenAccent.shade200,
                            ),
                            SizedBox(width: 10), // Space between the chips
                            Chip(
                              label: Text('ios'),
                              backgroundColor: Colors.greenAccent.shade200,
                            ),
                          ],
                        ),

                        SizedBox(height: 20,),

                        CustomButton(
                          text: 'Update',
                          onPressed: () {
                            final List<String> dynamicData = ['Item 1', 'Item 2', 'Item 3']; // Your dynamic data here
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomBottomSheet(data: dynamicData);
                              },
                            );
                            print('Button clicked');
                          },
                          buttonColor: Colors.purple,
                          // Customize button color
                          textColor: Colors.white,
                          // Customize text color
                          fontSize: 14.0, // Customize font size
                        ),

                      ],
                    ),
                  ),
                )
              ),
            );
          }),
    );
  }
}