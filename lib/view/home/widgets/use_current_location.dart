import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/const_map.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/custom_text_field.dart';
import 'package:porter/utils/utils.dart';
import 'package:porter/view/home/widgets/pickup/deliver_by_truck.dart';
import 'package:porter/view_model/order_view_model.dart';
import 'package:porter/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class UseCurrentLocation extends StatefulWidget {
  const UseCurrentLocation({super.key});

  @override
  State<UseCurrentLocation> createState() => _UseCurrentLocationState();
}

class _UseCurrentLocationState extends State<UseCurrentLocation> {
  bool isContactDetailsSelected = false;
  String? _currentAddress;
  LatLng? _currentLatLng;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<OrderViewModel>(context);
    final profileViewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      body: ConstMap(
        onAddressFetched: (address) {
          setState(() {
            _currentAddress = address;
          });
        },
        onLatLngFetched: (latLng) {
          setState(() {
            _currentLatLng = latLng;
          });
        },
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                        image: const AssetImage(Assets.assetsLocation),
                        height: screenHeight * 0.035,
                      ),
                      SizedBox(width: screenWidth * 0.009),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: screenWidth*0.6,
                              child: titleMedium(text: _currentAddress ?? "Fetching address...", color: PortColor.black)),
                          // SizedBox(height: screenHeight * 0.007),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: screenHeight * 0.038,
                        width: screenWidth * 0.17,
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
                  SizedBox(height: screenHeight * 0.037),
                   CustomTextField(
                     height: screenHeight*0.055,
                     cursorHeight: screenHeight*0.023,
                     labelText: "House/Apartment/Shop (optional)",
                  ),
                  SizedBox(height: screenHeight * 0.03),
                   CustomTextField(
                     controller: nameController,
                    height: screenHeight*0.055,
                     cursorHeight: screenHeight*0.023,
                     labelText: "Sender's Name",
                    suffixIcon:
                    Icon(Icons.perm_contact_cal_outlined, color: PortColor.blue),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                   CustomTextField(
                     controller: mobileController,
                     height: screenHeight*0.055,
                     keyboardType: TextInputType.number,
                     maxLength: 10,
                     cursorHeight: screenHeight*0.023,
                     labelText: "Sender's Mobile Number",
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
                        Row(
                          children: [
                            titleMedium(
                              text: "Use My Mobile Number:",
                              color: PortColor.black,
                            ),
                            titleMedium(
                              text: profileViewModel.profileModel!.data!.phone.toString()??"",
                              color: PortColor.black,
                            ),
                          ],
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
                      Container(
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
                            Icon(
                              Icons.home_filled,
                              color: PortColor.black,
                              size: screenHeight * 0.02,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            titleMedium(
                              text: "Home",
                              color: PortColor.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                            Image(
                              image: const AssetImage(Assets.assetsShop),
                              height: screenHeight * 0.03,
                            ),
                            titleMedium(
                              text: "Shop",
                              color: PortColor.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                            Icon(
                              Icons.favorite,
                              color: PortColor.black,
                              size: screenHeight * 0.02,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            titleMedium(
                              text: "Other",
                              color: PortColor.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (nameController.text.isEmpty) {
                  Utils.showErrorMessage(context, "Enter sender's name");
                } else if (mobileController.text.isEmpty || mobileController.text.length != 10) {
                  Utils.showErrorMessage(context, "Enter a valid 10-digit mobile number");
                } else {
                  final data = {
                    "address": _currentAddress,
                    "name": nameController.text,
                    "phone": mobileController.text,
                    "latitude": _currentLatLng?.latitude,
                    "longitude": _currentLatLng?.longitude,
                  };
                  print(data);
                  print("hloooch");
                  orderViewModel.setLocationType(0);
                  orderViewModel.setLocationData(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliverByTruck()),
                  );
                }
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
                      color: (mobileController.text.isNotEmpty && mobileController.text.length == 10)
                          ? PortColor.blue
                          : PortColor.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: headingMedium(
                      text: (mobileController.text.isNotEmpty && mobileController.text.length == 10)
                          ? "Confirm and Proceed"
                          : "Enter Contact Details",
                      color: (mobileController.text.isNotEmpty && mobileController.text.length == 10)
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


}
