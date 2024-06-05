import 'dart:ui';

import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/utils/custom_textForm_field.dart';
import 'package:dms_dealers/utils/image_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
                                    Navigator.pushNamed(context, AppRoutes.employeeDetails);
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
                                              side: BorderSide(
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
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                      NetworkImage('https://via.placeholder.com/150'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    title: Row(
                                      children: [
                                        const Text('Vasanth'),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            _launchTeams();
                                          },
                                          child: SvgPicture.asset(
                                            ImageResource.call,
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        const SizedBox(width: 18,),
                                        InkWell(
                                          onTap: () {
                                            _sendingMails();
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
                                    subtitle: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start  ,
                                      children: [
                                        Text('This is subtitle'),
                                        SizedBox(height: 6,),
                                        Text('This is subtitle'),
                                        SizedBox(height: 6,),
                                        Text('Reporting to Harikrishnan'),
                                      ],
                                    ),
                                    selected: true,
                                    onTap: () {
                                      setState(() {

                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  /* appBar:  CustomAppBar(title: 'Employees',
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
                                        onPressed: _launchTeams
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.mail),
                                        onPressed: () {
                                          _sendingMails();
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
                                  RichText(
                                    text: const TextSpan(text: 'Reporting Manager : ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                        children: [
                                          TextSpan(text: 'HariKrishnan',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14
                                              )
                                          )
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        );
                      },
                    ),
                  ),
                )*/
                  ),
            );
          }),
    );
  }

  void _launchTeams() async {
    const url = 'tel://9445765123';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Microsoft Teams.';
    }
  }

  _sendingMails() async {
    var url = Uri.parse("mailto:feedback@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
