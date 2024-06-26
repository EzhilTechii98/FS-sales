import 'dart:ui';
import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/utils/base_textForm_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../base/base_state.dart';
import '../../model/employee_model.dart';
import '../../utils/color_resources.dart';
import '../../utils/hookup.dart';
import '../../utils/image_resources.dart';
import 'employees_bloc.dart';
import 'employees_event.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  late EmployeesBloc bloc;

  // List<Employee>? _bankDetailsList;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<EmployeesBloc>(context);
    bloc.add(EmployeeListDetails());
    // getAllBankDetails();
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
              if (state.successResponse is List<Employee>) {
                List<Employee> employees = state.successResponse;

                return Scaffold(
                  backgroundColor: Colors.grey.shade200,
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Icon(Icons.arrow_back),
                              Text(' Back'),
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
                                color: ColorResource.color171717,
                              ),
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: ColorResource.color804EF6),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Add + ',
                                style: TextStyle(
                                  color: ColorResource.colorFFFFFF,
                                  fontFamily: 'Lato-Regular',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const CustomTextForm(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search by name or ID',
                          labelText: '',
                        ),
                        // SizedBox(height: 20),
                        Expanded(
                            child: employees.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: employees.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Employee employee = employees[index];
                                      print(employee.allocated);
                                      print(employee.team);
                                      print(employee.designation);
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
                                              Text(
                                                employee.username ?? '',
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                employee.allocated == true ?
                                                ImageResource.red :
                                                ImageResource.green,
                                                width: 10,
                                                height: 10,
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  UrlLauncherHelper.launchPhone(
                                                      '9545444444');
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
                                                  UrlLauncherHelper.launchEmail(
                                                    employee.email ?? '',
                                                  );
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
                                                      padding:
                                                          MaterialStateProperty.all<
                                                              EdgeInsetsGeometry>(
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 12.0),
                                                      ),
                                                      minimumSize:
                                                          MaterialStateProperty
                                                              .all<Size>(
                                                                  Size(64, 30)),
                                                      shape: MaterialStateProperty
                                                          .all<
                                                              RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                          side: const BorderSide(
                                                              color: ColorResource
                                                                  .color1DD79F),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      employee.designation ??
                                                          '',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),

                                                  /*  ElevatedButton(
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
                                          ),*/
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                employee.team ?? '',
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    const TextSpan(
                                                        text: 'Reporting to '),
                                                    TextSpan(
                                                        text: employee
                                                                .reportingManager ??
                                                            '',
                                                        style: const TextStyle(
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
                                : Center(
                                    child: Text('There is No Employees'),
                                  ))
                      ],
                    ),
                  ),
                );
              } else {
                return Text('Invalid response type from Bloc');
              }
            } else if (state is LoadingState) {
              return CircularProgressIndicator();
            } else if (state is FailureState) {
              return Scaffold(
                body: Center(
                    child: Text(
                        state.errorMessage ?? 'Failed to fetch employees.')),
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          }),
    );
  }
}
