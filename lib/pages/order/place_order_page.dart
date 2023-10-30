import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/order/delivery_details_page.dart';
import 'package:fix_ican/pages/order/payment_method_page.dart';
import 'package:fix_ican/pages/services/service_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/divider/custom_divider.dart';

class PlaceOrderScreen extends StatefulWidget {
  static const String routeName = '/placeorder';

  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  bool isChecked = false;
  bool placedOrder = false;
  bool confirm = false;
  List<Process> processes = [
    Process(name: '1', isComplete: false, topic: 'Service'),
    Process(name: '2', isComplete: false, topic: 'Order'),
    Process(name: '3', isComplete: false, topic: 'Checkout'),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      action: [],
      title: const Text.rich(TextSpan(
          text: 'Order Review',
          style: AppTheme.textStyleSemiBoldWhite18,
          children: [
            TextSpan(
                text: '\nCustomer ID: CA56589',
                style: AppTheme.textStyleSemiBoldWhite10)
          ])),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                      color: !placedOrder
                          ? Colors.black.withOpacity(0.06)
                          : Colors.transparent,
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                ProcessWidget(
                  holdingProcess: placedOrder ? 3 : 2,
                  processNameList: processes.map((e) => e.topic).toList(),
                  contentHeight: 40,
                ),
                ...List.generate(
                  placedOrder ? 0 : 3,
                  (index) => placedOrder
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: isChecked
                                              ? AppColors.kPrimaryColor
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: const Color(0xffFFD9D9),
                                            width: 1.4,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: isChecked
                                          ? Image.asset(
                                              AssetsConstant.check_icon,
                                              height: 12,
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  ),
                                  const HomeServiceItemWidget(
                                    height: 37,
                                    label: SizedBox.shrink(),
                                  ),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Basic Cleaning',
                                        style:
                                            AppTheme.textStyleSemiBoldBlack16,
                                      ),
                                      CustomSizedBox.space8H,
                                      Text.rich(TextSpan(
                                          text: 'Estimated time: ',
                                          style: AppTheme
                                              .textStyleMediumFadeBlack12,
                                          children: [
                                            TextSpan(
                                              text: ' 2:30 hrs',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ])),
                                      CustomSizedBox.space4H,
                                      Text(
                                        'Tk.1299',
                                        style:
                                            AppTheme.textStyleSemiBoldFBlack16,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        AssetsConstant.edit_icon3,
                                        height: 15,
                                      ),
                                      CustomSizedBox.space20H,
                                      Image.asset(
                                        AssetsConstant.delete_icon,
                                        height: 15,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(
                                thickness: 0.5,
                                color: Color(0xffF1B2BF).withOpacity(.6),
                              ),
                            ),
                          ],
                        ),
                ),
                placedOrder
                    ? SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.kPrimaryColor,
                            ),
                            CustomSizedBox.space4W,
                            Text(
                              'Add More Service',
                              style: AppTheme.textStyleMediumPrimary14,
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
          placedOrder
              ? Column(
                  children: [
                    CustomSizedBox.space12H,
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.1))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Available Maid',
                              style: AppTheme.textStyleMediumBlack14,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.kPrimaryColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: const Text(
                              '05',
                              style: AppTheme.textStyleMediumWhite18,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.1))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  color: AppColors.kAppbarColor,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                ),
                              ),
                              CustomSizedBox.space8W,
                              Text(
                                'Location',
                                style: AppTheme.textStyleSemiBoldFadeBlack14,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(DeliveryDetailsScreen.routeName);
                                },
                                child: Image.asset(
                                  AssetsConstant.edit_icon2,
                                  height: 18,
                                ),
                              )
                            ],
                          ),
                          CustomSizedBox.space12H,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(AssetsConstant.map_img),
                          ),
                          CustomSizedBox.space12H,
                          const Text(
                            '52/A, Kalabagan, Dhanmondi-32',
                            style: AppTheme.textStyleSemiBoldFadeBlack10,
                          ),
                          CustomSizedBox.space8H,
                          Divider(
                            thickness: 0.5,
                            color: Color(0xffF1B2BF).withOpacity(.6),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: AppColors.kPrimaryColor,
                                ),
                                CustomSizedBox.space4W,
                                Text(
                                  'Add Location Instruction',
                                  style: AppTheme.textStyleMediumPrimary14,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.1))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12)
                                .copyWith(bottom: 0),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: AppColors.kAppbarColor,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      AssetsConstant.wallet_icon,
                                      height: 18,
                                    )),
                                CustomSizedBox.space8W,
                                Text(
                                  'Payment Method',
                                  style: AppTheme.textStyleSemiBoldBlack18,
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => Get.toNamed(
                                      PaymentMethodSelectionScreen.routeName),
                                  borderRadius: BorderRadius.circular(90),
                                  child: Image.asset(
                                    AssetsConstant.edit_icon2,
                                    height: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                          CustomSizedBox.space12H,
                          ListTile(
                            leading: Image.asset(
                              AssetsConstant.cash_icon,
                              height: 18,
                            ),
                            title: const Text(
                              'Cash',
                              style: AppTheme.textStyleSemiBoldBlack16,
                            ),
                            trailing: const Text(
                              'Tk. 2598',
                              style: AppTheme.textStyleSemiBoldFBlack16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.1))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: AppColors.kAppbarColor,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    AssetsConstant.wallet_icon,
                                    height: 18,
                                  )),
                              CustomSizedBox.space8W,
                              Text(
                                'Order Summary',
                                style: AppTheme.textStyleSemiBoldBlack18,
                              ),
                            ],
                          ),
                          CustomSizedBox.space12H,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rate Per Work (1299*2)',
                                style: AppTheme.textStyleMediumFadeBlack14,
                              ),
                              Text(
                                'Tk. 2598',
                                style: AppTheme.textStyleMediumBlack16,
                              ),
                            ],
                          ),
                          CustomSizedBox.space4H,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Service Charge (15%)',
                                style: AppTheme.textStyleMediumFadeBlack14,
                              ),
                              Text(
                                'Tk. 2598',
                                style: AppTheme.textStyleMediumBlack16,
                              ),
                            ],
                          ),
                          CustomSizedBox.space4H,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: AppTheme.textStyleMediumFadeBlack14,
                              ),
                              Text(
                                'Tk. 0',
                                style: AppTheme.textStyleMediumBlack16,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 130)
                  ],
                )
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6),
                    child: const Text(
                      'Popular Services',
                      style: AppTheme.textStyleSemiBoldBlack18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Text(
                      'Check out what’s popular now',
                      style: AppTheme.textStyleMediumFadeBlack12,
                    ),
                  ),
                  SizedBox(
                    height: 135,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Stack(
                        alignment: Alignment.center,
                        children: [
                          HomeServiceItemWidget(
                              height: 30,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              label: const SizedBox.shrink(),
                              padding: const EdgeInsets.all(34)
                                  .copyWith(bottom: 45, top: 25)),
                          const Positioned(
                            bottom: 16,
                            child: Text(
                              'Basic Cleaning',
                              style: AppTheme.textStyleMediumFadeBlack12,
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.kPrimaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 8,
                                          color: Colors.black.withOpacity(.1))
                                    ],
                                    borderRadius: BorderRadius.circular(90)),
                                child: Image.asset(
                                  AssetsConstant.add_icon,
                                  color: Colors.white,
                                  height: 10,
                                ),
                              ))
                        ],
                      ),
                      itemCount: 5,
                    ),
                  ),
                  CustomSizedBox.space8H,
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black.withOpacity(.1))
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Apply Promo Code',
                          style: AppTheme.textStyleSemiBoldPrimary14,
                        ),
                        Image.asset(
                          AssetsConstant.date_forward_icon,
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 220)
                ])
        ],
      ),
      bottom: Container(
        height: placedOrder ? 120 : 200,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1))
            ]),
        child: Column(
          children: [
            placedOrder
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rate Per Work (1299*2)',
                            style: AppTheme.textStyleMediumFadeBlack14,
                          ),
                          Text(
                            'Tk. 2598',
                            style: AppTheme.textStyleMediumBlack16,
                          ),
                        ],
                      ),
                      CustomSizedBox.space4H,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service Charge (15%)',
                            style: AppTheme.textStyleMediumFadeBlack14,
                          ),
                          Text(
                            'Tk. 2598',
                            style: AppTheme.textStyleMediumBlack16,
                          ),
                        ],
                      ),
                      CustomSizedBox.space4H,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: AppTheme.textStyleMediumFadeBlack14,
                          ),
                          Text(
                            'Tk. 0',
                            style: AppTheme.textStyleMediumBlack16,
                          )
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: Color(0xffFFD9D9).withOpacity(.6),
                      ),
                    ],
                  ),
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
                        text: '  (Inc. VAT)',
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
              label: placedOrder ? 'Confirm' : 'Place Order',
              onPressed: () {
                // if(!placedOrder){
                //   placedOrder = true;
                //   setState
                // }
                placedOrder
                    ? {
                        confirm = true,
                        setState(() {}),
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              confirm == true;
                              return CenterDialogWidget(
                                headtitle: 'Order Successful!',
                                buttonText: 'View Details',
                                paddingOfICon: 24.00,
                                stacked: true,
                                image: Image.asset(
                                  AssetsConstant.check_icon,
                                  color: AppColors.kPrimaryColor,
                                ),
                                subtitle:
                                    'Your order has been placed successfully. Within very short time  you can enjoy your service',
                              );
                            });
                          },
                        )
                      }
                    : setState(() {
                        placedOrder = true;
                      });
                // Get.toNamed(PlaceOrderScreen.routeName);
              },
              marginHorizontal: 0,
              marginVertical: 0,
              borderRadiusAll: 22,
            )
          ],
        ),
      ),
    );
  }
}

class Process {
  String name;
  String topic;
  bool isComplete;

  Process({required this.name, required this.isComplete, required this.topic});
}

class ProcessWidget extends StatelessWidget {
  const ProcessWidget({
    super.key,
    required this.holdingProcess,
    required this.processNameList,
    this.contentHeight,
  });

  final int holdingProcess;
  final double? contentHeight;
  final List<String> processNameList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: processNameList.map((e) {
        final newList = processNameList.sublist(holdingProcess);
        var index = processNameList.indexOf(e);

        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  if (processNameList.length > 3)
                    Expanded(
                      child: CustomDivider(
                        thickness: 3,
                        color: index == 0
                            ? Colors.transparent
                            : holdingProcess > index || index == holdingProcess
                                ? AppColors.kAppbarColor
                                : AppColors.kAccentColor,
                      ),
                    ),
                  Expanded(
                    child: CustomDivider(
                      thickness: 5,
                      color: holdingProcess > index
                          ? AppColors.kAppbarColor
                          : AppColors.kAccentColor,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: index == holdingProcess
                          ? Colors.white
                          : !newList.contains(e)
                              ? AppColors.kAppbarColor
                              : Colors.white,
                      border: Border.all(
                        color: AppColors.kAppbarColor,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: index == holdingProcess
                                ? AppColors.kAppbarColor
                                : !newList.contains(e)
                                    ? Colors.white
                                    : AppColors.kAppbarColor),
                      ),
                    ),
                  ),
                  if (processNameList.length > 3)
                    Expanded(
                      child: CustomDivider(
                        thickness: 5,
                        color: holdingProcess > index
                            ? AppColors.kAppbarColor
                            : AppColors.kAccentColor,
                      ),
                    ),
                  Expanded(
                    child: CustomDivider(
                      thickness: 5,
                      color: holdingProcess >
                              index +
                                  (holdingProcess == processNameList.length
                                      ? 0
                                      : 1)
                          ? AppColors.kAppbarColor
                          : AppColors.kAccentColor,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: index == 0 && processNameList.length < 4
                    ? Alignment.centerLeft
                    : index == processNameList.length - 1 &&
                            processNameList.length < 4
                        ? Alignment.centerRight
                        : Alignment.center,
                child: Container(
                  height: contentHeight ?? 50,
                  padding: const EdgeInsets.all(8.0).copyWith(
                    left: index == 0 && processNameList.length < 4 ? 42 : 8,
                    right: index == processNameList.length - 1 &&
                            processNameList.length < 4
                        ? 35
                        : 8,
                  ),
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: AppColors.kAppbarColor),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {Key? key, this.color, this.thickness, this.indent, this.endIndent})
      : super(key: key);

  final Color? color;
  final double? thickness, indent, endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.kAppbarColor,
      thickness: thickness ?? 0.5,
      indent: indent ?? 0,
      endIndent: endIndent ?? 0,
    );
  }
}
