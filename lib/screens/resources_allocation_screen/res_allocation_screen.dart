

import 'package:dms_dealers/utils/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'res_allocation_bloc.dart';

class ResourcesAllocationScreen extends StatefulWidget {
  const ResourcesAllocationScreen({Key? key}) : super(key: key);

  @override
  _ResourcesAllocationScreenState createState() => _ResourcesAllocationScreenState();
}

class _ResourcesAllocationScreenState extends State<ResourcesAllocationScreen> {
  late ResourcesAllocationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ResourcesAllocationBloc>(context);

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
                  title: "Resources Allocation",
                  actions: [],
                ),
                body: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(50),
                        child: const Text('  READ', style: TextStyle(fontSize: 25, color: Colors.black),),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}