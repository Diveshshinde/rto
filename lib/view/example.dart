// import 'package:cartoon_color_app/view/onboarding2.dart';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:dots_indicator/dots_indicator.dart';

// class Onboarding1 extends StatelessWidget {
//   const Onboarding1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/rectangle.png'),
//             fit: BoxFit.fitWidth,
//             alignment: Alignment.topCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: 50),
//             Text(
//               "Colourful Creations",
//               style: GoogleFonts.baloo2(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFFFFD600),
//                 letterSpacing: 1,
//               ),
//             ),

//             const SizedBox(height: 12),
//             Text(
//               "Create beautiful artwork with colours and make your imagination come to life!",

//               textAlign: TextAlign.center,
//               style: GoogleFonts.nunito(
//                 fontSize: 18,
//                 color: Colors.white,
//                 height: 1.5,
//               ),
//             ),
//             const SizedBox(height: 20),

//             Image.asset(
//               'assets/color-picker 1.png',
//               height: 300,
//               width: 300,
//               fit: BoxFit.fill,
//             ),

//             SizedBox(height: 20),
//             DotsIndicator(
//               dotsCount: 3,
//               position: 0,
//               decorator: DotsDecorator(
//                 size: const Size.square(10.0),
//                 activeSize: const Size(22.0, 10.0),
//                 activeShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 activeColor: const Color(0xFFFF6B4C),
//               ),
//             ),

//             const SizedBox(height: 20),

//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFFF6B4C),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 58,
//                   vertical: 12,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(26),
//                 ),
//                 elevation: 8,
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => Onboarding2()),
//                 );
//               },
//               child: Text(
//                 "Next",
//                 style: GoogleFonts.baloo2(
//                   color: Colors.white,
//                   fontSize: 21,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 22),
//           ],
//         ),
//       ),
//       bottomSheet: Image.asset(
//         'assets/playground.png',
//         width: 450,
//         height: 250,
//         fit: BoxFit.fitWidth,
//       ),
//     );
//   }
// }
