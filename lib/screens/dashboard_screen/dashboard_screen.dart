import 'package:dms_dealers/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'dashboard_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardBloc bloc;

  // final DatabaseHelper dbHelper = DatabaseHelper();
  String userName = '';

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<DashboardBloc>(context);
    // loadJsonData(dbHelper);
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
            return SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Home Screen'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150'),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Good Morning,',
                                      style: TextStyle(fontSize: 16)),
                                  Text('Freddie Fred',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 150),
                          CustomPaint(
                            size: Size(200, 200),
                            painter: CircularChartPainter(),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('180',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  const Text('members',
                                      style: TextStyle(fontSize: 16)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.employeeList);
                                    }
                                    ,
                                    child: const Text('View all',
                                        style: TextStyle(
                                            color: ColorResource.color804EF6,
                                            fontSize: 14)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 20,
                                          height: 20,
                                          color: ColorResource.color804EF6),
                                      const SizedBox(width: 4),
                                      const Text('100'),
                                      const SizedBox(width: 16),
                                      Container(
                                          width: 20,
                                          height: 20,
                                          color: ColorResource.colorC5AEFB),
                                      const SizedBox(width: 4),
                                      const Text('80'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 154),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.allocated);
                                },
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: Colors.purple,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                child: const Text('In Project '),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.unallocated);
                                },
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: Colors.purple,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                child: const Text('UnAllocated'),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Text('Projects',
                                    style: TextStyle(
                                        color: ColorResource.color804EF6,
                                        fontSize: 16)),
                                const SizedBox(height: 8),
                                const Text('10',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, AppRoutes.projects);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: ColorResource.colorC5AEFB,
                                    // backgroundColor: Colors.white,
                                    side: const BorderSide(color: ColorResource.color804EF6),
                                  ),
                                  child: const Text('View All'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  ),
            );
          }),
    );
  }
}

class CircularChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ColorResource.color804EF6
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    Paint backgroundPaint = Paint()
      ..color = ColorResource.colorC5AEFB
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    double progress = 360 / 360;
    double angle = 1.3 * 3.14 * progress;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      -3.14 / 2,
      angle,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      -3.14 / 2 + angle,
      2 * 3.14 - angle,
      false,
      backgroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
