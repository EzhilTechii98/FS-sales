import 'package:dms_dealers/model/project_model.dart';
import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/screens/projects/projects_event.dart';
import 'package:dms_dealers/utils/appBar.dart';
import 'package:dms_dealers/utils/hookup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import '../../utils/base_textForm_field.dart';
import '../../utils/image_resources.dart';
import 'projects_bloc.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late ProjectsBloc bloc;
  bool isExpanded = false;
  List<bool> _cardExpandedState = [false, false]; // State to track card expansion

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ProjectsBloc>(context);
    bloc.add(ProjectListDetails());
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
              if(state.successResponse is List<ProjectListModel>) {
                List<ProjectListModel> projectList = state.successResponse;

                return SafeArea(
                  child: Scaffold(
                      backgroundColor: Colors.grey.shade200,
                      body: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
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
                                      'Projects',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Palanquin-Bold',
                                          color: ColorResource.color171717),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, AppRoutes.addProjectsScreen);
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
                                const SizedBox(height: 20),

                                Expanded(
                                  child: projectList.isNotEmpty ?
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: projectList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      ProjectListModel projects = projectList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _cardExpandedState[index] = !_cardExpandedState[index];
                                          });
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                     Text(projects.projectName,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Palanquin-Regular',
                                                          color: Colors.black87),
                                                    ),
                                                    const SizedBox(width: 5,),
                                                    SvgPicture.asset(
                                                      ImageResource.green,
                                                      width: 10,
                                                      height: 10,
                                                    ),
                                                    Spacer(),

                                                    Text(projects.industry)
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
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                                          const EdgeInsets.symmetric(horizontal:12.0),
                                                        ),
                                                        minimumSize: MaterialStateProperty.all<Size>(const Size(64, 30)),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(15.0),
                                                            side:  const BorderSide(color: ColorResource.color1DD79F),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(projects.technology),
                                                    ),
                                                    const SizedBox(width: 8,),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                                          const EdgeInsets.symmetric(horizontal:12.0),
                                                        ),
                                                        minimumSize: MaterialStateProperty.all<Size>(const Size(64, 30)),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(15.0),
                                                            side:  const BorderSide(color: ColorResource.color1DD79F),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      child: const Text('Flutter'),
                                                    ),
                                                    Spacer(),
                                                    Icon(_cardExpandedState[index]
                                                        ? Icons.keyboard_arrow_up
                                                        : Icons.keyboard_arrow_down),
                                                  ],
                                                ),
                                                if (_cardExpandedState[index]) // Conditional rendering
                                                  const SizedBox(height: 10),
                                                if (_cardExpandedState[index]) //
                                                // Conditional rendering
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(text: 'Client Name : ',
                                                                style: const TextStyle(
                                                                    fontSize: 16,
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                                children: [
                                                                  TextSpan(text: projects.clientName,
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 14
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          InkWell(
                                                            onTap:() {
                                                              UrlLauncherHelper.launchPhone('9665746543');
                                                            },
                                                            child: SvgPicture.asset(
                                                              ImageResource.call,
                                                              width: 20,
                                                              height: 20,
                                                            ),
                                                          ),
                                                          const SizedBox(width: 13,),
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
                                                      const SizedBox(height: 10,),
                                                      Row(
                                                        children: [
                                                          RichText(
                                                            text:  TextSpan(text: 'Project Manager : ',
                                                                style: const TextStyle(
                                                                    fontSize: 16,
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                                children: [
                                                                  TextSpan(text: projects.projectManager,
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 14
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          InkWell(
                                                            onTap: () {
                                                              UrlLauncherHelper.launchTeamsMessage('');
                                                            },
                                                            child: SvgPicture.asset(
                                                              ImageResource.teams,
                                                              width: 20,
                                                              height: 20,
                                                            ),
                                                          ),
                                                          const SizedBox(width: 13,),
                                                          InkWell(
                                                            onTap:() {
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
                                        ),
                                      );
                                    },
                                  )
                                      :
                                  Center(
                                    child: Text('There is No Project'),
                                  )

                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                );
              } else {
                return Text('Invalid response');
              }

            } else if(state is LoadingState) {
              return CircularProgressIndicator();

            } else if(state is FailureState) {
              return Scaffold(
                body: Center(
                    child:
                    Text(state.errorMessage ?? 'Failed to fetch employees.')),
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }

          }),
    );
  }
}



