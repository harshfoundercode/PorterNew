import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';

class ReviewBooking extends StatefulWidget {
  const ReviewBooking({super.key});

  @override
  State<ReviewBooking> createState() => _ReviewBookingState();
}

class _ReviewBookingState extends State<ReviewBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PortColor.grey,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.009),
            height: screenHeight * 0.07,
            width: screenWidth,
            decoration: BoxDecoration(
              color: PortColor.white,
              boxShadow: [
                BoxShadow(
                  color: PortColor.gray.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: screenHeight * 0.025,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: screenWidth * 0.04),
                titleSmall(
                  text: "Review Booking",
                  color: PortColor.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.035, vertical: screenHeight * 0.02),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.018),
              height: screenHeight * 0.17,
              decoration: BoxDecoration(
                  color: PortColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(Assets.assetsBookingtruck),
                        height: screenHeight * 0.065,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headingMedium(
                              text: "Tata Ace", color: PortColor.black),
                          titleMedium(
                              text: "View Address detail", color: Colors.blue),
                        ],
                      ),
                      Spacer(),
                      headingMedium(text: "14 mins", color: Colors.green),
                      elementsMedium(text: "away", color: Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          PortColor.lightGreen,
                          PortColor.lightGreen2,
                          PortColor.white,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: screenHeight * 0.023,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        elementsSmall(
                            text: "Free",
                            color: PortColor.black.withOpacity(0.6)),
                        titleMedium(text: " 70 mins ", color: PortColor.black),
                        elementsSmall(
                            text: "of loading and unloading tome include.",
                            color: PortColor.black.withOpacity(0.6)),
                        Icon(
                          Icons.info_outline,
                          color: PortColor.blue,
                          size: screenHeight * 0.025,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child: titleSmall(
                text: "Offers and Discounts", color: PortColor.black),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child: Container(
              height: screenHeight * 0.08,
              decoration: BoxDecoration(
                color: PortColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(Assets.assetsPop),
                    height: screenHeight * 0.05,
                  ),
                  headingMedium(text: "You Saved", color: PortColor.black),
                  headingMedium(text: "₹75", color: Colors.green),
                  headingMedium(
                      text: "with FIRST20 🎉", color: PortColor.black),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  headingMedium(text: "Remove", color: Colors.blue),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child: titleSmall(text: "Fare Summary", color: PortColor.black),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.028),
              height: screenHeight * 0.27,
              decoration: BoxDecoration(
                color: PortColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      headingMedium(
                          text: "Trip Fare",
                          color: PortColor.black.withOpacity(0.8)),
                      headingMedium(
                          text: "(incl.Toll)",
                          color: PortColor.black.withOpacity(0.5)),
                      Spacer(),
                      headingMedium(text: "₹582.24", color: PortColor.black),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.012,
                  ),
                  Row(
                    children: [
                      headingMedium(
                          text: "Coupon Discount-First 20",
                          color: PortColor.black.withOpacity(0.8)),
                      Spacer(),
                      headingMedium(text: "₹75", color: Colors.green),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Divider(),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    children: [
                      headingMedium(
                          text: "Net Fare",
                          color: PortColor.black.withOpacity(0.8)),
                      Spacer(),
                      headingMedium(text: "₹508", color: PortColor.black),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Divider(),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  Row(
                    children: [
                      headingMedium(
                          text: "Amount Payable",
                          color: PortColor.black.withOpacity(0.8)),
                      titleSmall(
                          text: "(rounded)",
                          color: PortColor.black.withOpacity(0.5)),
                      Spacer(),
                      headingMedium(text: "₹508", color: PortColor.black),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.015),
              height: screenHeight * 0.08,
              decoration: BoxDecoration(
                color: PortColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingMedium(text: "Goods Type", color: PortColor.gray),
                  Row(
                    children: [
                      titleMedium(
                          text: "General loose ", color: PortColor.black),
                      Spacer(),
                      titleMedium(text: " Change ", color: Colors.blue),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child:
                titleSmall(text: "Read before booking", color: PortColor.black),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  elementsMedium(
                      text:
                          '• Fare doesn\'t include labour charges for loading & unloading',
                      color: PortColor.black),
                  SizedBox(height: 8),
                  elementsMedium(
                      text:
                          '• Fare includes 70 mins free loading/unloading time.',
                      color: PortColor.black),
                  SizedBox(height: 8),
                  elementsMedium(
                      text:
                          '• ₹ 3.5/min for additional loading/unloading time.',
                      color: PortColor.black),
                  SizedBox(height: 8),
                  elementsMedium(
                      text: '• Fare may change if route or location changes.',
                      color: PortColor.black),
                  SizedBox(height: 8),
                  elementsMedium(
                      text: '• Parking charges to be paid by customer.',
                      color: PortColor.black),
                  SizedBox(height: 8),
                  elementsMedium(
                      text: '• Fare includes toll and permit charges, if any.',
                      color: PortColor.black),
                  SizedBox(height: 8),
                  elementsMedium(
                      text: '• We don\'t allow overloading.',
                      color: PortColor.black),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight*0.2,)
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.025,vertical: screenHeight*0.012),
        height: screenHeight * 0.17,
        color: PortColor.white,
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(Assets.assetsRupeetwo),
                  height: screenHeight * 0.04,
                ),
                headingMedium(
                    text: "Choose Payment mode", color: PortColor.black),
                Spacer(),
                headingMedium(text: "₹585", color: PortColor.black),
              ],
            ),
            SizedBox(height: screenHeight*0.014,),
            Container(
              alignment: Alignment.center,
              height: screenHeight * 0.07,
              width: screenWidth,
              decoration: BoxDecoration(
                color: PortColor.buttonBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child:
                  headingMedium(text: "Book Tata Ace", color: PortColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
