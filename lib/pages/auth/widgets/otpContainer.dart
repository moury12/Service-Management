import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class OtpContainer extends StatefulWidget {
  const OtpContainer(
      {super.key, required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  State<OtpContainer> createState() => _OtpContainerState();
}

class _OtpContainerState extends State<OtpContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 0),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(6),
      //     border: Border.all(
      //         width: widget.controller.text.isNotEmpty ? 1 : 0.5,
      //         color: AppColors.kPrimaryColor)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Container(
            //   width: 50,
            //   color: Colors.red,
            // ),
            CustomTextField(
              keyboardType: TextInputType.number,
              width: MediaQuery.of(context).size.width / 8,
              height: 40,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  setState(() {});
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                  setState(() {});
                }
              },

              // inputFormatters: [
              //   LengthLimitingTextInputFormatter(1),
              //   FilteringTextInputFormatter.digitsOnly,
              // ],
              borderRadius: 6,
              borderWidth: 1.2,
              enableBorderColor: AppColors.kPrimaryColor,
              focusColor: AppColors.kPrimaryColor,
              controller: widget.controller,
              fillColor: Colors.white,
              marginVertical: 0,
              marginHorizontal: 0,
            ),

            Positioned(
                bottom: 1.2,
                left: 1.2,
                right: 1.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.2),
                  child: Image.asset(AssetsConstant.otpContainer_icon),
                )),
          ],
        ),
      ),
    );
  }
}
