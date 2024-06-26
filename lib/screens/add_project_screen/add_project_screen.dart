
import 'package:dms_dealers/screens/add_project_screen/add_project_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../base/base_state.dart';
import '../../router.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.successResponse)),
          );
          Navigator.pushNamed(context, AppRoutes.projects);
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