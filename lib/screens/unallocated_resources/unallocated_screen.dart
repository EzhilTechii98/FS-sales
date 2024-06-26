import 'package:dms_dealers/utils/appBar.dart';
import 'package:dms_dealers/utils/hookup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import '../../utils/base_textForm_field.dart';
import '../../utils/image_resources.dart';
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
            } else if (state is SuccessState) {}
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Icon(Icons.arrow_back),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(' Back'))
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Un Allocated Resources',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Palanquin-Bold',
                                  color: ColorResource.color171717),
                            ),

                          ],
                        ),
                        const CustomTextForm(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search by name Id',
                            labelText: ''),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return AbsorbPointer(
                                child: Card(
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.person,
                                        size: 30.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Row(
                                      children: [
                                        const Text('Vasanth'),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            UrlLauncherHelper.launchPhone('9556765432');
                                          },
                                          child: SvgPicture.asset(
                                            ImageResource.call,
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        const SizedBox(width: 18,),
                                        InkWell(
                                          onTap: () {
                                            UrlLauncherHelper.launchEmail('feedback@gmail.com');
                                          },
                                          child: SvgPicture.asset(
                                            ImageResource.mail,
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // trailing: const Icon(Icons.done),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<
                                                    EdgeInsetsGeometry>(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                                ),
                                                minimumSize:
                                                MaterialStateProperty.all<Size>(
                                                    Size(64, 30)),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                    side: const BorderSide(
                                                        color: ColorResource.color1DD79F),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text('android'),
                                            ),
                                            SizedBox(width: 8,),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<
                                                    EdgeInsetsGeometry>(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                                ),
                                                minimumSize:
                                                MaterialStateProperty.all<Size>(
                                                    Size(64, 30)),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                    side: const BorderSide(
                                                        color: ColorResource.color1DD79F),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text('iOS'),
                                            ),

                                            SizedBox(width: 10,),

                                            ElevatedButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<
                                                    EdgeInsetsGeometry>(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                                ),
                                                minimumSize:
                                                MaterialStateProperty.all<Size>(
                                                    Size(64, 30)),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                    side: const BorderSide(
                                                        color: ColorResource.colorB11DD7),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: const Text('Health',
                                              overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ],
                                        ),


                                        const SizedBox(
                                          height: 6,
                                        ),
                                        const Text('Mobile'),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        const Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(text: 'Reporting to '),
                                              TextSpan(
                                                  text: 'Harikrishnan!',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: ColorResource
                                                          .color804EF6)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    selected: true,
                                    onTap: () {
                                      setState(() {

                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              )
            );
          }),
    );
  }
}
