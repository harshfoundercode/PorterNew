import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/home/widgets/pick_up_location.dart';
import 'package:porter/view/order/widgets/enter_contact_detail.dart';
import 'package:porter/view_model/order_view_model.dart';
import 'package:porter/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

class DeliverByTruck extends StatefulWidget {
  const DeliverByTruck({super.key});

  @override
  State<DeliverByTruck> createState() => _DeliverByTruckState();
}

class _DeliverByTruckState extends State<DeliverByTruck> {

  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  bool hasData = false;
  List<dynamic> searchResults = [];
  Map<String, String> placeDetailsCache = {};
  String? selectedLocation;
  String? _currentAddress;
  @override

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    setState(() {});

    _fetchAddress(position.latitude, position.longitude);

  }

  Future<void> _fetchAddress(double latitude, double longitude) async {
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);

    const String apiKey = 'AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'] != null && data['results'].isNotEmpty) {
          final address = data['results'][0]['formatted_address'];
          setState(() {
            _currentAddress = address;
          });
          final locationData = {
            "address": _currentAddress,
            "name": profileViewModel.profileModel?.data?.firstName ?? "",
            "phone": profileViewModel.profileModel?.data?.phone.toString() ?? "",
            "latitude": latitude,
            "longitude": longitude,
          };
          print('Location Data: $locationData');
          orderViewModel.setLocationType(0);
          orderViewModel.setLocationData(locationData);
          print('Updated Address: $_currentAddress');
        } else {
          print('No results found for the given coordinates.');
        }
      } else {
        print('Failed to fetch address. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching address: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<OrderViewModel>(context);
    final profileViewModel = Provider.of<ProfileViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.28,
              width: screenWidth,
              decoration: BoxDecoration(
                color: PortColor.white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: PortColor.black.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
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
                                  width: screenWidth * 0.005,
                                  height: screenHeight * 0.0025,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 2),
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
                        Container(
                          width: screenWidth / 1.3,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  orderViewModel.setLocationType(0);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PickUpLocation()));
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02,
                                      vertical: screenHeight * 0.015,
                                    ),
                                    width: screenWidth * 0.78,
                                    decoration: BoxDecoration(
                                      color: PortColor.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: PortColor.gray,
                                          width: screenWidth * 0.002),
                                    ),
                                    child: hasData
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  elementsMedium(
                                                    text: profileViewModel.profileModel!.data!.firstName??"",
                                                    color: PortColor.black,
                                                  ),
                                                  elementsSmall(
                                                    text: profileViewModel.profileModel!.data!.phone.toString()??"",
                                                    color: PortColor.gray,
                                                  ),
                                                  const Spacer(),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: screenHeight * 0.017,
                                                  ),
                                                ],
                                              ),
                                              elementsSmall(
                                                text:
                                                    "SectorH, jankipuram, lucknow, uttar pradesh..",
                                                color: PortColor.black,
                                              ),
                                            ],
                                          )
                                        : (orderViewModel.pickupData != null
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      elementsMedium(
                                                        text: orderViewModel
                                                                    .pickupData[
                                                                "name"] ??
                                                            "N/A",
                                                        color: PortColor.black,
                                                      ),
                                                      elementsSmall(
                                                        text: orderViewModel
                                                                    .pickupData[
                                                                "phone"] ??
                                                            "N/A",
                                                        color: PortColor.gray,
                                                      ),
                                                      const Spacer(),
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        size: screenHeight *
                                                            0.017,
                                                      ),
                                                    ],
                                                  ),
                                                  elementsSmall(
                                                    text: orderViewModel
                                                                .pickupData[
                                                            "address"] ??
                                                        "N/A",
                                                    color: PortColor.black,
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Row(
                                                  //   children: [
                                                  //     elementsMedium(
                                                  //       text:profileViewModel.profileModel!.data!.firstName??"",
                                                  //       color: PortColor.black,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width:
                                                  //           screenWidth * 0.01,
                                                  //     ),
                                                  //     elementsSmall(
                                                  //       text: profileViewModel.profileModel!.data!.phone.toString()??"",
                                                  //       color: PortColor.gray,
                                                  //     ),
                                                  //     const Spacer(),
                                                  //     Icon(
                                                  //       Icons
                                                  //           .arrow_forward_ios_rounded,
                                                  //       size: screenHeight *
                                                  //           0.017,
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  // elementsSmall(
                                                  //   text:
                                                  //   _currentAddress ?? "Fetching address...",
                                                  //   color: PortColor.black,
                                                  // ),
                                                ],
                                              ))),
                              ),
                              SizedBox(height: screenHeight * 0.018),
                              TextField(
                                onTap: () {
                                  orderViewModel.setLocationType(1);
                                },
                                onChanged: (value) {
                                  placeSearchApi(value);
                                },
                                decoration: InputDecoration(
                                  constraints: BoxConstraints(
                                      maxHeight: screenHeight * 0.055),
                                  hintText: "Where is your Drop?",
                                  hintStyle: TextStyle(
                                    color: PortColor.gray.withOpacity(0.5),
                                    fontSize: 15,
                                  ),
                                  suffixIcon: const Icon(Icons.mic,
                                      color: PortColor.blue),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: PortColor.gray),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  filled: true,
                                  fillColor: PortColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.024),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
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
                      headingMedium(text: "ADD STOP", color: PortColor.black),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            if (searchResults.isNotEmpty)
              SizedBox(
                  height: screenHeight * 0.22,
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final place = searchResults[index];
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                            ),
                            title: titleMedium(
                              text: place['description'],
                              color: PortColor.black.withOpacity(0.5),
                            ),
                            onTap: () async {
                              String placeId = place['place_id'];
                              LatLng latLng = await fetchLatLng(placeId);
                              print(latLng);
                              print("hel");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnterContactDetail(
                                    selectedLocation: place['description'],
                                    selectedLatLng: latLng,
                                  ),
                                ),
                              );
                            },
                          ),
                          if (index < searchResults.length - 1)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: Divider(
                                color: PortColor.gray,
                                thickness: screenWidth * 0.002,
                              ),
                            ),
                        ],
                      );
                    },
                  )),
            if (searchResults.isEmpty)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                height: screenHeight * 0.16,
                color: PortColor.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleMedium(
                      text: "Recent Pickups",
                      color: PortColor.gray,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: PortColor.black.withOpacity(0.6),
                          size: screenHeight * 0.028,
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headingMedium(
                              text: "Chandrika Devi Temple Parking area",
                              color: PortColor.black.withOpacity(0.6),
                            ),
                            titleMedium(
                              text:
                                  "Mandir Road, lucknow, uttar pradesh, India\nprachi .. 6785467899",
                              color: PortColor.gray,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Icon(
                              Icons.favorite_border_sharp,
                              color: PortColor.black.withOpacity(0.6),
                              size: screenHeight * 0.025,
                            ),
                            titleMedium(
                              text: "Save",
                              color: PortColor.black.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
           // const Spacer(),

          ],
        ),
        bottomSheet: Container(
          height: screenHeight * 0.08,
          color: PortColor.white,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: PortColor.blue),
              headingMedium(
                  text: " Locate on the map", color: PortColor.black),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> placeSearchApi(String searchCon) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": searchCon,
      "key": "AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI",
      "components": "country:in",
    });
    var response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      final resData = jsonDecode(response.body)['predictions'];
      if (resData != null) {
        setState(() {
          searchResults = resData;
        });
      }
    } else {
      print('Error fetching suggestions: ${response.body}');
    }
  }

  Future<LatLng> fetchLatLng(String placeId) async {
    Uri uri = Uri.https("maps.googleapis.com", 'maps/api/place/details/json', {
      "place_id": placeId,
      "key": "AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI",
    });

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final location = result['result']['geometry']['location'];
      return LatLng(location['lat'], location['lng']);
    } else {
      print('Error fetching location details: ${response.body}');
      return const LatLng(0.0, 0.0); // Default fallback
    }
  }
}
