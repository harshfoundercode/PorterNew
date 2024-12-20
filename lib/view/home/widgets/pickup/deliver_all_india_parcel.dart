import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';

class DeliverAllIndiaParcel extends StatefulWidget {
  const DeliverAllIndiaParcel({super.key});

  @override
  State<DeliverAllIndiaParcel> createState() => _DeliverAllIndiaParcelState();
}
class _DeliverAllIndiaParcelState extends State<DeliverAllIndiaParcel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.17,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: PortColor.white,
                  border: Border(
                    bottom: BorderSide(
                        color: PortColor.gray.withOpacity(0.4),
                        width: screenWidth * 0.002),
                  )),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      titleSmall(text: "Send Package", color: PortColor.black),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepWidget(
                        icon: Icons.location_on,
                        titleMedium: 'Address',
                        isActive: true,
                      ),
                      DottedLine(),
                      StepWidget(
                        icon: Icons.inventory,
                        titleMedium: 'Package',
                        isActive: false,
                      ),
                      DottedLine(),
                      StepWidget(
                        icon: Icons.add_box,
                        titleMedium: 'Estimate',
                        isActive: false,
                      ),
                      DottedLine(),
                      StepWidget(
                        icon: Icons.receipt,
                        titleMedium: 'Review',
                        isActive: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.035),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01,
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_upward_rounded,
                          color: PortColor.white,
                          size: screenHeight * 0.02,
                        ),
                      ),
                      Column(
                        children: List.generate(
                          8,
                          (index) => Container(
                            width: screenWidth * 0.005,
                            height: screenHeight * 0.0025,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            color: PortColor.gray,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01,
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: const BoxDecoration(
                          color: PortColor.gray,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_downward_rounded,
                          color: PortColor.white,
                          size: screenHeight * 0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Container(
                    width: screenWidth*0.84,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                            vertical: screenHeight * 0.015,
                          ),
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: PortColor.buttonBlue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              headingMedium(text: "Add Pick up Detail"),
                              const Spacer(),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: PortColor.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: PortColor.blue,
                                    size: screenHeight * 0.02,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                            vertical: screenHeight * 0.015,
                          ),
                          height: screenHeight * 0.058,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: PortColor.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: titleMedium(
                              text: "Add drop details", color: PortColor.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final IconData icon;
  final String titleMedium;
  final bool isActive;

  StepWidget({
    required this.icon,
    required this.titleMedium,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isActive ? PortColor.button : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isActive ? Colors.white : Colors.grey,
            size: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          titleMedium,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class DottedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(10, (index) {
        return Container(
          width: 1,
          height: 1,
          color: PortColor.black,
          margin: const EdgeInsets.symmetric(horizontal: 2),
        );
      }),
    );
  }
}
