import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/custom_text_field.dart';
import 'package:porter/view/home/widgets/city_toggle.dart';

class DeliverByPackerMover extends StatefulWidget {
  const DeliverByPackerMover({super.key});

  @override
  State<DeliverByPackerMover> createState() => _DeliverByPackerMoverState();
}

class _DeliverByPackerMoverState extends State<DeliverByPackerMover> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03, vertical: screenHeight * 0.02),
            height: screenHeight * 0.17,
            decoration: BoxDecoration(
              color: PortColor.white,
              border: Border(
                bottom: BorderSide(
                    color: PortColor.gray, width: screenWidth * 0.002),
              ),
              boxShadow: [
                BoxShadow(
                  color: PortColor.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: PortColor.black,
                        size: screenHeight * 0.02,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    headingMedium(
                        text: "Packer and Mover", color: PortColor.black),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StepWidget(
                      icon: Icons.location_on,
                      titleMedium: 'Moving details',
                      isActive: true,
                    ),
                    DottedLine(),
                    StepWidget(
                      icon: Icons.inventory,
                      titleMedium: 'Add items',
                      isActive: false,
                    ),
                    DottedLine(),
                    StepWidget(
                      icon: Icons.add_box,
                      titleMedium: 'Add ons',
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
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: CityToggle(),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: CustomTextField(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.01,
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
              ),
              hintText: 'Pick up Location',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.035,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: CustomTextField(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.01,
                  ),
                  decoration: const BoxDecoration(
                    color: PortColor.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    color: PortColor.white,
                    size: screenHeight * 0.02,
                  ),
                ),
              ),
              hintText: 'Drop Location',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.035,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: const CustomTextField(
                prefixIcon: Icon(Icons.calendar_month),
                hintText: 'Shifting Date'),
          ),
          SizedBox(
            height: screenHeight * 0.017,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              children: [
                Container(
                  height: screenHeight * 0.046,
                  width: screenWidth * 0.28,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: PortColor.gray.withOpacity(0.75),
                        width: screenWidth * 0.004),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: headingMedium(
                        text: "Today", color: PortColor.black.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: screenHeight * 0.046,
                  width: screenWidth * 0.28,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: PortColor.gray.withOpacity(0.75),
                        width: screenWidth * 0.004),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: headingMedium(
                        text: "Tommorrow",
                        color: PortColor.black.withOpacity(0.7)),
                  ),
                ),
              ],
            ),
          ),
        ]),
        bottomSheet: Container(
          height: screenHeight * 0.1,
          color: PortColor.white,
          child: Center(
            child: Container(
              width: screenWidth * 0.9,
              padding: EdgeInsets.symmetric(
                  horizontal: screenHeight * 0.009,
                  vertical: screenHeight * 0.014),
              decoration: BoxDecoration(
                  color: PortColor.gray.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                'Check Price',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: PortColor.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
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
          width: 0.9,
          height: 1,
          color: PortColor.gray,
          margin: const EdgeInsets.symmetric(horizontal: 2),
        );
      }),
    );
  }
}
