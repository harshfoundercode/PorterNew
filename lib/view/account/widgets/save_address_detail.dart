import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';

class SaveAddressDetail extends StatefulWidget {
  const SaveAddressDetail({super.key});

  @override
  State<SaveAddressDetail> createState() => _SaveAddressDetailState();
}

class _SaveAddressDetailState extends State<SaveAddressDetail> {
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
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
                    text: "Saved Addresses",
                    color: PortColor.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: PortColor.grey.withOpacity(0.5),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: PortColor.blue.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: PortColor.blue,
                      size: screenHeight * 0.025,
                    ),
                  ),
                  title: titleMedium(
                      text: "Add New Address", color: PortColor.blue),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: PortColor.black,
                    size: screenHeight * 0.02,
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05),
              child: titleSmall(text: "Your saved address ", color: PortColor.black.withOpacity(0.6)),
            ),
            SizedBox(height: screenHeight*0.02,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.04,vertical: screenHeight*0.02),
                height: screenHeight * 0.21,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: PortColor.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(Assets.assetsShop),
                          height: screenHeight * 0.038,
                        ),
                        SizedBox(width: screenWidth*0.02,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headingMedium(text: "Shop", color: PortColor.black),
                            titleMedium(
                                text: "Founder code technol pvt ltd.7345678998",
                                color: PortColor.gray)
                          ],
                        )
                      ],
                    ),
                    Divider(
                      thickness: screenWidth * 0.001,
                    ),
                    titleMedium(
                        text:
                            "Chandrika Devi Temple Parking Area Mandir road\nlucknow Uttar Pradesh,India ",
                        color: PortColor.gray),
                    SizedBox(height: screenHeight*0.01,),
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.046,
                          width: screenWidth * 0.35,
                          decoration: BoxDecoration(
                              color: PortColor.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: elementsMedium(
                                  text: 'Edit', color: PortColor.blue)),
                        ),
                        SizedBox(width: screenWidth * 0.1),
                        Container(
                          height: screenHeight * 0.046,
                          width: screenWidth * 0.35,
                          decoration: BoxDecoration(
                              color: PortColor.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: elementsMedium(
                                  text: 'Delete', color: PortColor.blue)),
                        ),
                      ],
                    )
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
