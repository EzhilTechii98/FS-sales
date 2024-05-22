

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
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
                appBar: AppBar(
                    backgroundColor: Colors.purple,
                    // centerTitle: true,
                    title: const Text("Login Page",
                      style:TextStyle(fontSize: 12)
                    )),
                body:
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(50),
                        child: const Text('  unallocated', style: TextStyle(fontSize: 25, color: Colors.black),),
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