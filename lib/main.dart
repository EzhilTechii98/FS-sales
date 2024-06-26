import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/screens/splash/splash_screen.dart';
import 'package:dms_dealers/sqlite/employee_sqlite_db.dart';
import 'package:dms_dealers/sqlite/project_sqlite_db.dart';
import 'package:dms_dealers/utils/app_themes.dart';
import 'package:dms_dealers/widgets/bloc.dart';
import 'package:dms_dealers/widgets/flutter_core_widgets.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authenticatiom/bloc/authentication_bloc.dart';
import 'authenticatiom/bloc/authentication_event.dart';

final dbHelper = DatabaseHelper();
final dbHelper2 = DatabaseHelper2();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initialization();
  await dbHelper2.initialization();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = EchoBlocDelegate();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) {
        return AuthenticationBloc()..add(AppStarted(context: context));
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends CoreWidgets {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends CoreWidgetsState<MyApp> {
  Locale? _locale;
  AuthenticationBloc? bloc;
  String? generateTokes;

  @override
  void initState() {
    bloc = BlocProvider.of<AuthenticationBloc>(context);
    //toCheckInternetConnection();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ));
    return DynamicTheme(
      themeCollection: AppThemes().getThemeCollections(),
      builder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'FS-SALES',
          locale: _locale,
          theme: theme,
          onGenerateRoute: getRoute,
          debugShowCheckedModeBanner: false,
          home:addAuthBloc(
            context,
            const Splash(),
          ),
        );
      },
    );
  }
}