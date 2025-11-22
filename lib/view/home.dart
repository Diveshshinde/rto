import 'package:flutter/material.dart';
import 'package:rto_app/helperclass/drawer_class.dart';
import 'package:rto_app/view/main_navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),

      appBar: AppBar(
        backgroundColor: Colors.transparent,

        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Rectangle 18901@4x (1).png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          Align(
            alignment: const Alignment(0, -0.5),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavigation(),
                  ),
                );
              },
              child: Image.asset(
                'assets/Component 3@4x.png',
                height: 310,
                width: 360,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBottomCard(Icons.share, "Share App"),
                  buildBottomCard(Icons.lock, "Privacy\nPolicy"),
                  buildBottomCard(Icons.star, "Rate App"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  

  Widget buildBottomCard(IconData icon, String text) {
    return Container(
      height: 125,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 3),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xFF0046FF), size: 36),
          const SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
