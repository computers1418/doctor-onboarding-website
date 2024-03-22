import 'package:doctor_app/pages/create/account_create_viewmodel.dart';
import 'package:flutter/material.dart';

class ExpertiseTab extends StatelessWidget {
  final AccountCreateViewModel viewModel;
  ExpertiseTab({super.key, required this.viewModel});

  final FocusNode _aboutFocusNode = FocusNode();
  final FocusNode _educationFocusNode = FocusNode();
  final FocusNode _specializationFocusNode = FocusNode();
  final FocusNode _experienceFocusNode = FocusNode();
  final FocusNode _membershipFocusNode = FocusNode();
  final FocusNode _achievementsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> aboutFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> educationFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> specializationFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> experienceFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> membershipFocusNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<bool> achievementsFocusNotifier = ValueNotifier<bool>(false);

    _aboutFocusNode.addListener(() {
      aboutFocusNotifier.value = _aboutFocusNode.hasFocus;
    });
    _educationFocusNode.addListener(() {
      educationFocusNotifier.value = _educationFocusNode.hasFocus;
    });
    _specializationFocusNode.addListener(() {
      specializationFocusNotifier.value = _specializationFocusNode.hasFocus;
    });
    _experienceFocusNode.addListener(() {
      experienceFocusNotifier.value = _experienceFocusNode.hasFocus;
    });
    _membershipFocusNode.addListener(() {
      membershipFocusNotifier.value = _membershipFocusNode.hasFocus;
    });
    _achievementsFocusNode.addListener(() {
      achievementsFocusNotifier.value = _achievementsFocusNode.hasFocus;
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
            padding: const EdgeInsets.only(bottom: 14),
            child: ValueListenableBuilder<bool>(
              valueListenable: aboutFocusNotifier,
              builder: (context, hasFocus, child) {
                return TextField(
                  focusNode: _aboutFocusNode,
                  onChanged: (value) {
                    aboutFocusNotifier.value = true;
                  },
                  onTap: () {
                    aboutFocusNotifier.value = true;
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "About",
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: aboutFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text('Read the example given below and write according to your comfort.\n“Dr. John has 20 years of expertise as a dentist, dental surgeon, and cosmetic dentist in Delhi. Dr. John practices at Dental Care Center in Delhi. He completed his BDS from Dental college in 2000 and MDS - Oral Medicine and radiology from the oxford dental college, Delhi in 2010. The dentist offers a variety of dental services, including impacted tooth extraction, crown and bridge repair, scaling, presurgical orthodontics, and cosmetic dentistry”.\nIf you dont have to time to write everthing, just write few of your main points Like “ 10 years of experience “, “ MDS degree from Mumbai”, “Services : Cosmetic surgery, Braces, Crowns, Disease evaluation, etc.”. Our specialists will write it down for you.\nGrammetical and spelling mistakes will be taken care by our specialists.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
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
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                  focusNode: _educationFocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Education"
                    ),
                  )),
                const SizedBox(width: 8,),
                Expanded(
                  child: TextField(
                  focusNode: _specializationFocusNode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Specialization"
                    ),
                  ))
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: educationFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Read the example given below and write according to your comfort.\nEg. BDS - Christian Dental College - 2000\nEg. MDS - Oral Medicine and Radiology - The Oxford dental College, Delhi - 2010.\nEg. Certificate of dental implants - Osstem Implants - 2002\nEg. Certificate of aesthetic dentistry - New York University, USA - 2008\nEg. Certificate of Full Mouth Rehabilitation - USA - 2010\nIf you have multiple Degrees you can write one below the other in points.\nGrammetical and spelling mistakes will be taken care by our specialists.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
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
            valueListenable: specializationFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Read the example given below and write according to your comfort.\nEg. Dentist, Dental Surgeon, Cosmetic Dentist, Implantology, Periodontist, Oral and MaxilloFacial Surgeon etc.\nIf you have multiple Specialization you can write one below the other in points.\nGrammetical and spelling mistakes will be taken care by our specialists.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
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
            padding: const EdgeInsets.only(bottom: 14),
            child: TextField(
                  focusNode: _experienceFocusNode,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Experience"
              ),
            )),
            ValueListenableBuilder<bool>(
            valueListenable: experienceFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Read the example given below and write according to your comfort.\nEg. 2010 - 2014 Assistant Professor at Oxford dental college.\nEg. 2001 - Present Senior Surgeon at Vistar Dental Hospital.\nEg. 2006 - 2010 Doctor at JSS Medical College.\nEg. 2014 - 2020 Consultant Periodontist at KM Dental Clinic.\nIf you have multiple Experiences you can write one below the other in points.\nGrammetical and spelling mistakes will be taken care by our specialists.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
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
            padding: const EdgeInsets.only(bottom: 14),
            child: TextField(
                  focusNode: _membershipFocusNode,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Membership"
              ),
            )),
            ValueListenableBuilder<bool>(
            valueListenable: membershipFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Read the example given below and write according to your comfort.\nEg. Rajyapuaskar by government for the service of mankind.\nEg. Memorial award for academic excellence.\nEg. 10th rank in all india entrance.\nEg. Maximum number of Implants placed in thesis.\nEg. More than 15 publications on your name.\nEg. Best Paper Award in Indian Society of Periodontics National Conference.\nIf you have multiple Achievements you can write one below the other in points.\nGrammetical and spelling mistakes will be taken care by our specialists.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
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
            padding: const EdgeInsets.only(bottom: 14),
            child: TextField(
                  focusNode: _achievementsFocusNode,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Achievements"
              ),
            )),
            ValueListenableBuilder<bool>(
            valueListenable: achievementsFocusNotifier,
            builder: (context, hasFocus, child) {
              if (hasFocus) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Read the example given below and write according to your comfort.\nEg. Indian Dental Association.\nEg. Indian Society of Periodontology.\nEg. Indian Society of Oral Implantology.\nEg. Indian Prosthodontic Society.\nEg. State Dental Council.\nEg. Indian Association of Oral Medicine and Radiology.\nIf you have multiple Membership you can write one below the other in points.\nGrammetical and spelling mistakes will be taken care by our specialists.\nDont worry about the mistakes you make , it can be edited later wheN you see in the app.',
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
                    height: 45,
                    child: ElevatedButton(onPressed: (){}, child: const Text("SAVE"))),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(onPressed: (){
                      viewModel.controller.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.linear);
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