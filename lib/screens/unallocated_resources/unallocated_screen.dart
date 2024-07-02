import 'package:dms_dealers/model/employee_model.dart';
import 'package:dms_dealers/screens/unallocated_resources/unallocated_event.dart';
import 'package:dms_dealers/utils/appBar.dart';
import 'package:dms_dealers/utils/hookup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import '../../utils/base_textForm_field.dart';
import '../../utils/image_resources.dart';
import 'unallocated_bloc.dart';

class UnAllocatedScreen extends StatefulWidget {
  const UnAllocatedScreen({Key? key}) : super(key: key);

  @override
  _UnAllocatedScreenState createState() => _UnAllocatedScreenState();
}

class _UnAllocatedScreenState extends State<UnAllocatedScreen> {
  late UnAllocatedBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<UnAllocatedBloc>(context);
    bloc.add(UnAllocatedEmployeeList());
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

                return SafeArea(
                    child: Scaffold(
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
                          child: Row(
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
                                  child: const Text(' Back'))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Un Allocated Resources',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Palanquin-Bold',
                                  color: ColorResource.color171717),
                            ),
                          ],
                        ),
                        const CustomTextForm(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search by name Id',
                            labelText: ''),
                        const SizedBox(height: 20),
                        Expanded(
                            child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:  employees.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          Employee employee = employees[index];

                                          return AbsorbPointer(
                                        child: employee.allocated == 0
                                            ? Card(
                                          child: ListTile(
                                            leading: const CircleAvatar(
                                              radius: 30.0,
                                              backgroundColor: Colors.grey,
                                              child: Icon(
                                                Icons.person,
                                                size: 30.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            title: Row(
                                              children: [
                                                 Text(employee!.username),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SvgPicture.asset(
                                                  employee.allocated == 0
                                                      ? ImageResource.red
                                                      : ImageResource.green,
                                                  width: 10,
                                                  height: 10,
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    UrlLauncherHelper
                                                        .launchPhone(
                                                            '9556765432');
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
                                                        'feedback@gmail.com');
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
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height : 30,
                                                      width:  200,
                                                      child: ListView.separated(

                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount :1,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          return ElevatedButton(
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
                                                          );
                                                        }, separatorBuilder: (BuildContext context, int index) {
                                                        return SizedBox(width: 6,);
                                                      },
                                                      ),


                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),


                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 6,
                                                ),
                                                const SizedBox(height: 8,),

                                                SizedBox(
                                                  height : 30,
                                                  width: 300 ,
                                                  child: ListView.separated(
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount :1,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return ElevatedButton(
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
                                                                      .colorB11DD7),
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                        child: Text(
                                                          employee.industry ??
                                                              '',
                                                        ),
                                                      );
                                                    }, separatorBuilder: (BuildContext context, int index) {
                                                    return SizedBox(width: 6,);
                                                  },
                                                  ),
                                                ),
                                                 Text(employee!.technology),
                                                const SizedBox(
                                                  height: 6,
                                                ),
                                                 Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                          text:
                                                              'Reporting to '),
                                                      TextSpan(
                                                          text: employee.reportingManager,
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
                                        ) :
                                               const Center(
                                          child: Text(''),
                                          )
                                      );
                                    },
                                  )
                               ),
                      ],
                    ),
                  ),
                )));
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
