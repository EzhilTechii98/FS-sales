import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/sqlite/employee_sqlite_db.dart';
import 'package:dms_dealers/utils/app_utils.dart';
import 'package:dms_dealers/utils/base_textForm_field.dart';
import 'package:dms_dealers/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../base/base_state.dart';
import '../../main.dart';
import '../../utils/base_search_field.dart';
import '../../utils/color_resources.dart';
import '../../utils/base_button.dart';
import 'employee_detail_bloc.dart';
import 'employee_detail_event.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen({Key? key}) : super(key: key);

  @override
  _EmployeeDetailsScreenState createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  late EmployeeDetailsBloc bloc;
  final _formKey = GlobalKey<FormState>();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController projectManagerController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController technologyController = TextEditingController();

  bool _isChecked = false;



  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<EmployeeDetailsBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        if (state is SuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.successResponse)),
          );
          Navigator.pop(context);
         Navigator.pushNamed(context, AppRoutes.employeeList);
        } else if (state is FailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }

      },
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is InitialState) {
              return const Center(
                child: Text(''),
              );
            } else if (state is SuccessState) {

            }
            return SafeArea(
              child: Scaffold(
                  body: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Icon(Icons.arrow_back),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Employee Details',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Palanquin-Bold',
                            color: ColorResource.color171717),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: [
                              const Center(
                                child: CircleAvatar(
                                  radius: 40.0,
                                  backgroundColor: Colors.grey,
                                  child: Icon(
                                    Icons.person,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const CustomTextStyle(text: 'Employee Name'),
                              CustomTextForm(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                controller: employeeNameController,
                                validator: InputValidator.firstName,
                                inputFormatter: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z]')),
                                  // Allow only alphabetic characters
                                ],
                              ),

                              //Industry
                              const CustomTextStyle(text: 'Email Address'),
                              CustomTextForm(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                controller: emailAddressController,
                                validator: InputValidator.email,
                              ),

                              //Technology
                              const CustomTextStyle(text: 'Phone Number'),
                              CustomTextForm(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                hintText: '',
                                labelText: '',
                                controller: phoneNumberController,
                                validator: InputValidator.phoneNumber,
                                inputFormatter: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  // Allow only digits
                                ],
                              ),

                              const CustomTextStyle(text: 'Team'),
                              CustomTextForm(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: true,
                                onTap: () {
                                  List<String> _selectedOptions = [];
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SearchableCheckboxListDialog(
                                          options: const ['Mobile', 'React', 'backend'],
                                          selectedOptions: _selectedOptions,
                                          onChanged: (List<String> selectedOptions) {
                                            setState(() {
                                              _selectedOptions = selectedOptions;
                                              teamController.text = _selectedOptions.join(', ');
                                            });
                                          },
                                        );
                                      },
                                    );

                                },
                                hintText: '',
                                labelText: '',
                                controller: teamController,
                                validator: InputValidator.team,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),

                              ),

                              const CustomTextStyle(text: 'Designation'),
                              CustomTextForm(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: true,
                                validator: InputValidator.designation,
                                onTap: () {
                                  List<String> _selectedOptions = [];
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SearchableCheckboxListDialog(
                                        options: const ['Software', 'AssociateSoftware', 'Tech Lead',
                                        'Architect'
                                        ],
                                        selectedOptions: _selectedOptions,
                                        onChanged: (List<String> selectedOptions) {
                                          setState(() {
                                            _selectedOptions = selectedOptions;
                                            designationController.text = _selectedOptions.join(', ');
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                hintText: '',
                                labelText: '',
                                controller: designationController,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                              ),

                              const CustomTextStyle(text: 'Project Manager'),
                              CustomTextForm(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                validator: InputValidator.firstName,
                                controller: projectManagerController,
                                // suffixIcon: Icon(Icons.keyboard_arrow_down),
                              ),

                              const CustomTextStyle(text: 'Industry'),
                              CustomTextForm(
                                readOnly: true,
                                validator:InputValidator.industries,
                                onTap: () {
                                  List<String> _selectedOptions = [];
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SearchableCheckboxListDialog(
                                        options: const ['Finance', 'Marketing', 'E-commerce',
                                          'health care'
                                        ],
                                        selectedOptions: _selectedOptions,
                                        onChanged: (List<String> selectedOptions) {
                                          setState(() {
                                            _selectedOptions = selectedOptions;
                                            industryController.text = _selectedOptions.join(', ');
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                controller: industryController,
                                suffixIcon: const Icon(Icons.keyboard_arrow_down),

                              ),

                              const CustomTextStyle(text: 'Technology'),
                              CustomTextForm(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: true,
                                validator: InputValidator.technology,
                                onTap: () {
                                  List<String> _selectedOptions = [];
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SearchableCheckboxListDialog(
                                        options: const ['xamarin', 'android', 'iOS',
                                          'flutter', 'kotlin'
                                        ],
                                        selectedOptions: _selectedOptions,
                                        onChanged: (List<String> selectedOptions) {
                                          setState(() {
                                            _selectedOptions = selectedOptions;
                                            technologyController.text = _selectedOptions.join(', ');
                                          });
                                        },
                                      );
                                    },
                                  );
                                },

                                hintText: '',
                                labelText: '',
                                controller: technologyController,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                              ),
                              CheckboxListTile(
                                title: Text('isAllocated'),
                                value: _isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _isChecked = newValue!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading, // checkbox position
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print(teamController.text);
                                print(designationController.text);
                                print(industryController.text);

                                bloc.add(
                                  SaveEmployeeDetailsEvent(
                                    employeeName: employeeNameController.text,
                                    emailAddress: emailAddressController.text,
                                    phoneNumber: phoneNumberController.text,
                                    team: teamController.text,
                                    designation: designationController.text,
                                    projectManager: projectManagerController.text,
                                    industry: industryController.text,
                                    technology: technologyController.text,
                                    allocated: _isChecked

                                  ),
                                );
                              }
                            },
                            text: 'Update',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            );
          }),
    );
  }
}
