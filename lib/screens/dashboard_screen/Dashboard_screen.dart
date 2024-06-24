import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../sqlite/login_sqlite.dart';
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
  final DatabaseHelper dbHelper = DatabaseHelper();
  String userName = '';


  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<DashboardBloc>(context);
    loadJsonData(dbHelper);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        final String username = userName ;

        // final user = await dbHelper.getAllUser(username);
        // print(user);

      },
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
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Dashboard',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorResource.color0B101C,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                AppUtils.showToast('Working Progress');
                              },
                              icon: Icon(Icons.power_settings_new),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                         const Text(
                          'Hello, Vasanth kumar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: ColorResource.color0B101C),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.employeeList);
                          },
                          child: Card(
                            elevation: 2,
                            color: ColorResource.color804EF6,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.group,
                                      color: ColorResource.colorFFFFFF),
                                  Text(
                                    'Employee Details',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  ),
                                  Text(
                                    "20",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  )
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
                            color: ColorResource.color804EF6,
                            elevation: 2,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.precision_manufacturing,
                                      color: ColorResource.colorFFFFFF),
                                  Text(
                                    'Projects',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  ),
                                  Text(
                                    "20",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        //allocated
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.allocated);
                          },
                          child: Card(
                            color: ColorResource.color804EF6,
                            elevation: 2,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.reduce_capacity,
                                      color: ColorResource.colorFFFFFF),
                                  Text(
                                    'Allocated resources',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  ),
                                  Text(
                                    "20",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        //unallocated
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.unallocated);
                          },
                          child: Card(
                            color: ColorResource.color804EF6,
                            elevation: 2,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.person_add_disabled_sharp,
                                      color: ColorResource.colorFFFFFF),
                                  Text(
                                    'UnAllocated Resources',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  ),
                                  Text(
                                    "20",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.colorFFFFFF),
                                  )
                                ],
                              ),
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
