import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view/account/widgets/add_gst_detail.dart';
import 'package:porter/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'constant_color.dart';
class ConstantAppbar extends StatefulWidget {
  const ConstantAppbar({super.key,});
  @override
  State<ConstantAppbar> createState() => _ConstantAppbarState();
}
class _ConstantAppbarState extends State<ConstantAppbar> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
      profileViewModel.profileApi();
    });

  }
  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    return  Container(
      decoration: const BoxDecoration(
        color: PortColor.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: screenHeight*0.02,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              titleSmall(text: " ${profileViewModel.profileModel?.data!.firstName?? ""} ${profileViewModel.profileModel?.data!.lastName?? ""}", color: PortColor.black),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddGstDetail()));
                  },
                  child: titleMedium(text: "Edit Profile", color: PortColor.blue)),
            ],
          ),
          SizedBox(height: screenHeight*0.001),
          titleMedium(
            text: " ${profileViewModel.profileModel?.data!.email?? ""}",
            color: PortColor.gray,
          ),
          SizedBox(height: screenHeight*0.001),
          elementsSmall(text: "Verify Email ID", color: PortColor.blue),
          SizedBox(height: screenHeight*0.02,),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddGstDetail(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: screenHeight*0.05,
              decoration: BoxDecoration(
                color: PortColor.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: titleMedium(text:
                "Add GST Details",color: PortColor.blue

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

