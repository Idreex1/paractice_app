import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:paractice_app1/View/home/home_screen.dart';
import 'package:paractice_app1/helper/constants/animation_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Animationpage extends StatelessWidget {
  double height = 170;

  double width = 170;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Lottie.asset(AnimationConstant.splash_premium_anim2),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff292616),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                        child: Text(
                      'Powered By AI',
                      style: GoogleFonts.roboto(color: Color(0xffFFB751),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ]),
                SizedBox(
                  height: 08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enhance Photos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Boost Clarity,vibrancy,details and sharpness ',
                      style: TextStyle(
                        color: const Color.fromARGB(179, 233, 226, 226),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xff3DB3E5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Version 5.4',
                      style: TextStyle(
                        color: const Color.fromARGB(179, 233, 226, 226),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        backgroundColor: Color(0xff121212),
      ),
    );
  }
}
