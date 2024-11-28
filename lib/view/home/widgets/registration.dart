import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/res/custom_text_field.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController monthlyTripsController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    companyController.dispose();
    emailController.dispose();
    monthlyTripsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PortColor.white,
      body: ListView(
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
                SizedBox(width: screenWidth * 0.36),
                headingMedium(
                  text: "Register Now!",
                  color: PortColor.black,
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Image(image: AssetImage(Assets.assetsCrossicon)))
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.63,
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.02),
            decoration: BoxDecoration(
                color: PortColor.grey,
                border: Border(
                  top: BorderSide(color: PortColor.black, width: screenWidth * 0.007),
                  left: BorderSide(color: PortColor.gray.withOpacity(0.1)),
                  right: BorderSide(color: PortColor.gray.withOpacity(0.1)),
                  bottom: BorderSide(color: PortColor.gray.withOpacity(0.1)),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: const AssetImage(Assets.assetsPortericon), height: screenHeight * 0.06),
                Align(
                    alignment: Alignment.center,
                    child: titleSmall(text: 'Interest Form', color: PortColor.black)),
                const Divider(),
                SizedBox(height: screenHeight * 0.017),
                titleMedium(text: 'Name', color: PortColor.black),
                CustomTextField(
                  controller: nameController,
                  height: screenHeight * 0.042,
                  cursorHeight: screenHeight * 0.022,
                  focusedBorder: PortColor.blue,

                ),
                SizedBox(height: screenHeight * 0.013),
                titleMedium(text: '*Mobile Number ', color: PortColor.black),
                CustomTextField(
                  controller: mobileController,
                  height: screenHeight * 0.045,
                  cursorHeight: screenHeight * 0.022,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  focusedBorder: PortColor.blue,
                ),
                SizedBox(height: screenHeight * 0.013),
                titleMedium(text: 'Company', color: PortColor.black),
                CustomTextField(
                  controller: companyController,
                  height: screenHeight * 0.045,
                  cursorHeight: screenHeight * 0.022,
                  focusedBorder: PortColor.blue,
                ),
                SizedBox(height: screenHeight * 0.013),
                titleMedium(text: 'Email', color: PortColor.black),
                CustomTextField(
                  controller: emailController,
                  height: screenHeight * 0.045,
                  cursorHeight: screenHeight * 0.022,
                  focusedBorder: PortColor.blue,
                ),
                SizedBox(height: screenHeight * 0.013),
                titleMedium(text: 'Monthly Trips:', color: PortColor.black),
                CustomTextField(
                  controller: monthlyTripsController,
                  height: screenHeight * 0.045,
                  cursorHeight: screenHeight * 0.022,
                  focusedBorder: PortColor.blue,
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    SizedBox(width: screenWidth * 0.24),
                    Container(
                      height: screenHeight * 0.047,
                      width: screenWidth * 0.22,
                      decoration: BoxDecoration(
                        color: PortColor.white,
                        border: Border.all(color: PortColor.blue.withOpacity(0.75), width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: elementsMedium(text: "Clear", color: PortColor.blue.withOpacity(0.75)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: screenHeight * 0.047,
                      width: screenWidth * 0.22,
                      decoration: BoxDecoration(
                        color: PortColor.blue.withOpacity(0.75),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: elementsMedium(text: "Submit", color: PortColor.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
