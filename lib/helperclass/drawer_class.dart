import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/frame.png', fit: BoxFit.contain),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'About',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.language, color: Colors.blue),
            title: Text('Language'),
            subtitle: Text('English'),
          ),

       
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined, color: Colors.blue),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              showPrivacyPolicyDialog(context);
            },
          ),

         
          ListTile(
            leading: const Icon(Icons.send, color: Colors.blue),
            title: const Text('Share With Friends'),
            onTap: () {
              Navigator.pop(context);

              Share.share(
                "Check out this amazing RTO learning app!\n"
                "Download here:\n"
                "https://play.google.com/store/apps/details?id=com.yourapp.package",
                subject: "RTO App",
              );
            },
          ),

        
          ListTile(
            leading: const Icon(Icons.description_outlined, color: Colors.blue),
            title: const Text('Terms & Conditions'),
            onTap: () {
              Navigator.pop(context);
              showTermsDialog(context);
            },
          ),

         
          ListTile(
            leading: const Icon(Icons.star_border, color: Colors.blue),
            title: const Text('Rate Us'),
            onTap: () {
              Navigator.pop(context); 
              showRateUsDialog(context);
            },
          ),

          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'App Version\n1.0',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
  );
}


void showPrivacyPolicyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.blue.shade700,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Privacy Policy",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "We collect basic, anonymous usage data only to improve app performance and user experience. "
                "We do not sell or share your personal data with third parties.",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                "You can stop all data collection at any time by uninstalling the app.",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


void showTermsDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: Colors.blue.shade700,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "By using this app, you agree to use it for learning and practice purposes only. "
                "We try to keep content accurate, but we do not guarantee that all questions or rules "
                "are always up to date for every region.",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                "Always verify important information with official RTO sources.",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


void showRateUsDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      double rating = 0;

      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Rate Us",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          size: 32,
                          color: Colors.amber,
                        ),
                        onPressed: () {
                          setState(() {
                            rating = index + 1.0;
                          });
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        debugPrint("User rating: $rating");
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}