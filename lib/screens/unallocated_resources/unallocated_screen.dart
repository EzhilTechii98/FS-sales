import 'package:dms_dealers/utils/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import '../../utils/custom_textForm_field.dart';
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
                                      backgroundImage:
                                      NetworkImage('https://via.placeholder.com/150'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    title: Row(
                                      children: [
                                        const Text('Vasanth'),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            // _launchTeams();
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
                                            // _sendingMails();
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
                                    subtitle: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start  ,
                                      children: [
                                        Text('This is subtitle'),
                                        SizedBox(height: 6,),
                                        Text('This is subtitle'),
                                        SizedBox(height: 6,),
                                        Text('Reporting to Harikrishnan'),
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

               /* ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Vasanth kumar",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.call),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.mail),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            const Text(
                              'Mobile',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                  label: const Text('Health'),
                                  backgroundColor:
                                      Colors.deepOrangeAccent.shade100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
                  },
                ),*/
              )
            );
          }),
    );
  }
}
