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
    return Transform.scale(
      scale: .9,
      child: Container(
        height: 48,
        width: 51,
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
                width: 50,
                height: 40,
                borderRadius: 6,
                borderWidth: 1.2,
                enableBorderColor: AppColors.kPrimaryColor,
                focusColor: AppColors.kPrimaryColor,
                controller: widget.controller,
                fillColor: Colors.white,
                marginVertical: 0,
                marginHorizontal: 0,
              ),
              // TextField(
              //   controller: widget.controller,
              //   focusNode: widget.focusNode,
              //   style: const TextStyle(
              //     fontWeight: FontWeight.w600,
              //     color: AppColors.kPrimaryColor,
              //     fontSize: 20,
              //   ),
              //   onChanged: (value) {
              //     if (value.length == 1) {
              //       FocusScope.of(context).nextFocus();
              //       setState(() {});
              //     }
              //     if (value.isEmpty) {
              //       FocusScope.of(context).previousFocus();
              //       setState(() {});
              //     }
              //   },
              //   cursorColor: AppColors.kPrimaryColor,
              //   keyboardType: TextInputType.number,
              //   textAlign: TextAlign.center,
              //   inputFormatters: [
              //     LengthLimitingTextInputFormatter(1),
              //     FilteringTextInputFormatter.digitsOnly,
              //   ],
              //   decoration: InputDecoration(
              //       border: InputBorder.none,
              //       filled: true,
              //       fillColor: Colors.white,
              //       contentPadding: EdgeInsets.zero,
              //       isDense: false),
              // ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(AssetsConstant.otpContainer_icon)),
            ],
          ),
        ),
      ),
    );
  }
}
