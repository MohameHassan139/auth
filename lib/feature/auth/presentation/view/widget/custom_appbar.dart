import 'package:auth/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: height * 0.31,
          ),
          Image.asset(
            CustomImages.background,
            height: height * 0.25,
            width: double.infinity,
            scale: 2,
            fit: BoxFit.cover,
          ),
          Image.asset(
            CustomImages.graphic,
            height: height * 0.25,
            width: width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {
                // TODO
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                       BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                      ),
                    ]),
                child: Image.asset(
                  CustomImages.protfile,
                  height: 116,
                  width: 116,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
