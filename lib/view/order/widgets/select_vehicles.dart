import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/order/widgets/review_booking.dart';

class SelectVehicles extends StatefulWidget {
  const SelectVehicles({super.key});

  @override
  State<SelectVehicles> createState() => _SelectVehiclesState();
}

class _SelectVehiclesState extends State<SelectVehicles> {
  bool isContactDetailsSelected = false;

  List<OrderModel> orderList = [
    OrderModel(
        pickupAddress: "Founder Code Technol pvt ltd.",
        destAddress: "Chandrika Devi temple ",
        mobile: "7235947667",
        amount: 10,
        status: 10,
        date: '',
        time: '')
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,

        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.025),

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
                  SizedBox(width: screenWidth * 0.02),
                  titleSmall(
                    text: "Select Vehicles",
                    color: PortColor.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.045,vertical: screenWidth*0.04),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01,
                          vertical: screenHeight * 0.023),
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      height: screenHeight * 0.23,
                      decoration: BoxDecoration(
                        color: PortColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: screenWidth * 0.04,
                                height: screenHeight * 0.01,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Column(
                                children: List.generate(
                                  10,
                                      (index) => Container(
                                    width: screenWidth * 0.003,
                                    height: screenHeight * 0.0025,
                                    margin: const EdgeInsets.symmetric(vertical: 2),
                                    color: PortColor.gray,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.location_on_rounded,
                                color: PortColor.red,
                                size: screenHeight * 0.024,
                              ),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    headingMedium(
                                      text: orderList[index].pickupAddress,
                                      color: PortColor.black,
                                    ),
                                    titleMedium(
                                      text: orderList[index].mobile,
                                      color: PortColor.gray,
                                    ),
                                  ],
                                ),
                                elementsSmall(
                                  text: "Sector H, Jankipuram, Lucknow, Uttar Pradesh",
                                  color: PortColor.gray,
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    headingMedium(
                                      text: orderList[index].destAddress,
                                      color: PortColor.black,
                                    ),
                                    titleMedium(
                                      text: orderList[index].mobile,
                                      color: PortColor.gray,
                                    ),
                                  ],
                                ),
                                elementsSmall(
                                  text: orderList[index].destAddress,
                                  color: PortColor.gray,
                                ),
                                SizedBox(height: screenHeight*0.039,),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: PortColor.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: PortColor.white,
                                        size: screenHeight * 0.02,
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.02),
                                    titleSmall(text: "ADD STOP", color: PortColor.black),
                                    // SizedBox(width: screenWidth*0.02,),
                                 SizedBox(width: screenWidth*0.04,),
                                    Icon(Icons.edit,color: PortColor.blue,size: screenHeight*0.025,),
                                    titleSmall(text: "EDIT LOCATION", color: PortColor.black),


                                  ],
                                ),
                              ],

                            ),
                          ),
                        ],
                      ),

                    ),

                  );

                },
              ),
            ),




          ],
        ),
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
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.assetsBookingtruck,
                          height: screenHeight * 0.06,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                headingMedium(text: "Tata Ace", color: PortColor.black),
                                Icon(
                                  Icons.info_outline,
                                  size: screenHeight * 0.025,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                titleMedium(text: "750kg 14 mins", color: PortColor.gray),

                              ],
                            ),
                          ],
                        ),

                        Spacer(),
                        Column(
                          children: [
                            headingMedium(text: "₹508", color: PortColor.black),
                            Text("₹582.54",style: TextStyle( color: PortColor.gray, decoration: TextDecoration.lineThrough),)

                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: screenHeight*0.04,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.assetsBike,
                          height: screenHeight * 0.06,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                headingMedium(text: "2 Wheelers", color: PortColor.black),
                                Icon(
                                  Icons.info_outline,
                                  size: screenHeight * 0.025,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                titleMedium(text: "20kg 1 mins", color: PortColor.gray),

                              ],
                            ),
                          ],
                        ),

                        Spacer(),
                        Column(
                          children: [
                            headingMedium(text: "₹116", color: PortColor.black),
                            Text("₹136.49",style: TextStyle( color: PortColor.gray, decoration: TextDecoration.lineThrough),)

                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: screenHeight*0.04,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.assetsAuto,
                          height: screenHeight * 0.06,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                headingMedium(text: "3 Wheelers", color: PortColor.black),
                                Icon(
                                  Icons.info_outline,
                                  size: screenHeight * 0.025,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                titleMedium(text: "500kg --", color: PortColor.gray),

                              ],
                            ),
                          ],
                        ),

                        Spacer(),
                        Column(
                          children: [
                            headingMedium(text: "₹350", color: PortColor.black),
                            Text("₹424.70",style: TextStyle( color: PortColor.gray, decoration: TextDecoration.lineThrough),)

                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: screenHeight*0.04,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.assetsEloaders,
                          height: screenHeight * 0.06,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                headingMedium(text: "E Loaders", color: PortColor.black),
                                Icon(
                                  Icons.info_outline,
                                  size: screenHeight * 0.025,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                titleMedium(text: "300kg 22 mins", color: PortColor.gray),

                              ],
                            ),
                          ],
                        ),

                        Spacer(),
                        Column(
                          children: [
                            headingMedium(text: "₹350", color: PortColor.black),
                            Text("₹582.54",style: TextStyle( color: PortColor.gray, decoration: TextDecoration.lineThrough),)

                          ],
                        ),

                      ],
                    ),

                  ],
                )

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
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewBooking()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.03,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: isContactDetailsSelected
                            ? PortColor.blue
                            : PortColor.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: headingMedium(
                        text: "Enter Contact Details",
                        color: isContactDetailsSelected
                            ? Colors.white
                            : PortColor.gray,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderModel {
  final String pickupAddress;
  final String destAddress;
  final String mobile;
  final double amount;
  final int status;
  final String date;
  final String time;

  OrderModel({
    required this.pickupAddress,
    required this.destAddress,
    required this.mobile,
    required this.amount,
    required this.status,
    required this.date,
    required this.time,
  });
}
