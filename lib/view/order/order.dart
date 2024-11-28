import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<OrderModel> orderList = [
    OrderModel(
        img: Assets.assetsBookingtruck,
        title: "Tata Ace",
        subtitle: "11 sep 2024 ,10:56AM",
        pickupAddress: " Prachi Singh ",
        destAddress: "Chandrika Devi temple Parking area Mandir Road..",
        mobile: "6543211123",
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
        appBar: appbar(),
        body: orderList.isNotEmpty
            ? orderListUi()
            : noOrderFoundUi()
      ),
    );
  }

  PreferredSizeWidget appbar(){
    return PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.065),
        child: Container(
          height: screenHeight * 0.065,
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
          child: Align(
            alignment: Alignment.centerLeft,
            child: titleSmall(text: "  Orders", color: PortColor.black),
          ),
        ));
  }

  Widget orderListUi(){
    return ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.018),
                child:
                headingMedium(text: "Past", color: PortColor.gray),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01),
                height: screenHeight * 0.334,
                color: PortColor.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(orderList[index].img),
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            elementsMedium(
                                text: orderList[index].title,
                                color: PortColor.black),
                            elementsMedium(
                                text: orderList[index].subtitle,
                                color: PortColor.gray),
                          ],
                        ),
                        const Spacer(),
                        elementsBold(
                            text: "₹0", color: PortColor.black),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: PortColor.gray,
                          size: screenHeight * 0.02,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.01),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.01,
                              vertical: screenHeight * 0.02),
                          height: screenHeight * 0.17,
                          decoration: BoxDecoration(
                              color: PortColor.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
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
                                              width: screenWidth *
                                                  0.003,
                                              height: screenHeight *
                                                  0.0025,
                                              margin: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 2),
                                              color: PortColor.gray,
                                            )),
                                      ),
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: PortColor.red,
                                        size: screenHeight * 0.024,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          titleMedium(
                                            text: orderList[index]
                                                .pickupAddress,
                                            color: PortColor.black,
                                          ),
                                          titleMedium(
                                            text:
                                            orderList[index].mobile,
                                            color: PortColor.gray,
                                          ),
                                        ],
                                      ),
                                      elementsSmall(
                                        text:
                                        "Sector H, Jankipuram, Lucknow, Uttar Pradesh",
                                        color: PortColor.gray,
                                      ),
                                      SizedBox(
                                          height: screenHeight * 0.04),
                                      Row(
                                        children: [
                                          titleMedium(
                                            text: orderList[index]
                                                .pickupAddress,
                                            color: PortColor.black,
                                          ),
                                          titleMedium(
                                            text:
                                            orderList[index].mobile,
                                            color: PortColor.gray,
                                          ),
                                        ],
                                      ),
                                      elementsSmall(
                                        text: orderList[index]
                                            .destAddress,
                                        color: PortColor.gray,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.009),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          const Image(
                              image: AssetImage(Assets.assetsRedcross,)),
                          headingMedium(
                              text: "Cancelled", color: PortColor.red),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.42,
                            decoration: BoxDecoration(
                              color: PortColor.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: titleMedium(text: 'Book Again'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget noOrderFoundUi(){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.2,
            width: screenHeight * 0.2,
            decoration: const BoxDecoration(
                color: PortColor.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      Assets.assetsBox,
                    ))),
          ),
          SizedBox(height: screenHeight * 0.03),
          headingSmall(text: "No Orders !", color: PortColor.black),
          SizedBox(height: screenHeight * 0.01),
          Column(
            children: [
              headingMedium(
                text: 'Order history limited to last 2 years',
                color: PortColor.gray,
              ),
              headingMedium(
                text: 'For older orders, contact our support team.',
                color: PortColor.gray,
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.025),
          InkWell(
            onTap: () {
              //navigate to booking page
            },
            child: Container(
              alignment: Alignment.center,
              height: screenHeight * 0.06,
              width: screenWidth * 0.55,
              decoration: BoxDecoration(
                color: PortColor.buttonBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: titleSmall(text: 'Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderModel {
  final String img;
  final String title;
  final String subtitle;
  final String pickupAddress;
  final String destAddress;
  final String mobile;
  final double amount;
  final int status;
  final String date;
  final String time;

  OrderModel({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.pickupAddress,
    required this.destAddress,
    required this.mobile,
    required this.amount,
    required this.status,
    required this.date,
    required this.time,
  });
}
