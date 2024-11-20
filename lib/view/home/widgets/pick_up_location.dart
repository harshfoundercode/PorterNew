import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/home/widgets/use_current_location.dart';

class PickUpLocation extends StatefulWidget {
  const PickUpLocation({super.key});

  @override
  State<PickUpLocation> createState() => _PickUpLocationState();
}

class _PickUpLocationState extends State<PickUpLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: PortColor.grey,
          body: Column(children: [
            Container(
              padding:  EdgeInsets.symmetric(horizontal:screenWidth*0.06, vertical: screenHeight*0.01),
              height: screenHeight * 0.16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.025,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: screenHeight * 0.03,
                        color: PortColor.black.withOpacity(0.7),
                      )),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.03,
                        height: screenHeight * 0.01,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.047),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            constraints: BoxConstraints(maxHeight: screenHeight * 0.055),
                            hintText: "Where is your pickup?",
                            hintStyle: TextStyle(
                              color: PortColor.gray.withOpacity(0.5),
                              fontSize: 15,
                            ),
                            suffixIcon: const Icon(Icons.mic, color: PortColor.blue),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: PortColor.gray),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            filled: true,
                            fillColor: PortColor.white,
                          ),
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02),
              height: screenHeight * 0.16,
              color: PortColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleMedium(
                    text: "Recent Pickups",
                    color: PortColor.gray,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: PortColor.black.withOpacity(0.6),
                        size: screenHeight * 0.028,
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headingMedium(
                              text: "Sector H",
                              color: PortColor.black.withOpacity(0.6)),
                          titleMedium(
                              text:
                                  "Jankipuram,lucknow,UttarPradesh 2260..\nFouonder Code 6785467899",
                              color: PortColor.gray)
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Icon(
                            Icons.favorite_border_sharp,
                            color: PortColor.black.withOpacity(0.6),
                            size: screenHeight * 0.025,
                          ),
                          titleMedium(
                              text: "Save",
                              color: PortColor.black.withOpacity(0.6))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: screenHeight * 0.08,
              color: PortColor.white,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.my_location_outlined, color: PortColor.blue),
                  InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UseCurrentLocation(),
                          ),
                        );
                      },
                      child: headingMedium(text: " Use current location", color: PortColor.black)),
                  // SizedBox(width: screenWidth * 0.04),

                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: screenHeight*0.02),
                    child: VerticalDivider(
                      color: PortColor.gray.withOpacity(0.5),
                      thickness: screenWidth*0.002,
                    ),
                  ),

                  const Icon(Icons.location_on, color: PortColor.blue),
                  InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UseCurrentLocation(),
                          ),
                        );
                      },
                      child: headingMedium(text: " Locate on the map", color: PortColor.black)),
                ],
              ),
            )


          ])),
    );
  }
}
