

import 'package:dms_dealers/utils/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'projects_bloc.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late ProjectsBloc bloc;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ProjectsBloc>(context);

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
                appBar: CustomAppBar(
                  title: "Projects",
                  actions: [
                    IconButton(onPressed:() {} , icon: const Icon(Icons.add)),
                    IconButton(onPressed:() {} , icon: const Icon(Icons.search))
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GestureDetector(
                        onTap: () {
                  setState(() {
                  isExpanded = !isExpanded;
                  });
                  },
                    child: Container(
                      width: 200,
                      height: isExpanded ? 200 : 100, // Adjust height as needed
                      color: Colors.blue,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Text',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Add action for first icon
                                      },
                                      icon: Icon(Icons.edit, color: Colors.white),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Add action for second icon
                                      },
                                      icon: Icon(Icons.delete, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Icon(
                              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      ],
                    )
                  ),
                )
              ),
            );
          }),
    );
  }
}



