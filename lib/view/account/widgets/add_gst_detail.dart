import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';

class AddGstDetail extends StatefulWidget {
  const AddGstDetail({super.key});

  @override
  State<AddGstDetail> createState() => _AddGstDetailState();
}

class _AddGstDetailState extends State<AddGstDetail> {
  String _availability = "Available";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03),
              height: screenHeight * 0.07,
              width: screenWidth,
              decoration: BoxDecoration(
                color: PortColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
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
                 Spacer(),
                  headingMedium(
                    text: "Saved",
                    color: PortColor.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth*0.045,top: screenHeight*0.02),
              child: elementsSmall(text: "Mobile Number", color: PortColor.gray),
            ),
            SizedBox(height: screenHeight*0.003,),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth*0.045,bottom: screenHeight*0.01),
              child: Row(
                children: [
                  titleSmall(text: "7234567656", color: PortColor.black),
                  SizedBox(width: screenWidth*0.02,),
                  elementsSmall(text: "Cannot be changed", color: PortColor.gray)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.04),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03, vertical: screenHeight * 0.035),
                height: screenHeight * 0.45,
                decoration: BoxDecoration(
                  color: PortColor.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Founder Code Technology",
                        hintStyle: TextStyle(
                          color: PortColor.black.withOpacity(0.7),
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PortColor.grey,
                            width: screenWidth * 0.002,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PortColor.grey,
                            width: screenWidth * 0.002,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Pvt Ltd",
                        hintStyle: TextStyle(
                          color: PortColor.black.withOpacity(0.7),
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PortColor.grey,
                            width: screenWidth * 0.002,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PortColor.grey,
                            width: screenWidth * 0.002,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "info@foundercodes.com",
                        hintStyle: TextStyle(
                          color: PortColor.black.withOpacity(0.7),
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PortColor.grey,
                            width: screenWidth * 0.002,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PortColor.grey,
                            width: screenWidth * 0.002,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: screenHeight*0.04,),
                    titleSmall(text: "GST Details", color: PortColor.black.withOpacity(0.7)),
                    SizedBox(height:screenHeight*0.01 ,),
                Row(
                  children: [
                    headingMedium(text: _availability, color: PortColor.black),
                    const Spacer(),
                    PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: PortColor.black,
                      ),
                      onSelected: (String value) {
                        setState(() {
                          _availability = value;
                        });
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Available',
                          child: Text('Available'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Not available',
                          child: Text('Not available'),
                        ),
                      ],
                    ),
                  ],
                ),
                  ],
                ),
              )

            )
          ],
        ),
      ),
    );
  }
}
