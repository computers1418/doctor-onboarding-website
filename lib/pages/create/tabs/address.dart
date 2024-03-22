import 'package:doctor_app/constants/colors_const.dart';
import 'package:doctor_app/pages/create/account_create_viewmodel.dart';
import 'package:doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AddressTab extends StatelessWidget {
  final AccountCreateViewModel viewModel;
  AddressTab({super.key, required this.viewModel});

  final FocusNode _addressLine1FocusNode = FocusNode();
  final FocusNode _addressLine2FocusNode = FocusNode();
  final FocusNode _addressLine3FocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _zipCodeFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> addressLine1FocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> addressLine2FocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> addressLine3FocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> cityFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> zipCodeFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> stateFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> countryFocusNotifier = ValueNotifier<bool>(false);

    _addressLine1FocusNode.addListener(() {
      addressLine1FocusNotifier.value = _addressLine1FocusNode.hasFocus;
    });
    _addressLine2FocusNode.addListener(() {
      addressLine2FocusNotifier.value = _addressLine2FocusNode.hasFocus;
    });
    _addressLine3FocusNode.addListener(() {
      addressLine3FocusNotifier.value = _addressLine3FocusNode.hasFocus;
    });
    _cityFocusNode.addListener(() {
      cityFocusNotifier.value = _cityFocusNode.hasFocus;
    });
    _zipCodeFocusNode.addListener(() {
      zipCodeFocusNotifier.value = _zipCodeFocusNode.hasFocus;
    });
    _stateFocusNode.addListener(() {
      stateFocusNotifier.value = _stateFocusNode.hasFocus;
    });
    _countryFocusNode.addListener(() {
      countryFocusNotifier.value = _countryFocusNode.hasFocus;
    });

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
            padding: const EdgeInsets.only(bottom: 10),
            child: ValueListenableBuilder<bool>(
              valueListenable: addressLine1FocusNotifier,
              builder: (context, hasFocus, child) {
                return TextField(
                  focusNode: _addressLine1FocusNode,
                  onChanged: (value) {
                    addressLine1FocusNotifier.value = true;
                  },
                  onTap: () {
                    addressLine1FocusNotifier.value = true;
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Address Line 1*",
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: addressLine1FocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter clinic name.\nKeep address precise and minimal.\nDont worry about the mistakes you make , it can be edited later when you see in the app.',
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
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                  focusNode: _addressLine2FocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Address Line 2*"
                    ),
                  )),
                const SizedBox(width: 8,),
                Expanded(
                  child: TextField(
                  focusNode: _addressLine3FocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Address Line 3"
                    ),
                  ))
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: addressLine2FocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter street name, Bulilding name.\nKeep address precise and minimal.\nDont worry about the mistakes you make , it can be edited later when you see in the app.',
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
            valueListenable: addressLine3FocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter road name, Landmark.\nKeep address precise and minimal.\nDont worry about the mistakes you make , it can be edited later when you see in the app.',
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
            padding: const EdgeInsets.only(bottom: 10),
             child: Row(
              children: [
                Expanded(
                  child: TextField(
                        focusNode: _cityFocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "City *"
                    ),
                  )),

                const SizedBox(width: 10,),
             
                Expanded(
                  child: TextField(
                    focusNode: _zipCodeFocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Zip code*"
                    ),
                  )),
              ],
             ),
           ),
            ValueListenableBuilder<bool>(
            valueListenable: cityFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter city name. eg. Delhi, Bangalore, Goa etc.\nDont worry about the mistakes you make , it can be edited later when you see in the app.',
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
            valueListenable: zipCodeFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter proper zip code of your city.\nDont worry about the mistakes you make , it can be edited later when you see in the app.',
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
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  
                  child: TextField(
                    focusNode: _stateFocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "State *"
                    ),
                  )),
                const SizedBox(width: 8,),
                Expanded(
                  child: TextField(
                    focusNode: _countryFocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Country*"
                    ),
                  ))
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: stateFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter your State name.\nDont worry about the mistakes you make , it can be edited later when you see in the app.',
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
            valueListenable: countryFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Enter your Country name.\nDont worry about the mistakes you make , it can be edited later when you see in the app.',
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
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                      alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF20AFA9),
                    borderRadius: BorderRadius.circular(30)
                  ),
                    child: const Text("Upload Location Coordinates", textAlign: TextAlign.center, style: TextStyle(
                        fontFamily: "Aloevera",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                  ),
                ),
                const SizedBox(width: 12,),
                Expanded(child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 44,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF20AFA9),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: const Text("Upload ID Proof", textAlign: TextAlign.center, style: TextStyle(
                        fontFamily: "Aloevera",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                    ),
                    const SizedBox(height: 12,),
                    Container(
                      height: 44,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF20AFA9),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: const Text("Upload Doctor License", textAlign: TextAlign.center,style: TextStyle(
                        fontFamily: "Aloevera",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                    )
                  ],
                ))
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
            child: Text("Documents must be PDF, DOCX, JPEG or PNG", style: TextStyle(
              fontFamily: "Aloevera",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: ColorsConst.primary,
            )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4, right: 4),
                    child: Icon(Icons.circle, color: ColorsConst.primary, size: 8,)),
                  Expanded(
                    child: Text("I agree to the terms and condition and the privacy policy.", style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF363636),
                    )),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(onPressed: (){}, child: const Text("SAVE"))),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, Routes.authComplete, (route) => false);
                    }, child: const Text("NEXT"))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}