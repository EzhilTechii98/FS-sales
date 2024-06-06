import 'package:dms_dealers/utils/custom_textForm_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../base/base_state.dart';
import '../../router.dart';
import '../../sqlite/database_sqlite.dart';
import '../../utils/color_resources.dart';
import '../../utils/custom_button.dart';
import '../../utils/image_resources.dart';
import '../../utils/validation.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNo = TextEditingController();

  final jsonData = '''
    [
      {
        "Username": "Ezhilarasan",
        "Email": "ezhilarasan@flyerssoft.com",
        "Designation": "Flutter",
        "phonenumber": "9445765173",
        "Team": "flutter",
        "Reporting Manager": "harikrishnan",
        "Industry": "finance",
        "Technology": "IT"
      },
      {
        "Username": "jack",
        "Email": "jack@flyerssoft.com",
        "Designation": "Flutter",
        "phonenumber": "9445898983",
        "Team": "Android",
        "Reporting Manager": "harikrishnan",
        "Industry": "Marketing",
        "Technology": "IT"
      }
    ]
  ''';

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

  Future<void> login(String email, String password) async {
    final user = await DatabaseHelper.getUser(email, password);
    if (user != null) {
      debugPrint('Login successful: ${user.username}');
    } else {
      debugPrint('Login failed');
    }
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[_loginFormFields()],
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
        const SizedBox(
          height: 100,
        ),
        SvgPicture.asset(
          ImageResource.loginLogo,
          width: 100,
          height: 100,
        ),
        const Text(
          ' Welcome to Flyers Soft',
          style: TextStyle(
            fontSize: 20,
            color: ColorResource.color0E0D0E,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
               CustomTextForm(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: "Enter your emaiId ",
                labelText: "Enter EmailId",
                validator: InputValidator.email,
              ),
               CustomTextForm(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: "Enter your password ",
                  labelText: "Enter password",
                  validator: InputValidator.password),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login(emailController.text, passwordController.text);
                      Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                    }
                  },
                  text: '    Login    ',
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
