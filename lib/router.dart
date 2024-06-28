import 'package:dms_dealers/screens/add_project_screen/add_project_bloc.dart';
import 'package:dms_dealers/screens/add_project_screen/add_project_event.dart';
import 'package:dms_dealers/screens/add_project_screen/add_project_screen.dart';
import 'package:dms_dealers/screens/allocated_resources/allocated_bloc.dart';
import 'package:dms_dealers/screens/allocated_resources/allocated_event.dart';
import 'package:dms_dealers/screens/allocated_resources/allocated_screen.dart';
import 'package:dms_dealers/screens/dashboard_screen/Dashboard_bloc.dart';
import 'package:dms_dealers/screens/dashboard_screen/Dashboard_event.dart';
import 'package:dms_dealers/screens/dashboard_screen/Dashboard_screen.dart';
import 'package:dms_dealers/screens/employee_detail_screen/employee_detail_bloc.dart';
import 'package:dms_dealers/screens/employee_detail_screen/employee_detail_event.dart';
import 'package:dms_dealers/screens/employee_detail_screen/employee_detail_screen.dart';
import 'package:dms_dealers/screens/employee_screen/employees_bloc.dart';
import 'package:dms_dealers/screens/employee_screen/employees_event.dart';
import 'package:dms_dealers/screens/employee_screen/employees_screen.dart';
import 'package:dms_dealers/screens/login_page/login_bloc.dart';
import 'package:dms_dealers/screens/login_page/login_event.dart';
import 'package:dms_dealers/screens/login_page/login_screen.dart';
import 'package:dms_dealers/screens/projects/projects_bloc.dart';
import 'package:dms_dealers/screens/projects/projects_event.dart';
import 'package:dms_dealers/screens/projects/projects_screen.dart';
import 'package:dms_dealers/screens/resources_allocation_screen/res_allocation_bloc.dart';
import 'package:dms_dealers/screens/resources_allocation_screen/res_allocation_event.dart';
import 'package:dms_dealers/screens/resources_allocation_screen/res_allocation_screen.dart';
import 'package:dms_dealers/screens/unallocated_resources/unallocated_bloc.dart';
import 'package:dms_dealers/screens/unallocated_resources/unallocated_event.dart';
import 'package:dms_dealers/screens/unallocated_resources/unallocated_screen.dart';
import 'package:dms_dealers/sqlite/employee_sqlite_db.dart';
import 'package:dms_dealers/utils/color_resources.dart';
import 'package:dms_dealers/utils/perference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authenticatiom/bloc/authentication_bloc.dart';
import 'authenticatiom/bloc/authentication_state.dart';


class AppRoutes {
  static const String dashboardScreen = 'dashboard_screen';
  static const String loginScreen = 'login_screen';
  static const String employeeList = 'employee_list';
  static const String projects = 'projects';
  static const String allocated = 'allocated';
  static const String unallocated = 'unallocated';
  static const String employeeDetails = 'employeeDetails';
  static const String addProjectsScreen = 'addProjectsScreen';
  static const String resourcesAllocationScreen = 'resourcesAllocationScreen';
}

Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen();
    case AppRoutes.dashboardScreen:
      return _buildDashboardScreen(settings);
    case AppRoutes.employeeList:
      return _buildEmployeeScreen();
    case AppRoutes.projects:
      return _buildProjectsScreen();
    case AppRoutes.allocated:
      return _buildAllocatedScreen();
    case AppRoutes.unallocated:
      return _buildUnAllocated();
    case AppRoutes.employeeDetails:
      return _buildEmployeeDetails(arguments: settings);
    case AppRoutes.addProjectsScreen:
      return _buildAddProjectsScreen();
    case AppRoutes.resourcesAllocationScreen:
      return _buildResourcesAllocationScreen();

  }
  return null;
}

Route<dynamic> _buildLoginScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildLoginScreen());
}

Route<dynamic> _buildDashboardScreen(dynamic users) {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildDashboardScreen());
}
Route<dynamic> _buildEmployeeScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildEmployeeScreen());
}
Route<dynamic> _buildProjectsScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildProjectsScreen());
}
Route<dynamic> _buildAllocatedScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildAllocatedScreen());
}
Route<dynamic> _buildUnAllocated() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildUnAllocated());
}
Route<dynamic> _buildEmployeeDetails({RouteSettings? arguments}) {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildEmployeeDetails(arguments: arguments));
}
Route<dynamic> _buildAddProjectsScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildAddProjectsScreen());
}
Route<dynamic> _buildResourcesAllocationScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildResourcesAllocationScreen());
}
//_buildResourcesAllocationScreen

class PageBuilder {
  static Widget buildLoginScreen() {
    return BlocProvider(
        create: (BuildContext context) => LoginBloc()
          ..add(LoginInitialEvent(context: context)),
        child: const LoginScreen());
  }

  static Widget buildDashboardScreen() {
    Map<String, dynamic>? user;
    return BlocProvider(
        create: (BuildContext context) => DashboardBloc()
          ..add(DashboardInitialEvent(context: context)),
        child:  DashboardScreen());
  }

  static Widget buildEmployeeScreen() {
    return BlocProvider(
        create: (BuildContext context) => EmployeesBloc()
          ..add(EmployeesInitialEvent(context: context)),
        child: const EmployeesScreen());
  }

  static Widget buildProjectsScreen() {
    return BlocProvider(
        create: (BuildContext context) => ProjectsBloc()
          ..add(ProjectsInitialEvent(context: context)),
        child: const ProjectsScreen());
  }

  static Widget buildAllocatedScreen() {
    return BlocProvider(
        create: (BuildContext context) => AllocatedBloc()
          ..add(AllocatedInitialEvent(context: context)),
        child: const AllocatedScreen());
  }

  static Widget buildUnAllocated() {
    return BlocProvider(
        create: (BuildContext context) => UnAllocatedBloc()
          ..add(UnAllocatedInitialEvent(context: context)),
        child: const UnAllocatedScreen());
  }

  static Widget buildEmployeeDetails({RouteSettings? arguments}) {
    Object? tempEmployeeList;
    tempEmployeeList = arguments!.arguments;
    print('========Employee============$tempEmployeeList');
    return BlocProvider(
        create: (BuildContext context) => EmployeeDetailsBloc()
          ..add(EmployeeDetailsInitialEvent(arguments: tempEmployeeList)),
        child:  EmployeeDetailsScreen());
  }

  static Widget buildAddProjectsScreen() {
    return BlocProvider(
        create: (BuildContext context) => AddProjectBloc()
          ..add(AddProjectInitialEvent(context: context)),
        child: const AddProjectScreen());
  }

  static Widget buildResourcesAllocationScreen() {
    return BlocProvider(
        create: (BuildContext context) => ResourcesAllocationBloc()
          ..add(ResourcesAllocationInitialEvent(context: context)),
        child: const ResourcesAllocationScreen());
  }

}

Widget addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (BuildContext context, Object? state) async {
      if (state is AuthenticationUnAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        bool? isLogin = true;
        await PreferenceHelper.getLoginStatus()
            .then((bool value) => isLogin = value);
        if (isLogin!) {
          //  await Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else {
          // await Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
        }
      }
      if (state is AuthenticationAuthenticated) {
       /* while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }*/
      }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (BuildContext context, Object? state) {
        if (state is NoInternetConnectionState) {
          return Card(
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.no_accounts_sharp,
                    size: 34,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('No Internet Connection',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white)),
                ],
              ),
            ),
          );
        }
        else {
          return widget;
        }
      },
    ),
  );
}
