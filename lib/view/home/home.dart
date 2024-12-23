import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/home/widgets/category_Grid.dart';
import 'package:porter/view/home/widgets/pick_up_location.dart';
import 'package:porter/view/home/widgets/see_what_new.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        title: const Text(
          "Exit App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: PortColor.blue),
        ),
        content: const Text(
          "Are you sure you want to exit this app?",
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Cancel button
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(), // Exit app
            child: const Text(
              "Exit",
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
        ],
      ),
    )

    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: PortColor.darkWhite,
        body: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenHeight * 0.11,
                  width: screenWidth,
                  color: PortColor.darkBlue,
                ),
                Positioned(
                  bottom: -30,
                  child: Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: PortColor.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PickUpLocation(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Image(
                            image: const AssetImage(Assets.assetsLocation),
                            height: screenHeight * 0.04,
                          ),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              titleMedium(
                                  text: 'Picked up from',
                                  color: PortColor.black),
                              elementsSmall(
                                  text: "Unnamed Road, Uttar Pradesh",
                                  color: PortColor.gray),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.keyboard_arrow_down_rounded,
                              color: PortColor.black),
                          SizedBox(
                            width: screenWidth * 0.02,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            const CategoryGrid(),
            Container(
              height: screenHeight * 0.8,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: PortColor.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [
                          PortColor.purple,
                          PortColor.lightPurple,
                          PortColor.blue
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage(Assets.assetsCoin),
                          height: 36,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleSmall(text: 'Explore Courier Reward'),
                            elementsSmall(
                              text: 'Earn 4 coins for every 100 spent',
                              color: PortColor.grayLight,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward,
                          color: PortColor.white,
                          size: screenHeight * 0.03,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: titleSmall(
                        text: "Announcements",
                        color: PortColor.gray,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: PortColor.grayLight.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: PortColor.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SeeWhatNew(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image(
                            image: const AssetImage(Assets.assetsSpeaker),
                            height: screenHeight * 0.065,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: titleMedium(
                              text: 'Packers & Movers',
                              color: PortColor.black,
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.025,
                            width: screenWidth * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: elementsSmall(
                                text: 'View all',
                                color: PortColor.blue,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Image(image: AssetImage(Assets.assetsCake)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}