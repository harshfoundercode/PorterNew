import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/constant_text.dart';
import 'package:porter/view_model/terms_and_condition_view_model.dart';
import 'package:provider/provider.dart';
class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final termConditionViewModel =
      Provider.of<TermAndConditionViewModel>(context, listen: false);
      termConditionViewModel.termConditionApi();
      print("I am the....");
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PortColor.grey,
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.06,
              width: screenWidth,
              decoration: BoxDecoration(
                color: PortColor.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.06,
                  ),

                  SizedBox(
                    width: screenWidth * 0.24,
                  ),
                  titleSmall(
                    text: "Terms and Condition",
                    color: PortColor.black,
                  ),
                  SizedBox(
                    width: screenWidth * 0.16,
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.dangerous_outlined))
                ],
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}
