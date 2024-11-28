import 'package:flutter/material.dart';
import 'package:porter/generated/assets.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/view/home/widgets/pickup/deliver_all_india_parcel.dart';
import 'package:porter/view/home/widgets/pickup/deliver_by_packer_mover.dart';
import 'package:porter/view/home/widgets/pickup/deliver_by_truck.dart';
import 'package:porter/view_model/service_type_view_model.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final serviceTypeViewModel =
      Provider.of<ServiceTypeViewModel>(context, listen: false);
      serviceTypeViewModel.serviceTypeApi();
      print("helokokfio");
    });
  }
  @override
  Widget build(BuildContext context) {
    final serviceTypeViewModel = Provider.of<ServiceTypeViewModel>(context);

    return serviceTypeViewModel.loading
      ?const Center(child: CircularProgressIndicator())
    :serviceTypeViewModel.serviceTypeModel?.data
      ?.isNotEmpty == true
    ?  GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 7,
      ),
      itemCount: serviceTypeViewModel.serviceTypeModel!.data!.length,
      itemBuilder: (context, index) {
        final services = serviceTypeViewModel.serviceTypeModel!.data![index];
        return GestureDetector(
          onTap: () {
            if (index == 0 || index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliverByTruck(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliverAllIndiaParcel(),
                ),
              );
            } else  {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliverByPackerMover(),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(19),
              boxShadow: [
                BoxShadow(
                  color: PortColor.grayLight.withOpacity(0.1),
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenWidth * 0.03,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          services.name??"",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: PortColor.grayLight,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.006),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.network(
                        services.images??"",
                        height: 90),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    )
        : const Center(child: Text("No vehicles Available"));
  }
}

