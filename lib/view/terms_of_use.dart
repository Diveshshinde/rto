import 'package:flutter/material.dart';
import 'package:rto_app/view/home.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Terms of Use",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "The application is notifying you to the presence of an app that provides several services that are essential information for safer and more efficient use.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),

              const SizedBox(height: 15),

              const Text(
                "User-Generated content policy (UGC) by pressing the accept button:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 15),

              _buildPoint(
                Icons.check_circle,
                "I declare I have read and accepted the following condition of use.",
              ),
              _buildPoint(
                Icons.lock,
                "If we find the app is being used outside its terms of use, we may restrict access to it.",
              ),
              _buildPoint(
                Icons.settings,
                "Any type of modification to the app or its components is not allowed.",
              ),
              _buildPoint(
                Icons.privacy_tip,
                "Privacy Policy may be updated from time to time for any reason. We will notify you of any changes to our Privacy Policy by posting the new Privacy Policy here.",
              ),
              _buildPoint(
                Icons.person_off,
                "We do not share any kind of your Personal Data with third parties.",
              ),

              const SizedBox(height: 20),

              const Text(
                "You can find out more information by clicking on the following link:",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              const Text(
                "Terms and conditions of use",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),

              const SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Accept",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildPoint(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
