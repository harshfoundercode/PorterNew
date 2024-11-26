import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:provider/provider.dart';


class NewPage extends StatefulWidget {
  const NewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPage> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<NewPage> {
  String radius = "30";

  double latitude = 31.5111093;
  double longitude = 74.279664;
  var lat = "0.000";
  var long = "0.000";
  var latt;
  var longg;

  final Completer<GoogleMapController> _controller = Completer();
  String _draggedAddress = "";
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatlng;
  _init() {
    _defaultLatLng = const LatLng(20.5937, 78.9629);
    _draggedLatlng = _defaultLatLng;
    _cameraPosition = CameraPosition(target: _defaultLatLng, zoom: 10.5);
    _gotoUserCurrentPosition();
  }

  // Uint8List? marketimages;
  final List<Marker> _markers = [];

  Future<Uint8List?> loadNetWorkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info)));
    final imageInfo = await completer.future;
    final byteData =
    await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  var totallen;
  Widget _getMap() {
    return GoogleMap(
      zoomControlsEnabled: false,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _cameraPosition!,
      markers: Set<Marker>.of(_markers),
      onCameraIdle: () {
       // _getAddress(_draggedLatlng);
      },
      onCameraMove: (cameraPosition) {
        _draggedLatlng = cameraPosition.target;
      },
      onMapCreated: (GoogleMapController controller) {
        if (!_controller.isCompleted) {
          _controller.complete(controller);
        }
        // mCon.changeCameraPosition(mCon.lat, mCon.lng);
      },
    );
  }

  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
    setState(() async {
      lat = currentPosition.latitude.toString();
      long = currentPosition.longitude.toString();
      var lats = double.parse(lat);
      var longs = double.parse(long);
      _markers.add(Marker(
        markerId: const MarkerId('0'),
        position: LatLng(lats, longs),
        infoWindow: const InfoWindow(
          title: "userName",
        ),
        draggable: true,
        onDragEnd: ((newPosition) {}),
      ));
    });
  }

  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 13.5)));

    // await _getAddress(position);
  }

  // Future _getAddress(LatLng position) async {
  //   List<Placemark> placemarks =
  //   await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark address = placemarks[0];
  //   String addresStr =
  //       "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
  //   setState(() {
  //     latt = position.latitude;
  //     longg = position.longitude;
  //     _draggedAddress = addresStr;
  //   });
  // }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {}
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {}
    }

    if (locationPermission == LocationPermission.deniedForever) {}
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

// fetch live location from the map
  List<dynamic> _suggestions = [];

  Future<void> _getSuggestions(String input) async {
    final endpoint = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI',
    );

    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final predictions = data['predictions'];

      print("Predictions: $predictions");
      if (kDebugMode) {
        print("saaaaaaaaaaaaaaaaaa");
      }
      if (kDebugMode) {
        print(predictions);
      }
      setState(() {
        _suggestions = predictions.map((prediction) {
          final description = prediction['description'] as String;
          final placeId = prediction['place_id'] as String;
          return {'description': description, 'place_id': placeId};
        }).toList();
      });
    }
  }

  Future<Map<String, double>> getLatLngFromPlaceId(
      String placeId, String address, dynamic arg) async {
    //final mapCon = Provider.of<MapViewModel>(context, listen: false);

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI'));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);

      if (decodedResponse['status'] == 'OK') {
        final location = decodedResponse['result']['geometry']['location'];
        searchedLocationLatitude = location['lat'];
        searchedLocationLongitude = location['lng'];
        if (searchedLocationLongitude != null &&
            searchedLocationLatitude != null) {
          print(
              "lat: $searchedLocationLatitude || lng: $searchedLocationLongitude");
          if (arg["navType"] == "src") {
            // mapCon.setPickupLatLng(
            //     searchedLocationLatitude, searchedLocationLongitude);
          } else {
            // mapCon.setDestinationLatLng(
            //     searchedLocationLatitude, searchedLocationLongitude);
          }
          Navigator.pop(context, _draggedAddress);
        }

        return {
          'latitude': searchedLocationLatitude,
          'longitude': searchedLocationLongitude
        };
      } else {
        throw Exception(
            'Failed to fetch location details: ${decodedResponse['error_message']}');
      }
    } else {
      throw Exception(
          'Failed to fetch location details: ${response.statusCode}');
    }
  }

  Widget _getLocationButton() {
    return Positioned(
      bottom: 150,
      right: 20,
      child: InkWell(
        onTap: () {
          _gotoUserCurrentPosition();
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: PortColor.red,
            borderRadius: BorderRadius.circular(8.0),
            // border: Border.all(
            //   width: 1.2, color: Colors.black
            // ),
            boxShadow: const [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
            ],
          ),
          child: const Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _getCustomPin() {
    return Positioned(
      top: screenHeight / 2.8,
      left: screenWidth / 2.3,
      child: InkWell(
        onTap: () async {
          showDialog(
              context: context,
              builder: (ctx) => Dialog(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  // child: Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     TextConst(
                  //       title: "Pinned Location Detail",
                  //       fontSize: AppConstant.fontSizeThree,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //     AppConstant.spaceHeight10,
                  //     TextConst(
                  //       title: "Address: $_draggedAddress",
                  //       fontSize: AppConstant.fontSizeTwo,
                  //     ),
                  //     AppConstant.spaceHeight5,
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         TextConst(
                  //           title: "Latitude: $latt",
                  //           fontSize: AppConstant.fontSizeOne,
                  //         ),
                  //         AppConstant.spaceWidth10,
                  //         TextConst(
                  //           title: "Longitude: $longg",
                  //           fontSize: AppConstant.fontSizeOne,
                  //         ),
                  //       ],
                  //     ),
                  //     AppConstant.spaceHeight15,
                  //     Align(
                  //       alignment: Alignment.center,
                  //       child: ButtonConst(
                  //         onTap: () {
                  //           Navigator.of(context).pop();
                  //         },
                  //         label: "ok",
                  //         width: 80,
                  //         height: 30,
                  //         textColor: AppColor.whiteColor,
                  //       ),
                  //     )
                  //   ],
                  // ),
                ),
              )
          );
        },
        child: const SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            CupertinoIcons.map_pin_ellipse,
            size: 40,
            color: Color(0xffcc0202),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(dynamic arg) {
    return Stack(children: [
      _getMap(),
      _getCustomPin(),
      _getLocationButton(),
      _suggestions.isNotEmpty
          ? Container(
        color: Colors.white,
        height: screenHeight / 3,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _suggestions.length,
          itemBuilder: (context, index) {
            final location = _suggestions[index]['description'];
            final placeId = _suggestions[index]['place_id'];
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(Icons.location_on_outlined),
              title: Text(
                location.toString(),
              ),
              onTap: () {
                if (location != null && placeId != null) {
                  setState(() {
                    _draggedAddress = location;
                  });
                  getLatLngFromPlaceId(placeId, location.toString(), arg);
                }
              },
            );
          },
        ),
      )
          : const SizedBox(),
    ]);
  }

  String? location;
  dynamic liveLocation;
  dynamic searchedLocationLatitude;
  dynamic searchedLocationLongitude;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
  //  final mapCon = Provider.of<MapViewModel>(context);
    final arg =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Choose your Location",
            style: TextStyle(color: Colors.black),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 4,
                        blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                onChanged: (v) {
                  _getSuggestions(v);
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8, top: 10),
                    hintText: 'Search Address',
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffA7A7A7),
                ),
              ),
            ),
          ),
        ),
        body: _buildBody(arg),
        bottomSheet: Container(
          color: Colors.white,
          padding:
          const EdgeInsets.only(bottom: 20, top: 15, left: 15, right: 15),
          // child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     TextConst(
          //       title: _draggedAddress,
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     ButtonConst(
          //       height: screenHeight * 0.05,
          //       onTap: () async {
          //         print("Location data=> lat: $latt || lng: $longg");
          //         if (arg["navType"] == "src") {
          //           mapCon.setPickupLatLng(latt, longg);
          //         } else {
          //           mapCon.setDestinationLatLng(latt, longg);
          //         }
          //         Navigator.pop(context, _draggedAddress);
          //       },
          //       label: 'Pick Location',
          //       textColor: Colors.white,
          //       fontSize: AppConstant.fontSizeThree,
          //       color: AppColor.primaryColor,
          //     ),
          //   ],
          // ),
        ));
  }
}