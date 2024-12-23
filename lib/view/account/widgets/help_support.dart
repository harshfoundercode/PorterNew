import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/launcher.dart';
import 'package:porter/view_model/help_and_support_view_model.dart';
import 'package:provider/provider.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final helpAndSupportViewModel =
          Provider.of<HelpAndSupportViewModel>(context, listen: false);
      helpAndSupportViewModel.helpSupportApi();
      //print("helpSupport");
    });
  }

  @override
  Widget build(BuildContext context) {
    // final helpAndSupportViewModel = Provider.of<HelpAndSupportViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.07,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: PortColor.white,
              ),
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.04),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: PortColor.black,
                      size: screenHeight * 0.025,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.25),
                  headingMedium(
                    text: "Contact Support",
                    color: PortColor.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.023,
              ),
              child: headingMedium(
                text: "Need help with your orders?",
                color: PortColor.black.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Container(
                width: screenWidth * 0.88,
                decoration: BoxDecoration(
                  color: PortColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Container(
                    width: screenWidth * 0.88,
                    decoration: BoxDecoration(
                      color: PortColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(),
                          leading: Image.asset(Assets.assetsBiketruck),
                          title: headingMedium(
                            text: 'Trucks and 2 Wheelers',
                            color: PortColor.black,
                          ),
                          trailing: GestureDetector(
                            onTap: () =>
                                Launcher.launchDialPad(context, '9876543210'),
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                color: PortColor.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.call_outlined,
                                color: PortColor.blue,
                                size: screenHeight * 0.025,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(),
                          leading: Image.asset(Assets.assetsDeliveryman),
                          title: headingMedium(
                            text: 'Packers and Movers',
                            color: PortColor.black,
                          ),
                          trailing: GestureDetector(
                            onTap: () =>
                                Launcher.launchDialPad(context, '1234567890'),
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                color: PortColor.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.call_outlined,
                                color: PortColor.blue,
                                size: screenHeight * 0.025,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(),
                          leading: Image.asset(Assets.assetsMap),
                          title: headingMedium(
                            text: 'All India Parcel',
                            color: PortColor.black,
                          ),
                          trailing: GestureDetector(
                            onTap: () =>
                                Launcher.launchDialPad(context, '1122334455'),
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                color: PortColor.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.call_outlined,
                                color: PortColor.blue,
                                size: screenHeight * 0.025,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                height: screenHeight * 0.08,
                width: screenWidth * 0.88,
                decoration: BoxDecoration(
                  color: PortColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    titleMedium(
                      text: "Any Other question?\nCall or Mail us !",
                      color: PortColor.black,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Launcher.launchEmail(
                          context, 'foundercodetechteam@gmail.com'),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: PortColor.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.mail_outline,
                          color: PortColor.blue,
                          size: screenHeight * 0.025,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    GestureDetector(
                      onTap: () =>
                          Launcher.launchDialPad(context, '1122334455'),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: PortColor.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call_outlined,
                          color: PortColor.blue,
                          size: screenHeight * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
