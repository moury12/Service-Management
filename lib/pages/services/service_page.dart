import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/shared/enums.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class ServicesScreen extends StatefulWidget {
  static const String routeName = '/service';

  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  ServicesType servicesType = ServicesType.Upcoming;
  bool openInfo = false;

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
                              : const Color(0xffFC8E99)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
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
                              : const Color(0xffFC8E99)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
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
                              : const Color(0xffFC8E99)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16)
                              .copyWith(top: 8),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
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
                              ServiceHeadingWidget(),
                              servicesType == ServicesType.Cancelled
                                  ? const SizedBox.shrink()
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          openInfo = !openInfo;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          const Divider(
                                            thickness: 0.5,
                                            color: Color(0xffF1B2BF),
                                          ),
                                          openInfo
                                              ? Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Maid Info',
                                                        style: AppTheme
                                                            .textStyleSemiBoldFadeBlack14,
                                                      ),
                                                    ),
                                                    CustomSizedBox.space12H,
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: index == 1 &&
                                                              servicesType ==
                                                                  ServicesType
                                                                      .Upcoming
                                                          ? Text(
                                                              'No maid has been assign yet',
                                                              style: AppTheme
                                                                  .textStyleSemiBoldFadeBlack14,
                                                            )
                                                          : FittedBox(
                                                              child: Row(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    child: Image
                                                                        .asset(
                                                                      AssetsConstant
                                                                          .dummy_service,
                                                                      height:
                                                                          64,
                                                                      width: 64,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  CustomSizedBox
                                                                      .space8W,
                                                                  const Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Shahida Parvin',
                                                                        style: AppTheme
                                                                            .textStyleSemiBoldBlack18,
                                                                      ),
                                                                      CustomSizedBox
                                                                          .space4H,
                                                                      Text(
                                                                        'User Id: CAE43456',
                                                                        style: AppTheme
                                                                            .textStyleSemiBoldBlack12,
                                                                      ),
                                                                      CustomSizedBox
                                                                          .space4H,
                                                                      Text(
                                                                        'Has been assigned for your service.',
                                                                        style: AppTheme
                                                                            .textStyleMediumFadeBlack12,
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                    ),
                                                    CustomSizedBox.space12H,
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'Location Info',
                                                          style: AppTheme
                                                              .textStyleSemiBoldFadeBlack14,
                                                        )),
                                                    CustomSizedBox.space12H,
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90),
                                                            color: AppColors
                                                                .kAppbarColor,
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6),
                                                          child: const Icon(
                                                            Icons.location_pin,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        CustomSizedBox.space8W,
                                                        Text(
                                                          '52/A, Kalabagan, Dhanmondi-32',
                                                          style: AppTheme
                                                              .textStyleSemiBoldFadeBlack14,
                                                        ),
                                                      ],
                                                    ),
                                                    CustomSizedBox.space12H,
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.asset(
                                                          AssetsConstant
                                                              .map_img),
                                                    ),
                                                    servicesType ==
                                                            ServicesType
                                                                .Upcoming
                                                        ? Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    CustomButton(
                                                                        onPressed:
                                                                            () {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return CenterDialogWidget();
                                                                            },
                                                                          );
                                                                        },
                                                                        labelColor:
                                                                            AppColors
                                                                                .kPrimaryColor,
                                                                        boxShadowColor:
                                                                            Colors
                                                                                .transparent,
                                                                        isBorder:
                                                                            true,
                                                                        borderColor:
                                                                            AppColors
                                                                                .kPrimaryColor,
                                                                        primary:
                                                                            Colors
                                                                                .white,
                                                                        marginVertical:
                                                                            6,
                                                                        marginHorizontal:
                                                                            0,
                                                                        borderRadiusAll:
                                                                            22,
                                                                        label:
                                                                            'Cancel order'),
                                                              ),
                                                              CustomSizedBox
                                                                  .space8W,
                                                              Expanded(
                                                                child: CustomButton(
                                                                    onPressed:
                                                                        () {},
                                                                    marginVertical:
                                                                        6,
                                                                    marginHorizontal:
                                                                        0,
                                                                    borderRadiusAll:
                                                                        22,
                                                                    label:
                                                                        'Scan Maid ID'),
                                                              ),
                                                            ],
                                                          )
                                                        : const SizedBox
                                                            .shrink(),
                                                    CustomSizedBox.space8H,
                                                    Image.asset(
                                                      AssetsConstant
                                                          .arrow_up_icon,
                                                      height: 10,
                                                    )
                                                  ],
                                                )
                                              : Image.asset(
                                                  AssetsConstant
                                                      .arrow_down_icon,
                                                  height: 10,
                                                )
                                        ],
                                      ),
                                    ),
                              CustomSizedBox.space12H,
                            ],
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: servicesType == ServicesType.Completed
                                    ? const Color(0xff2CC307)
                                    : servicesType == ServicesType.Cancelled
                                        ? AppColors.kAppbarColor
                                        : AppColors.kPrimaryColor,
                                borderRadius: const BorderRadius.only(
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

class ServiceHeadingWidget extends StatelessWidget {
  const ServiceHeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        HomeServiceItemWidget(
          height: 37,
          label: SizedBox.shrink(),
        ),
        CustomSizedBox.space12W,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Cleaning',
              style: AppTheme.textStyleSemiBoldBlack16,
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
                  style: AppTheme.textStyleMediumFadeBlack12,
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
                  style: AppTheme.textStyleMediumFadeBlack12,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class CenterDialogWidget extends StatelessWidget {
  const CenterDialogWidget({
    super.key,
    this.content,
    this.title,
    this.padding,
  });

  final Widget? content;
  final Widget? title;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(16),
          titlePadding: padding ?? EdgeInsets.zero,
          insetPadding: const EdgeInsets.all(16),
          title: title ?? SizedBox.shrink(),
          content: content ??
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Align(
                      child: Image.asset(
                        AssetsConstant.cancel_icon,
                        color: Colors.black,
                        height: 15,
                      ),
                      alignment: Alignment.topRight,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.kAppbarColor,
                        AppColors.kPrimaryColor,
                      ]),
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    padding: const EdgeInsets.all(36),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        AssetsConstant.cancel_icon,
                        height: 20,
                      ),
                    ),
                  ),
                  CustomSizedBox.space16H,
                  const Text(
                    'Cancel Order!',
                    style: AppTheme.textStyleSemiBoldPrimary20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Are you sure want to cancel your service order?',
                      style: AppTheme.textStyleNormalBlack14,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomSizedBox.space8H,
                  CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      marginVertical: 6,
                      marginHorizontal: 0,
                      borderRadiusAll: 22,
                      label: 'Yes, Cancel Order'),
                  CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      labelColor: AppColors.kPrimaryColor,
                      boxShadowColor: Colors.transparent,
                      isBorder: true,
                      borderColor: AppColors.kPrimaryColor,
                      primary: Colors.white,
                      marginVertical: 6,
                      marginHorizontal: 0,
                      borderRadiusAll: 22,
                      label: 'Cancel'),
                ],
              ),
        );
      },
    );
  }
}
