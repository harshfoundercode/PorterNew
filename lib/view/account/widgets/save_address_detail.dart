import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/account/widgets/address/save_pickup_address.dart';
import 'package:porter/view_model/address_delete_view_model.dart';
import 'package:porter/view_model/address_show_view_model.dart';
import 'package:provider/provider.dart';

class SaveAddressDetail extends StatefulWidget {
  const SaveAddressDetail({super.key});
  @override
  State<SaveAddressDetail> createState() => _SaveAddressDetailState();
}

class _SaveAddressDetailState extends State<SaveAddressDetail> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final addressShowViewModel =
          Provider.of<AddressShowViewModel>(context, listen: false);
      addressShowViewModel.addressShowApi();
      print("hoooo");
    });
  }

  @override
  Widget build(BuildContext context) {
    final addressShowViewModel = Provider.of<AddressShowViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.07,
              width: screenWidth,
              decoration: BoxDecoration(
                color: PortColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.04,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: PortColor.black,
                      size: screenHeight * 0.025,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.25,
                  ),
                  headingMedium(
                    text: "Saved Addresses",
                    color: PortColor.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavePickUpAddress(),
                    ),
                  );
                },
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: PortColor.grey.withOpacity(0.5),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: PortColor.blue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: PortColor.blue,
                        size: screenHeight * 0.025,
                      ),
                    ),
                    title: titleMedium(
                        text: "Add New Address", color: PortColor.blue),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: PortColor.black,
                      size: screenHeight * 0.02,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: titleSmall(
                  text: "Your saved addresses",
                  color: PortColor.black.withOpacity(0.6)),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: addressShowViewModel.loading
                  ? const Center(child: CircularProgressIndicator())
                  : addressShowViewModel.addressShowModel?.data?.isNotEmpty == true
                      ? ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05),
                          itemCount: addressShowViewModel
                              .addressShowModel!.data!.length,
                          itemBuilder: (context, index) {
                            final saveAddress = addressShowViewModel
                                .addressShowModel?.data![index];
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.02),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04,
                                    vertical: screenHeight * 0.02),
                                decoration: BoxDecoration(
                                  color: PortColor.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                      offset: const Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              Assets.assetsShop),
                                          height: screenHeight * 0.038,
                                        ),
                                        SizedBox(width: screenWidth * 0.02),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            headingMedium(
                                                text:
                                                    saveAddress?.addressType ??
                                                        "",
                                                color: PortColor.black),
                                            Row(
                                              children: [
                                                titleMedium(
                                                    text:
                                                        saveAddress?.name ?? "",
                                                    color: PortColor.gray),
                                                SizedBox(
                                                  width: screenWidth * 0.01,
                                                ),
                                                titleMedium(
                                                    text: saveAddress?.contactNo
                                                            .toString() ??
                                                        "",
                                                    color: PortColor.gray),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: screenWidth * 0.001,
                                    ),
                                    elementsMedium(
                                        text: saveAddress?.houseArea ?? "",
                                        color: PortColor.gray),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    titleMedium(
                                        text: saveAddress?.address ?? "",
                                        color: PortColor.gray),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    elementsMedium(
                                      text: " Pin code: ${saveAddress?.pincode.toString() ?? ""} ",
                                      color: PortColor.gray,
                                    ),

                                    SizedBox(height: screenHeight * 0.01),
                                    Row(
                                      children: [
                                        Container(
                                          height: screenHeight * 0.046,
                                          width: screenWidth * 0.35,
                                          decoration: BoxDecoration(
                                            color:
                                                PortColor.blue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                              child: elementsMedium(
                                                  text: 'Edit',
                                                  color: PortColor.blue)),
                                        ),
                                        SizedBox(width: screenWidth * 0.1),
                                        GestureDetector(
                                          onTap: () {
                                           // AddressDeleteViewModel.addressDeleteApi();
                                            showModalBottomSheet(
                                              backgroundColor: PortColor.white,
                                              context: context,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.vertical(top: Radius.circular(10)),
                                              ),
                                              builder: (BuildContext context) {
                                                return deleteBottomSheet(context, saveAddress!.id.toString());
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: screenHeight * 0.046,
                                            width: screenWidth * 0.35,
                                            decoration: BoxDecoration(
                                              color:
                                                  PortColor.blue.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                                child: elementsMedium(
                                                    text: 'Delete',
                                                    color: PortColor.blue)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(child: Text("No Address Available")),
            ),
          ],
        ),
      ),
    );
  }
  Widget deleteBottomSheet(context, String addressId){
    final addressDeleteViewModel = Provider.of<AddressDeleteViewModel>(context);
    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          titleSmall(
              text: "Delete Shop address?",
              color: PortColor.black),
          SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: screenHeight * 0.058,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: PortColor.white,
                    border: Border.all(
                        color: PortColor.blue.withOpacity(0.75),
                        width: 2),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)),
                  ),
                  child: Center(
                    child: titleMedium(
                        text: "No",
                        color: PortColor.blue.withOpacity(0.75)),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              GestureDetector(
                onTap: (){
                  addressDeleteViewModel.deleteAddressApi(userid: "", addressId: addressId, context: context);
                  Navigator.pop(context);
                },
                child: Container(
                  height: screenHeight * 0.058,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: PortColor.blue.withOpacity(0.75),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)),
                  ),
                  child: Center(
                    child: titleMedium(
                        text: "Yes", color: PortColor.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
