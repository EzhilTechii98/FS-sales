
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../base/base_state.dart';
import '../../utils/app_utils.dart';
import '../../utils/color_resources.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_textForm_field.dart';
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



  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AddProjectBloc>(context);
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
                      SizedBox(height: 10,),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: const [

                              CustomTextStyle(text: 'Project Name'),
                              CustomTextForm(
                                hintText: '',
                                labelText: '',
                                validator: InputValidator.projectName,
                              ),

                              //Industry
                              CustomTextStyle(text: 'Industry'),
                              CustomTextForm(
                                hintText: '',
                                labelText: '',
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                              ),

                              //Technology
                              CustomTextStyle(text: 'Technology'),
                              CustomTextForm(
                                hintText: '',
                                labelText: '',
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                              ),

                              CustomTextStyle(text: 'Project Manager'),
                              CustomTextForm(
                                hintText: '',
                                labelText: '',
                                validator: InputValidator.projectManager,
                              ),

                              CustomTextStyle(text: 'Client Name'),
                              CustomTextForm(
                                hintText: '',
                                labelText: '',
                                validator:  InputValidator.clientName,
                              ),

                              CustomTextStyle(text: 'Client Email Address'),
                              CustomTextForm(
                                hintText: '',
                                labelText: '',
                                validator: InputValidator.clientEmail,

                              ),

                              CustomTextStyle(text: 'Client Phone Number'),
                              CustomTextForm(
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
                        child: CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('new');
                            }
                            },
                          text: 'Update',
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
  _showDatePicker() async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019, 1),
      lastDate: DateTime(2029, 12),
    );

    if (_selectedDate != null) {
      setState(() {
        print(_selectedDate.toString());
        _controller.text = _selectedDate.toString();
      });
    }
  }
}