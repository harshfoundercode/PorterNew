import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/const_map.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/custom_text_field.dart';
import 'package:porter/view/order/widgets/select_vehicles.dart';

class EnterContactDetail extends StatefulWidget {
  final String selectedLocation;

  const EnterContactDetail({super.key, required this.selectedLocation});

  @override
  State<EnterContactDetail> createState() => _EnterContactDetailState();
}

class _EnterContactDetailState extends State<EnterContactDetail> {
  late String selectedLocation;
  bool isContactDetailsSelected = false;

  @override
  void initState() {
    super.initState();
    selectedLocation = widget.selectedLocation;
  }

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
              height: screenHeight * 0.43,
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
                        image:  const AssetImage(Assets.assetsRedlocation),
                        height: screenHeight * 0.035,
                      ),
                      SizedBox(width: screenWidth * 0.009),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleMedium(
                            text: selectedLocation,
                            color: PortColor.black,
                          ),
                          SizedBox(height: screenHeight * 0.007),
                          elementsMedium(
                            text: selectedLocation,
                            color: PortColor.black,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                       height: screenHeight * 0.038,
                        width: screenWidth * 0.14,
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
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextField(
                    height: screenHeight * 0.055,
                    cursorHeight: screenHeight * 0.023,
                    labelText: "Receiver's Name",
                    suffixIcon: Icon(
                      Icons.perm_contact_cal_outlined,
                      color: PortColor.blue,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextField(
                    height: screenHeight * 0.055,
                    cursorHeight: screenHeight * 0.023,
                    labelText: "Receiver's Mobile Number",
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
                          text: "Use My Mobile Number: 7234567667",
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
                      buildSaveOption("Home", Icons.home_filled),
                      buildSaveOption("Shop", null, Assets.assetsShop),
                      buildSaveOption("Other", Icons.favorite),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectVehicles()));
              },
              child: Container(
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
    );
  }

  Widget buildSaveOption(String label, IconData? icon, [String? asset]) {
    return Container(
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
          if (icon != null)
            Icon(
              icon,
              color: PortColor.black,
              size: screenHeight * 0.02,
            ),
          if (asset != null)
            Image(
              image: AssetImage(asset),
              height: screenHeight * 0.03,
            ),
          SizedBox(width: screenWidth * 0.01),
          titleMedium(
            text: label,
            color: PortColor.black,
          ),
        ],
      ),
    );
  }
}
