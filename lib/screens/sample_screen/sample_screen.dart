

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'sample_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late OTPBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<OTPBloc>(context);

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
                    backgroundColor: ColorResource.color0A077C,
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
                        child: const Text('NEWSIT - READ', style: TextStyle(fontSize: 25, color: Colors.black),),
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