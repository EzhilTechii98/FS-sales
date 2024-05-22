import 'package:dms_dealers/utils/app_utils.dart';
import 'package:dms_dealers/utils/custom_textForm_field.dart';
import 'package:dms_dealers/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/appBar.dart';
import '../../utils/color_resources.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController mobileNo = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
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
            return Scaffold(
              appBar:  CustomAppBar(title: 'LoginPage', actions: [],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[_loginFormFields()],
                ),
              ),
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,

              floatingActionButton: Container(
                height: 50,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                    }
                  },
                  child: const Center(
                    child: Text('Login'),
                  ),
                ),
              ),
            );
          }),

    );
  }

  _loginFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset("assets/png/flyerss.png")),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextForm(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: "Enter your emaiId ",
                labelText: "Enter EmailId",
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "please enter valid email";
                  } else {
                    return null;
                  }
                },
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12.0,
                ),
              ),
              // TextFormField(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   decoration: InputDecoration(
              //     labelText: "Enter Email",
              //     fillColor: Colors.white,
              //     border: OutlineInputBorder(
              //       borderRadius: new BorderRadius.circular(10.0),
              //       borderSide: new BorderSide(),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: new BorderRadius.circular(10.0),
              //       borderSide: new BorderSide(),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: new BorderRadius.circular(10.0),
              //       borderSide: new BorderSide(),
              //     ),
              //     //fillColor: Colors.green
              //   ),
              //   validator: (String? val) {
              //     if (val!.isEmpty) {
              //       return "Email cannot be empty";
              //     } else {
              //       return null;
              //     }
              //   },
              //   keyboardType: TextInputType.emailAddress,
              //   style: const TextStyle(
              //     fontFamily: "Poppins",
              //   ),
              // ),

              CustomTextForm(
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12.0,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: "Enter your password ",
                  labelText: "Enter password",
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return "please enter the passwork";
                    } else if(val!.length < 6) {
                      return "password must contain 6 character and above";
                    }
                  },
              )
              // ),
            ],
          ),
        )
      ],
    );
  }
}
