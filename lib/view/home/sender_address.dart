import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/custom_text_field.dart';

class SenderAddress extends StatefulWidget {
  final String selectedLocation;

  const SenderAddress({super.key, required this.selectedLocation});

  @override
  State<SenderAddress> createState() => _SenderAddressState();
}

class _SenderAddressState extends State<SenderAddress> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  late String selectedLocation;
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();
  bool isContactDetailsSelected = false;

  static const LatLng defaultPosition = LatLng(26.8467, 80.9462);
  LatLng selectedLatLng = defaultPosition;

  @override
  void initState() {
    super.initState();
    selectedLocation = widget.selectedLocation;
    fetchLatLngForLocation();
  }

  void fetchLatLngForLocation() {
    setState(() {
      selectedLatLng = LatLng(26.9124, 75.7873);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: selectedLatLng,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('selected_location'),
                position: selectedLatLng,
                infoWindow: InfoWindow(
                  title: "Selected Location",
                  snippet: selectedLocation,
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
              ),
            },
            onMapCreated: (controller) {
              _controller.complete(controller);
              mapController = controller;
            },
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.04,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(screenHeight * 0.015),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PortColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: PortColor.gray.withOpacity(0.9),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: screenHeight * 0.025,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildBottomSheet(context),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      width: screenWidth,
      decoration: const BoxDecoration(
        color: PortColor.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLocationDetails(),
                SizedBox(height: screenHeight * 0.03),
                CustomTextField(
                  controller: nameController,
                  height: screenHeight * 0.055,
                  cursorHeight: screenHeight * 0.023,
                  labelText: "Sender's Name",
                  suffixIcon: Icon(Icons.perm_contact_cal_outlined, color: PortColor.blue),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextField(
                  controller: mobileController,
                  height: screenHeight * 0.055,
                  cursorHeight: screenHeight * 0.023,
                  labelText: "Sender's Mobile Number",
                  keyboardType: TextInputType.number,
                  maxLength: 10,
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
                          border: Border.all(color: PortColor.blue, width: screenWidth * 0.004),
                          borderRadius: BorderRadius.circular(4),
                          color: isContactDetailsSelected ? PortColor.blue : Colors.transparent,
                        ),
                        child: isContactDetailsSelected
                            ? Icon(Icons.check, color: Colors.white, size: screenHeight * 0.02)
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
              ],
            ),
          ),
          buildProceedButton(context),
        ],
      ),
    );
  }

  Widget buildLocationDetails() {
    return Row(
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
                width: screenWidth*0.5,
                child: titleMedium(text: selectedLocation, color: PortColor.black)),
            SizedBox(height: screenHeight * 0.007),
            Container(
                width: screenWidth*0.5,
                child: elementsMedium(text: selectedLocation, color: PortColor.black)),
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
            child: elementsMedium(text: "Change", color: PortColor.blue),
          ),
        ),
      ],
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
            Icon(icon, color: PortColor.black, size: screenHeight * 0.02),
          if (asset != null)
            Image(image: AssetImage(asset), height: screenHeight * 0.03),
          SizedBox(width: screenWidth * 0.01),
          titleMedium(text: label, color: PortColor.black),
        ],
      ),
    );
  }

  Widget buildProceedButton(BuildContext context) {
    return Container(
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
            color: isContactDetailsSelected ? PortColor.blue : PortColor.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: headingMedium(
            text: "Enter Contact Details",
            color: isContactDetailsSelected ? Colors.white : PortColor.gray,
          ),
        ),
      ),
    );
  }
}
