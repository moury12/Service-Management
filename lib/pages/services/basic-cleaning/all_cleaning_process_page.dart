import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/order/place_order_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class AllCleaningProcessScreen extends StatefulWidget {
  final String? title;
  final bool? isCustom;
  static const String routeName = '/weekly';

  const AllCleaningProcessScreen(
      {super.key, this.title, this.isCustom = false});

  @override
  State<AllCleaningProcessScreen> createState() =>
      _AllCleaningProcessScreenState();
}

class _AllCleaningProcessScreenState extends State<AllCleaningProcessScreen> {
  DateTime _currentMonth = DateTime.now();
  bool dateSelected = false;
  bool timeSelected = false;

  void _next() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  void _before() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    String month = DateFormat.MMMM().format(_currentMonth);
    List<DateTime> dates = getDatesForCurrentMonth(_currentMonth);
    return CustomScaffold(
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: const Color(0xffFFE5E5),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Frequency',
                      style: AppTheme.textStyleSemiBoldBlack18,
                    ),
                    CustomSizedBox.space4H,
                    Text(
                      'Change',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor, fontSize: 13),
                    )
                  ],
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: const Color(0xffFFF9F9),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    widget.title ?? 'Weekly',
                    style: const TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Choose your preferred professional',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return index == 0
                    ? Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 12),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFE6EB),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 1, color: const Color(0xffFC8E99))),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(190),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    AssetsConstant.auto_assign_icon,
                                    height: 21,
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    'iMaids',
                                    style: AppTheme.textStyleSemiBoldWhite12,
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'Auto-assign',
                                style: AppTheme.textStyleSemiBoldBlack16,
                              ),
                            ),
                            const Text(
                              'We’ll assign the best professional',
                              style: AppTheme.textStyleNormalFadeBlack10,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 12),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 1, color: const Color(0xffFC8E99))),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(190),
                                  child: Image.asset(
                                    AssetsConstant.dummy_service,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    'Samantha',
                                    style: AppTheme.textStyleSemiBoldBlack16,
                                  ),
                                ),
                                const Text(
                                  'Recommended in your area',
                                  style: AppTheme.textStyleNormalFadeBlack10,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              color: widget.title == 'One Time' ||
                                      widget.title == 'Custom'
                                  ? Colors.white.withOpacity(.5)
                                  : null,
                            ),
                          )
                        ],
                      );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Date',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        AssetsConstant.date_back_icon,
                        height: 15,
                        color:
                            month == 'January' ? null : AppColors.kPrimaryColor,
                      ),
                      onTap: () {
                        if (month != 'January') {
                          _before();
                        } else {}
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        month,
                        style: AppTheme.textStyleSemiBoldBlack14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (month != 'December') {
                          _next();
                        } else {}
                      },
                      child: Image.asset(
                        AssetsConstant.date_forward_icon,
                        height: 15,
                        color: month != 'December'
                            ? null
                            : AppColors.kPrimaryColor.withOpacity(.5),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10, top: 12),
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      dateSelected = !dateSelected;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        color: dateSelected ? AppColors.kPrimaryColor : null,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                            width: 1, color: const Color(0xffFC8E99))),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            DateFormat('EEE').format(dates[index]),
                            style: dateSelected
                                ? AppTheme.textStyleSemiBoldWhite16
                                : AppTheme.textStyleSemiBoldBlack16,
                          ),
                        ),
                        Text(
                          DateFormat('dd').format(dates[index]),
                          style: dateSelected
                              ? AppTheme.textStyleSemiBoldWhite14
                              : AppTheme.textStyleSemiBoldBlack14,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Text(
              'Select your preferred time',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          widget.isCustom == true
              ? Column(
                  children: [
                    ...List.generate(
                        3,
                        (index) => Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFE6EB),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xffFC8E99))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: const Text(
                                          'Sun 25',
                                          style:
                                              AppTheme.textStyleSemiBoldBlack16,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 16),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    const Color(0xffFC8E99))),
                                        child: Row(
                                          children: [
                                            Text(
                                              '12:30 - 01:00',
                                              style: AppTheme
                                                  .textStyleSemiBoldBlack16,
                                            ),
                                            CustomSizedBox.space8W,
                                            Image.asset(
                                              AssetsConstant.arrow_down_icon,
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 8,
                                    bottom: 8,
                                    left: 16,
                                    child: Image.asset(
                                        AssetsConstant.custom_stack_img))
                              ],
                            )),
                    SizedBox(
                      height: 120,
                    )
                  ],
                )
              : SizedBox(
                  height: 40,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            timeSelected = !timeSelected;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              color:
                                  timeSelected ? AppColors.kPrimaryColor : null,
                              borderRadius: BorderRadius.circular(26),
                              border: Border.all(
                                  width: 1, color: const Color(0xffFC8E99))),
                          child: Text(
                            '12:30 - 01:00',
                            style: timeSelected
                                ? AppTheme.textStyleSemiBoldWhite16
                                : AppTheme.textStyleSemiBoldBlack16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
          CustomSizedBox.space12H,
        ],
      ),
      bottom: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Total',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '(Inc. VAT where applicable)',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Tk. 2988',
                  style: AppTheme.textStyleBoldBlack18,
                )
              ],
            ),
            CustomSizedBox.space16H,
            CustomButton(
              label: 'Continue',
              onPressed: () {
                Get.toNamed(PlaceOrderScreen.routeName);
              },
              marginHorizontal: 0,
              marginVertical: 0,
              suffixImage: AssetsConstant.arrow_icon,
              suffixImageHeight: 11,
              borderRadiusAll: 22,
            )
          ],
        ),
      ),
      title: const Text('Basic Cleaning'),
    );
  }

  List<DateTime> getDatesForCurrentMonth(DateTime currentMonth) {
    DateTime firstDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month, 1);
    DateTime lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0);

    List<DateTime> dates = [];
    for (var i = firstDayOfMonth;
        i.isBefore(lastDayOfMonth) || i.isAtSameMomentAs(lastDayOfMonth);
        i = i.add(Duration(days: 1))) {
      dates.add(i);
    }

    return dates;
  }
}
