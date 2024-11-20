import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/payment/widgets/payment_porter_credit.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  TextEditingController _controller = TextEditingController();
  bool isProceedEnabled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateProceedButton() {
    setState(() {
      isProceedEnabled =
          _controller.text.isNotEmpty && int.tryParse(_controller.text) != null;
    });
  }

  void _addAmount(int amount) {
    int currentAmount = int.tryParse(_controller.text) ?? 0;
    int newAmount = currentAmount + amount;
    _controller.text = newAmount.toString();
    _updateProceedButton();
  }

  void _clearAmount() {
    _controller.clear();
    _updateProceedButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PortColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
        child: ListView(
          children: [
            headingSmall(text: "Payment", color: PortColor.black),
            SizedBox(height: screenHeight * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentPorterCredit(),
                          ),
                        );
                      },
                      child: titleMedium(
                          text: "Porter credits", color: PortColor.black),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return WillPopScope(
                              onWillPop: () async {
                                _clearAmount();
                                return true;
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: screenHeight * 0.08,
                                ),
                                child: Container(
                                  height: screenHeight * 0.28,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    color: PortColor.white,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: PortColor.gray.withOpacity(0.3),
                                        offset: const Offset(0, 2),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.04),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: screenHeight * 0.01),
                                        headingMedium(
                                            text: "Add Money",
                                            color: PortColor.black),
                                        SizedBox(height: screenHeight * 0.01),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                controller: _controller,
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (value) =>
                                                    _updateProceedButton(),
                                                decoration: InputDecoration(
                                                  hintText: 'Enter Amount',
                                                  hintStyle: const TextStyle(
                                                      color: PortColor.gray),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: screenWidth * 0.04),
                                            GestureDetector(
                                              onTap: () => _addAmount(500),
                                              child: Container(
                                                height: screenHeight * 0.04,
                                                width: screenWidth * 0.14,
                                                decoration: BoxDecoration(
                                                  color: PortColor.blue
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Center(
                                                  child: elementsSmall(
                                                    text: "+500",
                                                    color: PortColor.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: screenWidth * 0.04),
                                            GestureDetector(
                                              onTap: () => _addAmount(1000),
                                              child: Container(
                                                height: screenHeight * 0.04,
                                                width: screenWidth * 0.14,
                                                decoration: BoxDecoration(
                                                  color: PortColor.blue
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Center(
                                                  child: elementsSmall(
                                                    text: "+1000",
                                                    color: PortColor.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: screenWidth * 0.04),
                                            GestureDetector(
                                              onTap: () => _addAmount(2000),
                                              child: Container(
                                                height: screenHeight * 0.04,
                                                width: screenWidth * 0.14,
                                                decoration: BoxDecoration(
                                                  color: PortColor.blue
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Center(
                                                  child: elementsSmall(
                                                    text: "+2000",
                                                    color: PortColor.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: screenHeight * 0.05),
                                        Container(
                                          height: screenHeight * 0.06,
                                          width: screenWidth * 0.88,
                                          decoration: BoxDecoration(
                                            color: isProceedEnabled
                                                ? PortColor.blue
                                                : PortColor.grey,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: headingMedium(
                                              text: "Proceed",
                                              color: isProceedEnabled
                                                  ? PortColor.white
                                                  : PortColor.gray,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).whenComplete(() {
                          _clearAmount();
                        });
                      },
                      child: Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: PortColor.gray.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: elementsSmall(
                            text: 'Add Money',
                            color: PortColor.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                elementsSmall(text: "Balance ₹0", color: PortColor.gray),
                Divider(thickness: screenWidth * 0.001),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
