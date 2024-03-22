import 'package:doctor_app/constants/colors_const.dart';
import 'package:doctor_app/responsive/size_responsive.dart';
import 'package:doctor_app/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
           Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                child: CircleAvatar(
                  radius: SizeResponsive.get(context, 26),
                  backgroundColor: Colors.black,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: SizeResponsive.get(context, 20),),
                ),
              ),
              Text("User name", style: TextStyle(
                fontFamily: "Kumbhsans",
                fontSize: TextResponsive.get(context, 14),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF363636)
              ))
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Express Pass", style: TextStyle(
                        fontFamily: "Aloevera",
                        fontSize: TextResponsive.get(context, 14),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF363636)
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: ["1", "2", "3", "4"].map((e) =>
                          Container(
                            height: 32,
                            width: 38,
                            margin: const EdgeInsets.only(left: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffF7F6FB)
                            ),
                            child: Text(e, style: TextStyle(
                              fontFamily: "Kumbhsans",
                              fontSize: TextResponsive.get(context, 12),
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFF363636)
                            )),
                          )
                        ).toList(),
                      ),
                    ),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 34,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorsConst.primary
                          ),
                          child: Text("Skip", style: TextStyle(
                            fontFamily: "Kumbhsans",
                            fontSize: TextResponsive.get(context, 12),
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
      
        ],
      ),
    );
  }
}