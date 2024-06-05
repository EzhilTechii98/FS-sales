import 'package:dms_dealers/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/appBar.dart';
import '../../utils/color_resources.dart';
import 'Dashboard_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<DashboardBloc>(context);
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
            } else if (state is SuccessState) {}
            return SafeArea(
              child: Scaffold(
                appBar:  CustomAppBar(title: 'Dashboard', actions: [],),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30,),
                        const Text('  Hello, Vasanthkumar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black

                        ),
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.employeeList);
                          },
                          child: Card(
                            elevation: 2,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.group),

                                  Text('Employee Details'),

                                  Text("20")
                                ],
                              ),
                            ),
                          ),
                        ),
                        // project
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.projects);
                          },
                          child: Card(
                            elevation: 2,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.group),

                                  Text('Projects'),

                                  Text( "20")
                                ],
                              ) ,
                            ),
                          ),
                        ),

                        //allocated
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.allocated);
                          },
                          child: Card(
                            elevation: 2,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.group),

                                  Text('Allocated resources'),

                                  Text("20")
                                ],
                              ) ,
                            ),
                          ),
                        ),

                        //unallocated
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.unallocated);
                          },
                          child: Card(
                            elevation: 2,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.group),
                                  Text('UnAllocated Resources'),
                                  Text("20")
                                ],
                              ) ,
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
