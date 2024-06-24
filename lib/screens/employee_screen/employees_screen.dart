import 'dart:ui';
import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/utils/base_textForm_field.dart';
import 'package:dms_dealers/utils/image_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../base/base_state.dart';
import '../../model/employee_model.dart';
import '../../sqlite/login_sqlite.dart';
import '../../utils/color_resources.dart';
import '../../utils/hookup.dart';
import 'employees_bloc.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  late EmployeesBloc bloc;
  Future<List<Employee>>? futureEmployees;
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Employee> employees = [];


  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<EmployeesBloc>(context);
    _loadData();

  }

  void _loadData() async {
    List<Employee> userList = await dbHelper.getUsers();
    for (var employee in userList) {
      print('Employee: ${employee.username}, ${employee.email}, ${employee.designation}');
    }
    setState(() {
      employees = userList;
    });
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
                child : Text(''),
              );
            } else if (state is SuccessState) {}
            return SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.grey.shade200,
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(Icons.arrow_back),
                                Text(' Back')
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Employees',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Palanquin-Bold',
                                    color: ColorResource.color171717),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.employeeDetails);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorResource.color804EF6),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: const BorderSide(
                                                  color: ColorResource
                                                      .color804EF6)))),
                                  child: const Text(
                                    'Add + ',
                                    style: TextStyle(
                                        color: ColorResource.colorFFFFFF,
                                        fontFamily: 'Lato-Regular',
                                        fontSize: 18),
                                  ))
                            ],
                          ),
                          const CustomTextForm(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search by name Id',
                              labelText: ''),
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: employees.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      print(employees.length);
                                      print(employees[index].username);
                                      return Card(
                                        child: ListTile(
                                          leading: const Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 30.0,
                                                backgroundColor: Colors.grey,
                                                child: Icon(
                                                  Icons.person,
                                                  size: 30.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          title: Row(
                                            children: [
                                               Text('Vasanth'),
                                              const SizedBox(width: 5,),
                                              SvgPicture.asset(
                                                ImageResource.red,
                                                width: 10,
                                                height: 10,
                                              ),

                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  UrlLauncherHelper.launchPhone('9545444444');
                                                },
                                                child: SvgPicture.asset(
                                                  ImageResource.call,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  UrlLauncherHelper.launchEmail('feedback@gmail.com');
                                                },
                                                child: SvgPicture.asset(
                                                  ImageResource.mail,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                            ],
                                          ),

                                          // trailing: const Icon(Icons.done),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      padding: MaterialStateProperty.all<
                                                          EdgeInsetsGeometry>(
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 12.0),
                                                      ),
                                                      minimumSize:
                                                      MaterialStateProperty.all<Size>(
                                                          Size(64, 30)),
                                                      shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(15.0),
                                                          side: const BorderSide(
                                                              color: ColorResource.color1DD79F),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text('iOS'),
                                                  ),

                                                  SizedBox(width: 10,),

                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      padding: MaterialStateProperty.all<
                                                          EdgeInsetsGeometry>(
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 12.0),
                                                      ),
                                                      minimumSize:
                                                      MaterialStateProperty.all<Size>(
                                                          Size(64, 30)),
                                                      shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(15.0),
                                                          side: const BorderSide(
                                                              color: ColorResource.colorB11DD7),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: const Text('Finance',
                                                      overflow: TextOverflow.clip,
                                                    ),
                                                  ),
                                                ],
                                              )
                                              ,
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              const Text('Mobile'),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              const Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(text: 'Reporting to '),
                                                    TextSpan(
                                                        text: 'Harikrishnan!',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: ColorResource
                                                                .color804EF6)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          selected: true,
                                          onTap: () {
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  )
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
