import 'package:dms_dealers/utils/app_utils.dart';
import 'package:dms_dealers/utils/custom_textForm_field.dart';
import 'package:dms_dealers/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController projectManagerController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController technologyController = TextEditingController();

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
                body:  Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            const Icon(Icons.arrow_back),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back'),
                            )
                          ],
                        ),
                        const SizedBox(height: 8,),
                        const Text('Employee Details',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Palanquin-Bold',
                              color: ColorResource.color171717),
                        ),
                        SizedBox(height: 10,),

                        Expanded(
                          child: Form(
                            key: _formKey,
                            child: ListView(
                              children:  [

                                const CustomTextStyle(text: 'Employee Name'),
                                CustomTextForm(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  hintText: '',
                                  labelText: '',
                                  controller: employeeNameController,
                                  validator: InputValidator.firstName,

                                ),

                                //Industry
                                const CustomTextStyle(text: 'Email Address'),
                                CustomTextForm(
                                  hintText: '',
                                  labelText: '',
                                  controller: emailAddressController,
                                  validator: InputValidator.email,

                                ),

                                //Technology
                                const CustomTextStyle(text: 'Phone Number'),
                                CustomTextForm(
                                  keyboardType: TextInputType.number,
                                  hintText: '',
                                  labelText: '',
                                  controller: phoneNumberController,
                                  validator: InputValidator.phoneNumber,

                                ),

                                const CustomTextStyle(text: 'Team'),
                                CustomTextForm(
                                  hintText: '',
                                  labelText: '',
                                  controller: teamController,
                                  suffixIcon: Icon(Icons.keyboard_arrow_down),

                                ),

                                const CustomTextStyle(text: 'Designation'),
                                CustomTextForm(
                                  hintText: '',
                                  labelText: '',
                                  controller: designationController,
                                  suffixIcon: const Icon(Icons.keyboard_arrow_down),

                                ),

                                const CustomTextStyle(text: 'Project Manager'),
                                CustomTextForm(
                                  hintText: '',
                                  labelText: '',
                                  validator: InputValidator.projectManager,
                                  controller: projectManagerController,
                                  // suffixIcon: Icon(Icons.keyboard_arrow_down),

                                ),

                                const CustomTextStyle(text: 'Industry'),
                                CustomTextForm(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  hintText: '',
                                  labelText: '',
                                  controller: industryController,
                                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                                  validator: InputValidator.industry,

                                ),

                                const CustomTextStyle(text: 'Technology'),
                                CustomTextForm(
                                  hintText: '',
                                  labelText: '',
                                  controller: technologyController,
                                  suffixIcon: const Icon(Icons.keyboard_arrow_down),

                                ),

                              ],
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                            child: CustomButton(
                              onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('new');
                            }
                            // Add your button onPressed logic here
                              },
                              text: 'Update',
                            ),
                        )


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