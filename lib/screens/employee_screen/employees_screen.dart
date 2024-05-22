

import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/utils/custom_textForm_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/appBar.dart';
import '../../utils/color_resources.dart';
import 'employees_bloc.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  late EmployeesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<EmployeesBloc>(context);

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
               appBar:  CustomAppBar(title: 'Employees',
                 actions: const [
                 Icon(Icons.search,
                 color: Colors.white,
                 ),
                 SizedBox(width: 10,)
               ],),
                body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.employeeDetails);
                    },
                    child: ListView.builder(
                      itemCount:2 ,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Vasanth kumar",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.call),
                                        onPressed: () {

                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.mail),
                                        onPressed: () {

                                        },
                                      ),
                                    ],
                                  ),
                                  const Text('Mobile',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87
                                    ),
                                  ),
                                   Chip(
                                    label: const Text('Health'),
                                    backgroundColor: Colors.deepOrangeAccent.shade100,
                                  ),
                                  const Text('Reporting to Hari krishna'),
                                ],
                              ),
                            ),
                          )
                        );
                      },
                    ),
                  ),
                )
              ),
            );
          }),
    );
  }
}