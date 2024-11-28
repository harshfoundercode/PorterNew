import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/const_map.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/custom_text_field.dart';

class UseCurrentLocation extends StatefulWidget {
  const UseCurrentLocation({super.key});

  @override
  State<UseCurrentLocation> createState() => _UseCurrentLocationState();
}

class _UseCurrentLocationState extends State<UseCurrentLocation> {
  bool isContactDetailsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ConstMap(),
      bottomSheet: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          color: PortColor.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: screenHeight * 0.5,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                        image: const AssetImage(Assets.assetsLocation),
                        height: screenHeight * 0.035,
                      ),
                      SizedBox(width: screenWidth * 0.009),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleMedium(text: "Sector H", color: PortColor.black),
                          SizedBox(height: screenHeight * 0.007),
                          elementsMedium(
                              text: "Sector H, Jankipuram Lucknow..",
                              color: PortColor.black),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: screenHeight * 0.038,
                        width: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: PortColor.gray),
                        ),
                        child: Center(
                          child: elementsMedium(
                            text: "Change",
                            color: PortColor.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.037),
                   CustomTextField(
                     height: screenHeight*0.055,
                     cursorHeight: screenHeight*0.023,
                     labelText: "House/Apartment/Shop (optional)",
                  ),
                  SizedBox(height: screenHeight * 0.03),
                   CustomTextField(
                    height: screenHeight*0.055,
                     cursorHeight: screenHeight*0.023,
                     labelText: "Sender's Name",
                    suffixIcon:
                    Icon(Icons.perm_contact_cal_outlined, color: PortColor.blue),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                   CustomTextField(
                     height: screenHeight*0.055,
                     cursorHeight: screenHeight*0.023,
                     labelText: "Sender's Mobile Number",
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isContactDetailsSelected = !isContactDetailsSelected;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: screenHeight * 0.025,
                          width: screenWidth * 0.056,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PortColor.blue,
                              width: screenWidth * 0.004,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            color: isContactDetailsSelected
                                ? PortColor.blue
                                : Colors.transparent,
                          ),
                          child: isContactDetailsSelected
                              ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: screenHeight * 0.02,
                          )
                              : null,
                        ),
                        SizedBox(width: screenWidth * 0.028),
                        titleMedium(
                          text: "Use My Mobile Number: 2123212321",
                          color: PortColor.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  elementsMedium(
                    text: "Save as (optional):",
                    color: PortColor.gray,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.036,
                        decoration: BoxDecoration(
                          border: Border.all(color: PortColor.gray),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home_filled,
                              color: PortColor.black,
                              size: screenHeight * 0.02,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            titleMedium(
                              text: "Home",
                              color: PortColor.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.036,
                        decoration: BoxDecoration(
                          border: Border.all(color: PortColor.gray),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(Assets.assetsShop),
                              height: screenHeight * 0.03,
                            ),
                            titleMedium(
                              text: "Shop",
                              color: PortColor.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.036,
                        decoration: BoxDecoration(
                          border: Border.all(color: PortColor.gray),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: PortColor.black,
                              size: screenHeight * 0.02,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            titleMedium(
                              text: "Other",
                              color: PortColor.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.09,
              decoration: BoxDecoration(
                color: PortColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.017,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.03,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: isContactDetailsSelected ? PortColor.blue : PortColor.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: headingMedium(
                    text: "Enter Contact Details",
                    color: isContactDetailsSelected ? Colors.white : PortColor.gray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
