

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'allocated_bloc.dart';

class AllocatedScreen extends StatefulWidget {
  const AllocatedScreen({Key? key}) : super(key: key);

  @override
  _AllocatedScreenState createState() => _AllocatedScreenState();
}

class _AllocatedScreenState extends State<AllocatedScreen> {
  late AllocatedBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AllocatedBloc>(context);

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
                  child:
                  Column(

                    children: [
                      Container(
                        padding: const EdgeInsets.all(50),
                        child: const Text('  allocated', style: TextStyle(fontSize: 25, color: Colors.black),),
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