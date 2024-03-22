import 'package:doctor_app/pages/create/account_create_viewmodel.dart';
import 'package:doctor_app/responsive/size_responsive.dart';
import 'package:flutter/material.dart';

import '../../../responsive/text_responsive.dart';

class DetailsTab extends StatelessWidget {
  final AccountCreateViewModel viewModel;
  DetailsTab({super.key, required this.viewModel});

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phone1FocusNode = FocusNode();
  final FocusNode _phone2FocusNode = FocusNode();
  final FocusNode _wappFocusNode = FocusNode();
  final FocusNode _expFocusNode = FocusNode();
  final FocusNode _degFocusNode = FocusNode();
  final FocusNode _specFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> emailFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> phone1FocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> phone2FocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> wappFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> expFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> degFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> specFocusNotifier = ValueNotifier<bool>(false);

    _emailFocusNode.addListener(() {
      emailFocusNotifier.value = _emailFocusNode.hasFocus;
    });
    _phone1FocusNode.addListener(() {
      phone1FocusNotifier.value = _phone1FocusNode.hasFocus;
    });
    _phone2FocusNode.addListener(() {
      phone2FocusNotifier.value = _phone2FocusNode.hasFocus;
    });
    _wappFocusNode.addListener(() {
      wappFocusNotifier.value = _wappFocusNode.hasFocus;
    });
    _expFocusNode.addListener(() {
      expFocusNotifier.value = _expFocusNode.hasFocus;
    });
    _degFocusNode.addListener(() {
      degFocusNotifier.value = _degFocusNode.hasFocus;
    });
    _specFocusNode.addListener(() {
      specFocusNotifier.value = _specFocusNode.hasFocus;
    });

    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F6FB),
        borderRadius: BorderRadius.circular(30)
      ),
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: height>700? 14 : 0),
            child: ValueListenableBuilder<bool>(
              valueListenable: emailFocusNotifier,
              builder: (context, hasFocus, child) {
                return SizedBox(
                  height: 60,
                  child: TextField(
                    focusNode: _emailFocusNode,
                    onChanged: (value) {
                      emailFocusNotifier.value = true;
                    },
                    style: TextStyle(
                      height: 1,
                      fontSize: TextResponsive.get(context, 14),
                    ),
                    onTap: () {
                      emailFocusNotifier.value = true;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Email*",
                      hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                        fontSize: TextResponsive.get(context, 14),
                        height: 1
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: emailFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Make sure that you have entered the correct Email ID.\n'
                    'This Email ID will be used for all official purposes and also communication.\n'
                    'Don\'t worry about the mistakes you make, it can be edited later when you see in the app.',
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
         Padding(
            padding: EdgeInsets.only(bottom: height>700? 14 : 0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                    focusNode: _phone1FocusNode,
                      style: TextStyle(
                        height: 1,
                        fontSize: TextResponsive.get(context, 14),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Phone Number*",
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                          fontSize: TextResponsive.get(context, 14),
                          height: 1
                        ),
                      ),
                    ),
                  )),
                const SizedBox(width: 8,),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                    focusNode: _phone2FocusNode,
                      style: TextStyle(
                        height: 1,
                        fontSize: TextResponsive.get(context, 14),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "PhoneNumber2",
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                          fontSize: TextResponsive.get(context, 14),
                          height: 1
                        ),
                      ),
                    ),
                  ))
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: phone1FocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Please enter 10 digit phone number.\nThis phone number will be visible to the patients for communication.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: phone2FocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter alternative phone number.\nIf you are entering landline number, please mention number along with STD code.\nMake sure that you have given correct STD code starting with zero(0) eg. 0823 986397 , 023 2165831, 036 2346877 etc.\nThe number should look like Eg. +91 084 4577299 in the end.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
           Padding(
            padding: EdgeInsets.only(bottom: height>700? 14 : 0),
            child: SizedBox(
                    height: 60,
              child: TextField(
                    focusNode: _wappFocusNode,
                      style: TextStyle(
                        height: 1,
                        fontSize: TextResponsive.get(context, 14),
                      ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "WhatsApp Number*",
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                  fontSize: TextResponsive.get(context, 14),
                  height: 1
                ),
                ),
              ),
            )),
            ValueListenableBuilder<bool>(
            valueListenable: wappFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Please enter 10 digit phone number.\nWhatsapp number can be same as the above contact number.\nThis phone number will be visible to the patients for communication.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
           Padding(
            padding: EdgeInsets.only(bottom: height>700? 14 : 0),
            child: SizedBox(
                    height: 60,
              child: TextField(
                focusNode: _expFocusNode,
                                    style: TextStyle(
                        height: 1,
                        fontSize: TextResponsive.get(context, 14),
                      ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Experience*",
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                    fontSize: TextResponsive.get(context, 14),
                    height: 1
                  ),
                ),
              ),
            )),
            ValueListenableBuilder<bool>(
            valueListenable: expFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'It should be witten in number of years.\nDont need to write YEARS, just write number eg. 5\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
           Padding(
            padding: EdgeInsets.only(bottom: height>700? 14 : 0),
            child: Row(
              children: [
                Expanded(
                  
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      focusNode: _degFocusNode,
                                          style: TextStyle(
                        height: 1,
                        fontSize: TextResponsive.get(context, 14),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Degree*",
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                          fontSize: TextResponsive.get(context, 14),
                          height: 1
                        ),
                      ),
                    ),
                  )),
                const SizedBox(width: 8,),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      focusNode: _specFocusNode,
                                          style: TextStyle(
                        height: 1,
                        fontSize: TextResponsive.get(context, 14),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Specialization*",
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                          fontSize: TextResponsive.get(context, 14),
                          height: 1
                        ),
                      ),
                    ),
                  ))
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: degFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Degree will appear in the app exactly how you write here.\nYou can also mention the University name or country name you studied from beside degree separated by comma ( , ) if you want it to be displayed in the app. eg. BDS, USA or BDS, UK or MDS, Boston University.\nIf you have multiple degree you can write together separated by comma     ( , ) if you want it to be displayed in the app.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: specFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Specialization will appear in the app exactly how you write here.\nYou can write like Dental Surgeon, Dental Specialist, Senior Dental Consultant etc.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: SizeResponsive.get(context, 45),
                    child: ElevatedButton(onPressed: (){
                    }, child: Text("SAVE", style: TextStyle(fontSize: TextResponsive.get(context, 18))
                    ))),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: SizeResponsive.get(context, 45),
                    child: ElevatedButton(onPressed: (){
                      viewModel.controller.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                    }, child: Text("NEXT", style: TextStyle(fontSize: TextResponsive.get(context, 18))))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}