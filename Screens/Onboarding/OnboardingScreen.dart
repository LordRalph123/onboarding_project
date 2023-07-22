import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(urlImage, fit: BoxFit.cover, width: double.infinity),
            const SizedBox(height: 34),
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF332E28),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: Color(0xFF332E28),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
          padding: const EdgeInsets.only(bottom: 290),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 3;
              });
            },
            children: [
              buildPage(
                  color: Colors.white,
                  urlImage: "assets/healthy.jpg",
                  title: "Healthy Meals",
                  subtitle:
                      "We not only provide you with dellicious\n meals but also with meals that cater for\nthe proper development of your body."),
              buildPage(
                  color: Colors.white,
                  urlImage: "assets/calender.jpg",
                  title: "Food Schedule",
                  subtitle:
                      "You not only get to make your order\n get to your doorstep, but you can decide\n when it gets to you"),
              buildPage(
                  color: Colors.white,
                  urlImage: "assets/delivery.jpg",
                  title: "Fast Delivery",
                  subtitle:
                      "We make sure that your meal gets to\n you in the shortest possible time"),
              buildPage(
                  color: Colors.white,
                  urlImage: "assets/location.jpg",
                  title: "Track Delivery",
                  subtitle:
                      "You can track the delivery of your meal\n from our restaurant to your doorstep"),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: 280,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26, 50, 26, 62),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: const WormEffect(
                          spacing: 5,
                          dotColor: Color(0XFFFDD69B),
                          dotHeight: 7,
                          dotWidth: 7,
                          activeDotColor: Color(0xFFFA9B0D),
                        )),
                    MaterialButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child: Container(
                        width: 276,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFFFA9B0D)),
                        child: const Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.jumpToPage(4);
                      },
                      child: Container(
                        width: 276,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFFA9B0D))),
                        child: const Center(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFA9B0D),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
