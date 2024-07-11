import 'package:dms_dealers/screens/allocated_resources/allocated_event.dart';
import 'package:dms_dealers/utils/hookup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../base/base_state.dart';
import '../../model/employee_model.dart';
import '../../utils/color_resources.dart';
import '../../utils/base_textForm_field.dart';
import '../../utils/image_resources.dart';
import 'allocated_bloc.dart';

class AllocatedScreen extends StatefulWidget {
  const AllocatedScreen({Key? key}) : super(key: key);

  @override
  _AllocatedScreenState createState() => _AllocatedScreenState();
}

class _AllocatedScreenState extends State<AllocatedScreen> {
  late AllocatedBloc bloc;
  final List<bool> _cardExpandedState = [
    false,
    false
  ]; // State to track card expansion

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AllocatedBloc>(context);
    bloc.add(AllocatedListEvent());
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
      print('------------- ${employees.length}');
      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: Padding(
                padding: const EdgeInsets.all(10),
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
                              onTap: () {},
                              child: const Text(' Back'),
                            )
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
                            'In Project Employee',
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
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: employees.length,
                          itemBuilder: (BuildContext context, int index) {
                            Employee employee = employees[index];
                            return
                              employee.allocated == 1 ?
                              Card(
                               child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                     Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(employee.username),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      '12/01/24 to present',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    const SizedBox(height: 5),

                                    Row(
                                      children: [
                                        // ElevatedButton(
                                        //   style: ButtonStyle(
                                        //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        //       const EdgeInsets.symmetric(horizontal:12.0),
                                        //     ),
                                        //     minimumSize: MaterialStateProperty.all<Size>(Size(64, 30)),
                                        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        //       RoundedRectangleBorder(
                                        //         borderRadius: BorderRadius.circular(15.0),
                                        //         side: const BorderSide(color: ColorResource.color1D67D7),
                                        //       ),
                                        //     ),
                                        //   ),
                                        //   onPressed: () {},
                                        //   child: Text('Planet'),
                                        // ),
                                        const SizedBox(width: 8),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                              const EdgeInsets.symmetric(horizontal:12.0),
                                            ),
                                            minimumSize: MaterialStateProperty.all<Size>(const Size(64, 30)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                                side: const BorderSide(color: ColorResource.color1DD79F),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(employee.technology),
                                        ),
                                        const SizedBox(width: 8),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                              const EdgeInsets.symmetric(horizontal:12.0),
                                            ),
                                            minimumSize: MaterialStateProperty.all<Size>(const Size(64, 30)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                                side: const BorderSide(color: ColorResource.colorB11DD7),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(employee.industry),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _cardExpandedState[index] =
                                              !_cardExpandedState[index];
                                            });
                                          },
                                          icon: Icon(_cardExpandedState[index]
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down),
                                        ),
                                      ],
                                    ),


                                    if (_cardExpandedState[
                                    index]) // Conditional rendering
                                      const SizedBox(height: 10),
                                    if (_cardExpandedState[index]) //
                                    // Conditional rendering
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              RichText(
                                                text: const TextSpan(
                                                    text:
                                                    'Onboard Date  : ',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                          ' 21-01-2024',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize:
                                                              14))
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text:  TextSpan(
                                                    text:
                                                    'Project Manager : ',
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors
                                                            .black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                          employee.reportingManager,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize:
                                                              14))
                                                    ]),
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  UrlLauncherHelper.launchTeamsMessage('ezhilarasan.s@flyerssoft.com');
                                                },
                                                child: SvgPicture.asset(
                                                  ImageResource.teams,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 13,
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
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ) :
                              const Center(
                                child: Text(''),
                              );
                          },
                        ),
                      )
                    ],
                  ),
                ))),
      );
    }else {
      return const Text('Invalid response type from Bloc');
    }

            } else if (state is LoadingState) {
              return const CircularProgressIndicator();
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
