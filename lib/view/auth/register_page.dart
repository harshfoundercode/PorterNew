import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/utils/utils.dart';
import 'package:porter/view/auth/login_page.dart';
import 'package:porter/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isSelected = false;
  dynamic selectedRadioValue;

  final List<Map<String, String>> options = [
    {
      "title": "Personal Needs",
      "description": "Items like tiffins, furniture, documents etc",
      "id": "1",
    },
    {
      "title": "Business Needs",
      "description": "Goods like plywood, marbles, electronics etc",
      "id": "2",
    },
    {
      "title": "Packers & Movers",
      "description": "End to End house shifting Solution",
      "id": "3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Map arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final registerViewModel =  Provider.of<RegisterViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                     height: screenHeight * 0.2,
                      width: screenWidth * 0.65,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.assetsCourierLogo),
                            fit: BoxFit.fill),
                      )),
                ),
               // SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: const AssetImage(Assets.assetsIndiaflagsquare),
                        height: screenHeight * 0.023),
                    SizedBox(width: screenWidth*0.02,),
                    titleSmall(text:arguments["mobileNumber"],color: PortColor.black),
                    SizedBox(width: screenWidth * 0.03),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: elementsSmall(text:"CHANGE",color: PortColor.blue
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: "First Name",
                          hintStyle:
                              TextStyle(fontSize: 16, color: PortColor.gray),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: PortColor.gray),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: PortColor.gray),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.06),
                    Expanded(
                      child: TextFormField(
                        controller: lastnameController,
                        decoration: const InputDecoration(
                          hintText: "Last Name",
                          hintStyle:
                              TextStyle(fontSize: 16, color: PortColor.gray),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: PortColor.gray),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: PortColor.gray),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email Id",
                    hintStyle: TextStyle(fontSize: 16, color: PortColor.gray),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: PortColor.gray),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: PortColor.gray),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                titleMedium(text: "Have referral code?", color: PortColor.blue),
                SizedBox(height: screenHeight * 0.04),
                headingMedium(
                    text: "I will be using Porter for:",
                    color: PortColor.black),
                SizedBox(height: screenHeight * 0.01),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount:options.length,
                    itemBuilder: (context, index){
                      final data = options[index];
                  return buildOption(data["title"].toString(), data["description"].toString(), data["id"].toString());
                }),
                SizedBox(height: screenHeight * 0.04),
                GestureDetector(
                  onTap: (){
                    if(nameController.text.isEmpty){
                      Utils.showErrorMessage(context,"Please enter First Name",);
                    }else if(lastnameController.text.isEmpty){
                      Utils.showErrorMessage(context,"Please enter Last Name",);
                    }else if(emailController.text.isEmpty){
                      Utils.showErrorMessage(context,"Please enter Email Address",);
                    } else if (selectedRadioValue == null) {
                      Utils.showErrorMessage(context,"Please select an option",);
                    }
                    else{
                      registerViewModel.registerApi(
                        nameController.text,
                        lastnameController.text,
                        emailController.text,
                        arguments["mobileNumber"],
                        selectedRadioValue,
                        context,
                      );
                    }

                  },
                  child: Container(
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: PortColor.buttonBlue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: !registerViewModel.loading?
                        headingMedium(text: "Register", color: PortColor.white):const CircularProgressIndicator(color: PortColor.white,),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.054,
                        decoration: BoxDecoration(
                          color:
                              isSelected ? PortColor.blue : Colors.transparent,
                          border: Border.all(
                            color: PortColor.blue,
                            width: screenWidth * 0.004,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: isSelected
                            ? const Icon(Icons.check, color: Colors.white, size: 16)
                            : null,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    elementsSmall(
                        text: "Allow Courier to send updates on ",
                        color: PortColor.black.withOpacity(0.6)),
                    Image(
                        image: const AssetImage(Assets.assetsWhatsappcolor),
                        height: screenHeight * 0.02),
                    elementsSmall(
                        text: " WhatsApp",
                        color: PortColor.black.withOpacity(0.6)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                titleMedium(
                  textAlign: TextAlign.center,
                    text:
                        "A one-time password (OTP) will be sent to this number for verification",
                    color: PortColor.black),
                SizedBox(height: screenHeight*0.02,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOption(String title, String subtitle, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: screenHeight * 0.08,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
          color: PortColor.gray,
          width: screenWidth * 0.002,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth*0.002,),
        leading: Radio(
          value: value,
          groupValue: selectedRadioValue,
          onChanged: (newValue) {
            setState(() {
              selectedRadioValue = newValue;
            });
          },
        ),
        title: headingMedium(text: title, color: PortColor.black),
        subtitle: elementsSmall(text: subtitle, color: PortColor.gray),
      ),
    );
  }
}
