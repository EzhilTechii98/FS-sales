import 'package:dms_dealers/utils/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import '../../utils/custom_textForm_field.dart';
import '../../utils/image_resources.dart';
import 'allocated_bloc.dart';

class AllocatedScreen extends StatefulWidget {
  const AllocatedScreen({Key? key}) : super(key: key);

  @override
  _AllocatedScreenState createState() => _AllocatedScreenState();
}

class _AllocatedScreenState extends State<AllocatedScreen> {
  late AllocatedBloc bloc;
  List<bool> _cardExpandedState = [
    false,
    false
  ]; // State to track card expansion

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
            } else if (state is SuccessState) {}
            return SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.grey.shade200,
                  body: Padding(
                      padding: EdgeInsets.all(10),
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
                                    onTap: () {},
                                    child: const Text(' Back'),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'In Project Employee',
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
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _cardExpandedState[index] =
                                            !_cardExpandedState[index];
                                      });
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Sugesh'),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              '12/01/24 to present',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                            const SizedBox(height: 5),

                                          Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                                        const EdgeInsets.symmetric(horizontal:12.0),
                                                      ),
                                                      minimumSize: MaterialStateProperty.all<Size>(Size(64, 30)),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15.0),
                                                          side: const BorderSide(color: Colors.red),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text('iOS'),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _cardExpandedState[index] =
                                                        !_cardExpandedState[index];
                                                      });
                                                    },
                                                    icon: Icon(_cardExpandedState[index]
                                                        ? Icons.keyboard_arrow_up
                                                        : Icons.keyboard_arrow_down),
                                                  ),
                                                ],
                                              ),

                                            if (_cardExpandedState[
                                                index]) // Conditional rendering
                                              const SizedBox(height: 10),
                                            if (_cardExpandedState[index]) //
                                              // Conditional rendering
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      RichText(
                                                        text: const TextSpan(
                                                            text:
                                                                'Onboard Date  : ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            children: [
                                                              TextSpan(
                                                                  text:
                                                                      ' 21-01-2024',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14))
                                                            ]),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      RichText(
                                                        text: const TextSpan(
                                                            text:
                                                                'Project Manager : ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            children: [
                                                              TextSpan(
                                                                  text:
                                                                      ' Dharani dharan',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14))
                                                            ]),
                                                      ),
                                                      Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          _launchTeamsMessage();
                                                        },
                                                        child: SvgPicture.asset(
                                                          ImageResource.teams,
                                                          width: 20,
                                                          height: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          _sendingMails();
                                                        },
                                                        child: SvgPicture.asset(
                                                          ImageResource.mail,
                                                          width: 20,
                                                          height: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ))),
            );
          }),
    );
  }

  void _launchTeams() async {
    const url = 'tel://9445765123';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Microsoft Teams.';
    }
  }

  _sendingMails() async {
    var url = Uri.parse("mailto:feedback@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openOutlookMail() async {
    var emailAddress =
        'example@example.com'; // Replace with the recipient's email address
    var subject = 'Subject of the email'; // Optional subject
    var body = 'Body of the email'; // Optional body

    var url =
        'mailto:$emailAddress?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchTeamsMessage() async {
    const url =
        'msteams://teams.microsoft.com/l/chat/0/0?users=vasanthkumar.kamalakannan@flyerssoft.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Microsoft Teams.';
    }
  }
}
