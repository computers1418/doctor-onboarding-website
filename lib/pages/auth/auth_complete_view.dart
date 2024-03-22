import 'package:doctor_app/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthCompleteView extends StatefulWidget {
  const AuthCompleteView({super.key});

  @override
  State<AuthCompleteView> createState() => _AuthCompleteViewState();
}

class _AuthCompleteViewState extends State<AuthCompleteView> {

  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    //   statusBarColor: Colors.white.withOpacity(0.6),
    //   statusBarIconBrightness: Brightness.dark,
    // ));

    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Column(
            children: [
        
              Expanded(child: Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset("res/images/3d-check.png")
              )),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: index==0
                ? RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "Your ", style: TextStyle(
                        color: Color(0xFF363636),
                        fontSize: 32,
                        fontFamily: "Aloevera",
                        fontWeight: FontWeight.w600
                      )),
                      TextSpan(text: "Progress Is Saved", style: TextStyle(
                        color: ColorsConst.primary,
                        fontSize: 32,
                        fontFamily: "Aloevera",
                        fontWeight: FontWeight.w600
                      ))
                    ]
                  )
                ) : RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "You've Used ", style: TextStyle(
                        color: Color(0xFF363636),
                        fontSize: 30,
                        fontFamily: "Aloevera",
                        fontWeight: FontWeight.w600
                      )),
                      TextSpan(text: "Express Pass ", style: TextStyle(
                        color: ColorsConst.primary,
                        fontSize: 30,
                        fontFamily: "Aloevera",
                        fontWeight: FontWeight.w600
                      )),
                      TextSpan(text: "To Streamline Your Registration", style: TextStyle(
                        color: Color(0xFF363636),
                        fontSize: 30,
                        fontFamily: "Aloevera",
                        fontWeight: FontWeight.w600
                      )),
                    ]
                  )
                ),  
              ),
        
              Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(index==0 
                ? "To Finalize Your Registration, Please Complete Your Payment."
                : "Our Executives Will Be Contacting You Soon To Confirm Your Details. In The Meantime, You Can Complete Your Registration By Making The Payment.", style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,)),
        
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Image.asset("res/images/payments.png"),  
              ),
        
        
              SizedBox(
                height: MediaQuery.of(context).size.width/1.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
        
                    Positioned(
                      left: -1.7*MediaQuery.of(context).size.width/2,
                      bottom: -350,
                      child: CircleAvatar(
                        backgroundColor: ColorsConst.secondaryLight,
                        radius: MediaQuery.of(context).size.width*0.8,
                      ),
                    ),
        
                    Positioned(
                      right: -1.7*MediaQuery.of(context).size.width/2,
                      bottom: -350,
                      child: CircleAvatar(
                        backgroundColor: ColorsConst.secondary,
                        radius: MediaQuery.of(context).size.width*0.8,
                      ),
                    ),
        
                    Positioned(
                      bottom: 16,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text('Go To Payment', style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Aloevera",
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                            )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()=>setState(()=>index=1),
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.arrow_forward_outlined, color: Color(0xFF363636), size: 30,),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
        
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}