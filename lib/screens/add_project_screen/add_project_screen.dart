
import 'package:dms_dealers/model/project_model.dart';
import 'package:dms_dealers/screens/add_project_screen/add_project_event.dart';
import 'package:dms_dealers/widgets/singleTon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../base/base_state.dart';
import '../../main.dart';
import '../../router.dart';
import '../../sqlite/project_sqlite_db.dart';
import '../../utils/app_utils.dart';
import '../../utils/base_search_field.dart';
import '../../utils/color_resources.dart';
import '../../utils/base_button.dart';
import '../../utils/base_textForm_field.dart';
import '../../utils/validation.dart';
import 'add_project_bloc.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  late AddProjectBloc bloc;
  TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();

  TextEditingController projectNameController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController technologyController = TextEditingController();
  TextEditingController projectManagerController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientEmailController = TextEditingController();
  TextEditingController clientPhoneController = TextEditingController();
   int _selectedId = 0;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AddProjectBloc>(context);

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        if (state is SuccessState) {
          if(state.successResponse is ProjectListModel) {
            projectNameController.text = bloc.getProjectList!.projectName;
            industryController.text = bloc.getProjectList!.industry;
            technologyController.text = bloc.getProjectList!.technology;
            projectManagerController.text = bloc.getProjectList!.projectManager;
            clientNameController.text = bloc.getProjectList!.clientName;
            clientPhoneController.text = bloc.getProjectList!.clientPhoneNo;
            clientEmailController.text = bloc.getProjectList!.clientEmail;
            _selectedId = bloc.getProjectList!.id;
          } else if( state is String) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.successResponse)),
            );
            Navigator.pushNamed(context, AppRoutes.projects);
          }
        }

        else if (state is FailureState) {
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
                      const Text('Project Details',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Palanquin-Bold',
                            color: ColorResource.color171717),
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: [
                              // const Center(
                              //   child: CircleAvatar(
                              //     radius: 40.0,
                              //     backgroundColor: Colors.grey,
                              //     child: Icon(
                              //       Icons.person,
                              //       size: 40.0,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // ),

                              const CustomTextStyle(text: 'Project Name'),
                               CustomTextForm(
                                controller: projectNameController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                validator: InputValidator.projectName,
                              ),

                              //Industry
                              const CustomTextStyle(text: 'Industry'),
                              CustomTextForm(
                                controller: industryController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: true,
                                validator: InputValidator.industries,
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
                                hintText: '',
                                labelText: '',
                                suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              ),

                              //Technology
                              const CustomTextStyle(text: 'Technology'),
                               CustomTextForm(
                                 controller: technologyController,
                                 validator: InputValidator.technology,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                readOnly: true,
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
                                suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              ),

                              const CustomTextStyle(text: 'Project Manager'),
                               CustomTextForm(
                                controller: projectManagerController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                validator: InputValidator.projectManager,
                              ),

                              const CustomTextStyle(text: 'Client Name'),
                               CustomTextForm(
                                 controller: clientNameController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                validator:  InputValidator.clientName,
                              ),

                              const CustomTextStyle(text: 'Client Email Address'),
                               CustomTextForm(
                                controller: clientEmailController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                validator: InputValidator.clientEmail,

                              ),

                              const CustomTextStyle(text: 'Client Phone Number'),
                               CustomTextForm(
                                controller: clientPhoneController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                hintText: '',
                                labelText: '',
                                keyboardType: TextInputType.number,
                                validator: InputValidator.phoneNumber,
                              ),

                              // const CustomTextStyle(text: 'Add Employee'),
                              // CustomTextForm(
                              //   controller: employeeController,
                              //   validator: InputValidator.technology,
                              //   autovalidateMode: AutovalidateMode.onUserInteraction,
                              //   readOnly: true,
                              //   onTap: () {
                              //     List<String> _selectedOptions = [];
                              //     showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return SearchableCheckboxListDialog(
                              //           options: const ['Vasanth', 'parmod', 'main',
                              //             'sukesh', 'asif'
                              //           ],
                              //           selectedOptions: _selectedOptions,
                              //           onChanged: (List<String> selectedOptions) {
                              //             setState(() {
                              //               _selectedOptions = selectedOptions;
                              //               employeeController.text = _selectedOptions.join(', ');
                              //             });
                              //           },
                              //         );
                              //       },
                              //     );
                              //   },
                              //   hintText: '',
                              //   labelText: '',
                              //   suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              // ),

                              // CustomTextForm(
                              //   controller: employeeController,
                              //   autovalidateMode: AutovalidateMode.onUserInteraction,
                              //   hintText: '',
                              //   labelText: '',
                              //   keyboardType: TextInputType.text,
                              //   validator: InputValidator.firstName,
                              // )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {

                                if(MFRIFlashSingleton.instance.isProjectUpdate == true) {

                                  Map<String, dynamic> row = {
                                    DatabaseHelper2.columnId : _selectedId,
                                    DatabaseHelper2.projectName: projectNameController.text,
                                    DatabaseHelper2.projectIndustry: industryController.text,
                                    DatabaseHelper2.projectTechnology: technologyController.text,
                                    DatabaseHelper2.projectManager: projectManagerController.text,
                                    DatabaseHelper2.projectClientName: clientNameController.text,
                                    DatabaseHelper2.projectClientEmail: clientEmailController.text,
                                    DatabaseHelper2.projectClientPhone: clientPhoneController.text,
                                  };
                                  final result = await dbHelper2.updateProjectDetails(
                                      row, DatabaseHelper2.projectDetailsTable);

                                  print('----------- UPDATE EMPLOYEE');

                                  if (result > 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Project details Updated')),
                                    );
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, AppRoutes.projects);
                                  }
                                } else {
                                  print(projectManagerController.text);
                                  print(clientEmailController.text);
                                  bloc.add(
                                    SaveProjectDetailsEvent(
                                      projectName: projectNameController.text,
                                      industry: industryController.text,
                                      technology: technologyController.text,
                                      projectManager: projectManagerController.text,
                                      clientName: clientNameController.text,
                                      clientEmailAddress: clientEmailController.text,
                                      clientPhoneNumber: clientPhoneController.text,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, AppRoutes.projects);

                                }


                              }
                              },
                            text: 'Update',
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ),
            );
          }),
    );
  }
}