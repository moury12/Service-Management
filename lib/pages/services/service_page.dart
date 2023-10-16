import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/shared/enums.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  static const String routeName = '/service';

  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  ServicesType servicesType = ServicesType.Upcoming;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: servicesType == ServicesType.Upcoming
                              ? AppColors.kPrimaryColor
                              : Color(0xffFC8E99)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: AppColors.kPrimaryColor,
                    height: servicesType == ServicesType.Upcoming ? 3 : 0,
                    width: servicesType == ServicesType.Upcoming
                        ? MediaQuery.of(context).size.width / 4.5
                        : 0,
                  )
                ],
              ),
              onTap: () {
                servicesType = ServicesType.Upcoming;
                setState(() {});
              },
            ),
            InkWell(
              onTap: () {
                servicesType = ServicesType.Completed;
                setState(() {});
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: servicesType == ServicesType.Completed
                              ? AppColors.kPrimaryColor
                              : Color(0xffFC8E99)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: AppColors.kPrimaryColor,
                    height: servicesType == ServicesType.Completed ? 3 : 0,
                    width: servicesType == ServicesType.Completed
                        ? MediaQuery.of(context).size.width / 4.5
                        : 0,
                  )
                ],
              ),
            ),
            InkWell(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Cancelled',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: servicesType == ServicesType.Cancelled
                              ? AppColors.kPrimaryColor
                              : Color(0xffFC8E99)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: AppColors.kPrimaryColor,
                    height: servicesType == ServicesType.Cancelled ? 3 : 0,
                    width: servicesType == ServicesType.Cancelled
                        ? MediaQuery.of(context).size.width / 4.5
                        : 0,
                  )
                ],
              ),
              onTap: () {
                servicesType = ServicesType.Cancelled;
                setState(() {});
              },
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          height: 0,
          indent: 0,
          color: Color(0xffF1B2BF),
        ),
        Column(
          children: [
            ...List.generate(
                5,
                (index) => Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16)
                              .copyWith(top: 8),
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(.08))
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  HomeServiceItemWidget(
                                    height: 37,
                                    label: SizedBox.shrink(),
                                  ),
                                  CustomSizedBox.space12W,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Basic Cleaning',
                                        style:
                                            AppTheme.textStyleSemiBoldBlack16,
                                      ),
                                      CustomSizedBox.space8H,
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.black54,
                                            size: 12,
                                          ),
                                          Text(
                                            '12 November 2023',
                                            style: AppTheme
                                                .textStyleMediumFadeBlack12,
                                          ),
                                        ],
                                      ),
                                      CustomSizedBox.space4H,
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later_outlined,
                                            color: Colors.black54,
                                            size: 12,
                                          ),
                                          Text(
                                            '12:00 - 2:30 PM',
                                            style: AppTheme
                                                .textStyleMediumFadeBlack12,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Color(0xffF1B2BF),
                              ),
                              Image.asset(
                                AssetsConstant.arrow_down_icon,
                                height: 10,
                              ),
                              CustomSizedBox.space12H,
                            ],
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 8,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: servicesType == ServicesType.Completed
                                    ? Color(0xff2CC307)
                                    : servicesType == ServicesType.Cancelled
                                        ? AppColors.kAppbarColor
                                        : AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8))),
                            child: Text(
                              servicesType == ServicesType.Completed
                                  ? 'Completed'
                                  : servicesType == ServicesType.Cancelled
                                      ? 'Cancelled'
                                      : "Upcoming",
                              style: AppTheme.textStyleMediumWhite10,
                            ),
                          ),
                        )
                      ],
                    ))
          ],
        )
      ],
    );
  }
}
