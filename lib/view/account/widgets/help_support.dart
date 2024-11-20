import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  final List<Map<String, dynamic>> supportItems = [
    {
      'image': Assets.assetsBiketruck,
      'title': 'Trucks and 2 Wheelers',
      'iconColor': PortColor.blue,
    },
    {
      'image': Assets.assetsDeliveryman,
      'title': 'Packers and Movers',
      'iconColor': PortColor.blue,
    },
    {
      'image': Assets.assetsMap,
      'title': '  All India Parcel',
      'iconColor': PortColor.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.07,
              width: screenWidth,
              decoration: BoxDecoration(
                color: PortColor.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.04,
                  ),
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
                  SizedBox(
                    width: screenWidth * 0.25,
                  ),
                  headingMedium(
                    text: "Contact Support",
                    color: PortColor.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.023),
              child: headingMedium(
                text: "Need help with your orders?",
                color: PortColor.black.withOpacity(0.5),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05),
              child: Container(
                width: screenWidth * 0.88,
                decoration: BoxDecoration(
                  color: PortColor.white,

                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: supportItems.map((item) {
                    return ListTile(
                      leading: Image(image: AssetImage(item['image'],)),
                      title: titleMedium(
                        text: item['title'],
                        color: PortColor.black,
                      ),
                      trailing: Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: PortColor.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call_outlined,
                          color: item['iconColor'],
                          size: screenHeight * 0.025,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.02),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
                height: screenHeight*0.08,
                width: screenWidth*0.88,
                decoration: BoxDecoration(
                  color: PortColor.white,
                  borderRadius: BorderRadius.circular(8),

                ),
                child: Row(
                  children: [
                    titleMedium(text: "Any Other question?\nCall or Mail us !",color: PortColor.black),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: PortColor.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mail_outline,
                        color: PortColor.blue,
                        size: screenHeight * 0.025,
                      ),
                    ),
                    SizedBox(width: screenWidth*0.05,),
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: PortColor.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.call_outlined,
                        color: PortColor.blue,
                        size: screenHeight * 0.025,
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
