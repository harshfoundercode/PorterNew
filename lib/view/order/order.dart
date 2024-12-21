import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view_model/user_history_view_model.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userHistoryViewModel =
          Provider.of<UserHistoryViewModel>(context, listen: false);
      userHistoryViewModel.userHistoryApi();
      print("helokokfio");
    });
  }

  @override
  Widget build(BuildContext context) {
    final userHistoryViewModel = Provider.of<UserHistoryViewModel>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: PortColor.grey,
          appBar: appbar(),
          body: userHistoryViewModel.userHistoryModel != null
              ? orderListUi()
              : noOrderFoundUi()),
    );
  }

  PreferredSizeWidget appbar() {
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

  Widget orderListUi() {
    final userHistoryViewModel = Provider.of<UserHistoryViewModel>(context);
    return ListView.builder(
        itemCount: userHistoryViewModel.userHistoryModel!.data!.length,
        itemBuilder: (context, index) {
          final history = userHistoryViewModel.userHistoryModel!.data![index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.018),
                child: headingMedium(text: "Past", color: PortColor.gray),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01),
                // height: screenHeight * 0.334,
                color: PortColor.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Image(
                          image: AssetImage(Assets.assetsBookingtruck),
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            elementsMedium(
                                text: history.vehicleType ?? "",
                                color: PortColor.black),
                            elementsMedium(
                                text: history.datetime.toString() ?? "",
                                color: PortColor.gray),
                          ],
                        ),
                        Spacer(),
                        elementsBold(
                            text: ("₹ ${history.amount?.toString() ?? ""}"),
                            color: PortColor.black),
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
                          // height: screenHeight * 0.17,
                          decoration: BoxDecoration(
                              color: PortColor.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
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
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 2),
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
                                            text: history.senderName ?? "",
                                            color: PortColor.black,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.015,
                                          ),
                                          titleMedium(
                                            text: history.senderPhone
                                                    .toString() ??
                                                "",
                                            color: PortColor.gray,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: screenWidth * 0.7,
                                        child: elementsSmall(
                                          text: history.pickupAddress ?? "",
                                          color: PortColor.gray,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.04),
                                      Row(
                                        children: [
                                          titleMedium(
                                            text: history.reciverName ?? "",
                                            color: PortColor.black,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.015,
                                          ),
                                          titleMedium(
                                            text: history.reciverPhone
                                                    .toString() ??
                                                "",
                                            color: PortColor.gray,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.7,
                                        child: elementsSmall(
                                          text: history.dropAddress ?? "",
                                          color: PortColor.gray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.08),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    titleMedium(
                                        text: "Payment Status: ",
                                        color: PortColor.black),
                                    elementsSmall(
                                        text: history.paymentStatus == 0
                                            ? "Pending"
                                            : history.paymentStatus == 1
                                                ? "Success"
                                                : history.paymentStatus == 2
                                                    ? "Failed"
                                                    : '',
                                        color: PortColor.gray),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenHeight*0.006,),
                              Padding(
                                padding:  EdgeInsets.only(left: screenWidth * 0.08),
                                child: Row(
                                  children: [
                                    titleMedium(text: "Pay Mode: ",color: PortColor.black),
                                    elementsSmall(text:
                                     history.paymode==1?"Cash on Delivery":
                                         history.paymode==2?"Online Payment":"Nothing"
                                        ,color: PortColor.gray,
                                    )
                                  ],
                                ),
                              )
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
                              image: AssetImage(
                            Assets.assetsRedcross,
                          )),
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

  Widget noOrderFoundUi() {
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
