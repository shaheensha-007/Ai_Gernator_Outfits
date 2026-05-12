import 'package:ai_gernator_outfits/features/auth/Screen/Login_Screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> data = [
    {
      "title": "Begin Your Chapter of Love",
      "subtitle":
      "Embrace the dating world armed with tools and support",
    },
    {
      "title": "Find Your Perfect Match",
      "subtitle": "Discover people that truly match your vibe",
    },
    {
      "title": "Start Chatting Instantly",
      "subtitle": "Connect and build meaningful relationships",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Background Image (same for all pages)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), // your image
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🔹 Content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: data.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /// Title
                            Text(
                              data[index]["title"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 10),

                            /// Subtitle
                            Text(
                              data[index]["subtitle"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(height: 20),

                            /// Dots Indicator
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                data.length,
                                    (i) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  width: currentIndex == i ? 10 : 8,
                                  height: currentIndex == i ? 10 : 8,
                                  decoration: BoxDecoration(
                                    color: currentIndex == i
                                        ? Colors.purple
                                        : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 30),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// 🔹 Button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      if (currentIndex == data.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LoginScreen()),
                        );
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == data.length - 1
                          ? "Find Someone"
                          : "Next",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}