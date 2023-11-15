// import 'dart:async';
//
// import 'package:fix_ican/constants/assets_constant.dart';
// import 'package:fix_ican/constants/color_constant.dart';
// import 'package:fix_ican/shared/custom_sized_box.dart';
// import 'package:fix_ican/shared/extention.dart';
// import 'package:fix_ican/theme/theme_data.dart';
// import 'package:flutter/material.dart';
// import 'package:mh_core/utils/global.dart';
// import 'package:mh_core/widgets/button/custom_button.dart';
// import 'package:mh_core/widgets/textfield/custom_textfield.dart';
//
// class EcommercepanelScreen extends StatefulWidget {
//   static const String routeName = '/ecommerce';
//
//   const EcommercepanelScreen({super.key});
//
//   @override
//   State<EcommercepanelScreen> createState() => _EcommercepanelScreenState();
// }
//
// class _EcommercepanelScreenState extends State<EcommercepanelScreen>
//     with SingleTickerProviderStateMixin {
//   PageController pageController = PageController(initialPage: 0);
//   int currentPage = 0;
//   List<String> bannerContent = [
//     'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
//     'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//     'https://media.istockphoto.com/id/1466353453/photo/management-responsible-for-quality-control-iso-certification-product-quality-guarantee.webp?b=1&s=170667a&w=0&k=20&c=Aw_ZGT_TQInYjF0wiek4GugQQAsPE7YXjad7iPbNys0=',
//     'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
//     'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//     'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
//     'https://media.istockphoto.com/id/1423369897/photo/call-center-worker.webp?b=1&s=170667a&w=0&k=20&c=SKeoIBoh9SG15iFz94tEoOOPg8OA0iivmtGj0HY_JL0=',
//     'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//     'https://media.istockphoto.com/id/1423369897/photo/call-center-worker.webp?b=1&s=170667a&w=0&k=20&c=SKeoIBoh9SG15iFz94tEoOOPg8OA0iivmtGj0HY_JL0=',
//   ];
//   int currentIndex = 0;
//
//   bool _isTopPositionArrive = false;
//   ScrollController _categoryScrollController = ScrollController();
//
//   dynamic tapContext;
//
//   @override
//   void initState() {
//     tabController = TabController(length: tabtiles.length, vsync: this);
//     tabController.addListener(() {
//       setState(() {
//         currentIndex = tabController.index;
//       });
//       print("Current Tab Index: $currentIndex");
//     });
//     Timer.periodic(const Duration(milliseconds: 800), (timer) {
//       if (currentPage < (bannerContent.length - 1)) {
//         pageController.nextPage(
//             duration: const Duration(milliseconds: 800), curve: Curves.ease);
//       } else {
//         pageController.animateToPage(0,
//             duration: const Duration(milliseconds: 100), curve: Curves.ease);
//       }
//     });
//     _scrollController.addListener(() {
//       globalLogger.d(
//           containerKey.globalPaintBounds,
//           containerKey.globalPaintBounds!.top <=
//               MediaQuery.of(context).viewPadding.top);
//
//       if (containerKey.globalPaintBounds!.top <=
//           MediaQuery.of(context).viewPadding.top) {
//         _isTopPositionArrive = true;
//         setState(() {});
//       } else {
//         if (_isTopPositionArrive) {
//           _isTopPositionArrive = false;
//           setState(() {});
//         }
//       }
//       // if (_scrollController.position.pixels ==
//       //     _scrollController.position.maxScrollExtent) {
//       //   // Perform your task
//       // }
//     });
//     _keyList = List<GlobalKey>.generate(
//         tabtiles.length, (index) => GlobalKey(debugLabel: 'key_$index'),
//         growable: false);
//     super.initState();
//   }
//
//   ScrollController _scrollController = ScrollController();
//
//   final containerKey = GlobalKey();
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   List<GlobalKey> _keyList = [];
//
//   late TabController tabController;
//   List<Map<String, dynamic>> tabtiles = [
//     {
//       'title': 'Cookies',
//       'key': GlobalKey(),
//     },
//     {
//       'title': 'Dress',
//       'key': GlobalKey(),
//     },
//     {
//       'title': 'Cake',
//       'key': GlobalKey(),
//     },
//     {
//       'title': 'Veg',
//       'key': GlobalKey(),
//     },
//     {
//       'title': 'Meat',
//       'key': GlobalKey(),
//     },
//     {
//       'title': 'drinks',
//       'key': GlobalKey(),
//     },
//     {
//       'title': 'Perfume',
//       'key': GlobalKey(),
//     },
//     {
//       'title': 'Cloths',
//       'key': GlobalKey(),
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               controller: _scrollController,
//               child: Column(
//                 children: [
//                   // SizedBox(
//                   //   height: MediaQuery.of(context).viewPadding.top,
//                   // ),
//                   CustomSizedBox.space12H,
//                   const CustomTextField(
//                     hintText: 'Search a product',
//                     marginVertical: 0,
//                     marginHorizontal: 16,
//                     enableBorderColor: AppColors.kAccentColor,
//                     focusColor: AppColors.kPrimaryColor,
//                     prefixWidget: Icon(
//                       Icons.search_rounded,
//                       color: AppColors.kPrimaryColor,
//                     ),
//                     borderRadius: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: SizedBox(
//                       height: 164,
//                       child: PageView.builder(
//                         scrollDirection: Axis.horizontal,
//                         controller: pageController,
//                         onPageChanged: (value) {
//                           setState(() {
//                             currentPage = value;
//                           });
//                         },
//                         itemCount: bannerContent.length,
//                         itemBuilder: (context, index) {
//                           currentPage = index;
//                           String data = bannerContent[index];
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8.0, vertical: 12),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.network(
//                                 data,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) =>
//                                     const Icon(
//                                   Icons.error,
//                                   color: Colors.red,
//                                 ),
//                                 height: 135,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(bannerContent.length, (index) {
//                       return Container(
//                         margin: const EdgeInsets.all(4),
//                         width: 7,
//                         height: 7,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: currentPage == index
//                               ? AppColors.kPrimaryColor
//                               : AppColors.kAccentColor,
//                         ),
//                       );
//                     }),
//                   ),
//                   CustomSizedBox.space12H,
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Shop Name:',
//                           style: AppTheme.textStyleBoldBlack16,
//                         ),
//                         CustomSizedBox.space16W,
//                         Text(
//                           'perfecto.fgkdfgidfgg',
//                           style: AppTheme.textStyleNormalBlack14,
//                         ),
//                         Spacer(),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.star_rate_rounded,
//                               color: Colors.orangeAccent,
//                               size: 20,
//                             ),
//                             CustomSizedBox.space4W,
//                             Text(
//                               '2.3',
//                               style: AppTheme.textStyleMediumBlack14,
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Location:',
//                           style: AppTheme.textStyleBoldBlack16,
//                         ),
//                         CustomSizedBox.space16W,
//                         Text(
//                           'perfecto.fgkdfgidfgg',
//                           style: AppTheme.textStyleNormalBlack14,
//                         )
//                       ],
//                     ),
//                   ),
//                   const Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Products:',
//                           style: AppTheme.textStyleBoldBlack16,
//                         ),
//                         CustomSizedBox.space16W,
//                         // Text(
//                         //   'perfecto.fgkdfgidfgg',
//                         //   style: AppTheme.textStyleNormalBlack14,
//                         // )
//                       ],
//                     ),
//                   ),
//                   TabBar(
//                       onTap: (index) {
//                         scrollToItem(index);
//                       },
//                       key: containerKey,
//                       isScrollable: true,
//                       labelColor: AppColors.kPrimaryColor,
//                       labelStyle: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 14),
//                       unselectedLabelStyle: const TextStyle(
//                           fontWeight: FontWeight.normal, fontSize: 12),
//                       indicatorColor: Colors.transparent,
//                       dividerColor: Colors.transparent,
//                       controller: tabController,
//                       tabs: tabtiles.map((e) {
//                         return Tab(
//                           text: e['title'],
//                         );
//                       }).toList()),
//                   // for (int i = 0; i < tabtiles.length; i++)
//                   Column(
//                     children: tabtiles
//                         .map((e) => productCategoryWidget(
//                               categoryName: e['title'],
//                               controller: _categoryScrollController,
//                               // additionWidget: SizedBox(
//                               //   height: tapContext != null &&
//                               //           _keyList[index].currentContext ==
//                               //               tapContext
//                               //       ? 100
//                               //       : 0,
//                               // ),
//                               key: e['key'],
//                             ))
//                         .toList(),
//                   ),
//                   // ...List.generate(
//                   //     _keyList.length,
//                   //     (index) => productCategoryWidget(
//                   //           categoryName: tabtiles[index]['title'],
//                   //           controller: _categoryScrollController,
//                   //           // additionWidget: SizedBox(
//                   //           //   height: tapContext != null &&
//                   //           //           _keyList[index].currentContext ==
//                   //           //               tapContext
//                   //           //       ? 100
//                   //           //       : 0,
//                   //           // ),
//                   //           key: _keyList[index],
//                   //         )),
//                 ],
//               ),
//             ),
//             if (_isTopPositionArrive)
//               Positioned(
//                   top: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     color: Colors.white,
//                     child: TabBar(
//                         onTap: (index) {
//                           scrollToItem(index);
//                         },
//                         isScrollable: true,
//                         labelColor: AppColors.kPrimaryColor,
//                         labelStyle: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 14),
//                         unselectedLabelStyle: const TextStyle(
//                             fontWeight: FontWeight.normal, fontSize: 12),
//                         indicatorColor: Colors.transparent,
//                         dividerColor: Colors.transparent,
//                         controller: tabController,
//                         tabs: tabtiles.map((e) {
//                           return Tab(
//                             text: e['title'],
//                           );
//                         }).toList()),
//                   ))
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 120,
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
//             boxShadow: [
//               BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1))
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     text: 'Total',
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: '(Inc. VAT where applicable)',
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   'Tk. 2988',
//                   style: AppTheme.textStyleBoldBlack18,
//                 )
//               ],
//             ),
//             CustomSizedBox.space16H,
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomButton(
//                     label: 'Cart',
//                     onPressed: () {
//                       // Get.toNamed(PlaceOrderScreen.routeName);
//                     },
//                     primary: Colors.white,
//                     isBorder: true,
//                     elevation: 0,
//                     labelColor: AppColors.kPrimaryColor,
//                     borderColor: AppColors.kPrimaryColor,
//                     borderWidth: 3,
//                     marginHorizontal: 0,
//                     marginVertical: 0,
//                     borderRadiusAll: 22,
//                   ),
//                 ),
//                 CustomSizedBox.space12W,
//                 Expanded(
//                   child: CustomButton(
//                     label: 'Order',
//                     onPressed: () {
//                       // Get.toNamed(PlaceOrderScreen.routeName);
//                     },
//                     marginHorizontal: 0,
//                     marginVertical: 0,
//                     borderRadiusAll: 22,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void scrollToItem(int index) {
//     globalLogger.d(tabtiles[index], _keyList[index]);
//     globalLogger.d(containerKey, _keyList[index]);
//
//     tapContext = _keyList[index].currentContext!;
//     setState(() {});
//
//     globalLogger.d(_keyList[index].currentContext!, "hhhhhhhhh");
//     Scrollable.ensureVisible(_keyList[index].currentContext!,
//         duration: const Duration(milliseconds: 1000), alignment: .55);
//   }
// // void scrollToItem(int index) {
// //   _scrollController.jumpTo(
// //     index * 200.0, // Adjust based on the size of your items
// //   );
// // }
// }
//
// class productCategoryWidget extends StatefulWidget {
//   final String categoryName;
//   final ScrollController controller;
//   final Widget? additionWidget;
//
//   const productCategoryWidget({
//     required this.categoryName,
//     required this.controller,
//     Key? key,
//     this.additionWidget,
//   }) : super(key: key);
//
//   @override
//   State<productCategoryWidget> createState() => _productCategoryWidgetState();
// }
//
// class _productCategoryWidgetState extends State<productCategoryWidget> {
//   List<Map<String, dynamic>> productItem = [
//     {
//       'name': 'Chess Salad with Boiled Egg',
//       'price': 280.45,
//       'img':
//           'https://www.bhg.com/thmb/cX9GeFKdow2d4mNqEbMRTXjpoZQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/difference-between-fruits-vegetables-01-5f92e7ec706b463287bcfb46985698f9.jpg',
//       'addtocart': false
//     },
//     {
//       'name': 'Chess Salad with Boiled Egg',
//       'price': 280.45,
//       'img':
//           'https://www.bhg.com/thmb/cX9GeFKdow2d4mNqEbMRTXjpoZQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/difference-between-fruits-vegetables-01-5f92e7ec706b463287bcfb46985698f9.jpg',
//       'addtocart': true
//     },
//     {
//       'name': 'Chess Salad with Boiled Egg',
//       'price': 280.45,
//       'img':
//           'https://www.bhg.com/thmb/cX9GeFKdow2d4mNqEbMRTXjpoZQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/difference-between-fruits-vegetables-01-5f92e7ec706b463287bcfb46985698f9.jpg',
//       'addtocart': false
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       key: widget.key,
//       controller: widget.controller,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           widget.additionWidget ?? const SizedBox.shrink(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Text(
//               widget.categoryName,
//               style: AppTheme.textStyleSemiBoldBlack16,
//             ),
//           ),
//           GridView.builder(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             shrinkWrap: true,
//             primary: false,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 mainAxisExtent: 210,
//                 maxCrossAxisExtent: 200,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20),
//             itemCount: productItem.length,
//             itemBuilder: (BuildContext ctx, index) {
//               Map<String, dynamic> data = productItem[index];
//               return ProductItem(
//                 onTap: () {},
//                 cartTap: () {
//                   setState(() {
//                     data['addtocart'] = !data['addtocart'];
//                   });
//                 },
//                 productName: data['name'],
//                 productImage: data['img'],
//                 price: data['price'],
//                 addtocart: data['addtocart'],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ProductItem extends StatelessWidget {
//   const ProductItem({
//     Key? key,
//     required this.onTap,
//     required this.productName,
//     required this.productImage,
//     required this.price,
//     required this.addtocart,
//     required this.cartTap,
//   }) : super(key: key);
//   final Function() onTap;
//   final Function() cartTap;
//   final String productName;
//   final String productImage;
//   final double price;
//   final bool addtocart;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Stack(
//         children: [
//           Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(.12))
//               ],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   child: Image.network(
//                     productImage,
//                     height: 120,
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(12)),
//                 ),
//                 Container(
//                   height: 40,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8.0,
//                     vertical: 4.0,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       productName,
//                       textAlign: TextAlign.left,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Row(
//                     children: [
//                       TitleText(
//                         title: '৳ ${price}',
//                         fontSize: 12,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       CustomSizedBox.space4W,
//                       TitleText(
//                         title: '৳ ${price}',
//                         fontSize: 8,
//                         textAlign: TextAlign.center,
//                         textDecoration: TextDecoration.lineThrough,
//                         fontWeight: FontWeight.w600,
//                         color: const Color(0xff939393),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: addtocart
//                 ? Container(
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: AppColors.kPrimaryColor.withOpacity(.5),
//                       borderRadius: const BorderRadius.vertical(
//                         bottom: Radius.circular(8),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Image.asset(
//                           AssetsConstant.minus_icon,
//                           width: 16,
//                           color: AppColors.kPrimaryColor,
//                         ),
//                         Container(
//                           height: 30,
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           color: AppColors.kPrimaryColor,
//                           child: const Text(
//                             '1',
//                             style: AppTheme.textStyleMediumWhite12,
//                           ),
//                         ),
//                         const Icon(
//                           Icons.add,
//                           color: AppColors.kPrimaryColor,
//                         ),
//                       ],
//                     ),
//                   )
//                 : GestureDetector(
//                     onTap: cartTap,
//                     child: Container(
//                       height: 30,
//                       padding: const EdgeInsets.all(8),
//                       decoration: const BoxDecoration(
//                         color: AppColors.kPrimaryColor,
//                         borderRadius: BorderRadius.vertical(
//                           bottom: Radius.circular(8),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             AssetsConstant.cart_bag_icon,
//                             width: 12,
//                           ),
//                           CustomSizedBox.space8W,
//                           const Text(
//                             'Add to Cart',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class QuantityButton extends StatelessWidget {
//   const QuantityButton({
//     required this.iconData,
//     required this.onTap,
//     this.iconSize,
//     Key? key,
//     this.iconColor,
//     this.borderRadius,
//     this.bgColor,
//   }) : super(key: key);
//   final IconData iconData;
//   final double? iconSize;
//   final Color? iconColor;
//   final BorderRadius? borderRadius;
//   final Color? bgColor;
//   final Function() onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//               color: bgColor ?? Colors.transparent, borderRadius: borderRadius),
//           child: Center(
//             child: Icon(
//               iconData,
//               color: iconColor ?? AppColors.kPrimaryColor,
//               size: iconSize,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class TitleText extends StatelessWidget {
//   const TitleText({
//     required this.title,
//     this.color,
//     this.fontSize,
//     this.height,
//     this.fontWeight,
//     this.textAlign,
//     this.textOverflow,
//     this.maxLines,
//     this.fontFamily,
//     this.textDecoration,
//     Key? key,
//   }) : super(key: key);
//   final String title;
//   final Color? color;
//   final double? fontSize;
//   final double? height;
//   final FontWeight? fontWeight;
//   final TextAlign? textAlign;
//   final TextOverflow? textOverflow;
//   final String? fontFamily;
//   final int? maxLines;
//   final TextDecoration? textDecoration;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       maxLines: maxLines,
//       textAlign: textAlign ?? TextAlign.start,
//       overflow: textOverflow ?? TextOverflow.visible,
//       style: TextStyle(
//         decoration: textDecoration,
//         fontFamily: fontFamily,
//         color: color ?? AppColors.kPrimaryColor,
//         fontWeight: fontWeight ?? FontWeight.w600,
//         fontSize: fontSize ?? 32,
//         height: height,
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/shared/extention.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class EcommercepanelScreen extends StatefulWidget {
  static const String routeName = '/ecommerce';

  const EcommercepanelScreen({super.key});

  @override
  State<EcommercepanelScreen> createState() => _EcommercepanelScreenState();
}

class _EcommercepanelScreenState extends State<EcommercepanelScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  final dataKey = new GlobalKey();
  List<String> bannerContent = [
    'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
    'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://media.istockphoto.com/id/1466353453/photo/management-responsible-for-quality-control-iso-certification-product-quality-guarantee.webp?b=1&s=170667a&w=0&k=20&c=Aw_ZGT_TQInYjF0wiek4GugQQAsPE7YXjad7iPbNys0=',
    'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
    'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
    'https://media.istockphoto.com/id/1423369897/photo/call-center-worker.webp?b=1&s=170667a&w=0&k=20&c=SKeoIBoh9SG15iFz94tEoOOPg8OA0iivmtGj0HY_JL0=',
    'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://media.istockphoto.com/id/1423369897/photo/call-center-worker.webp?b=1&s=170667a&w=0&k=20&c=SKeoIBoh9SG15iFz94tEoOOPg8OA0iivmtGj0HY_JL0=',
  ];
  int currentIndex = 0;

  bool _isTopPositionArrive = false;
  ScrollController _categoryScrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: tabtiles.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
      print("Current Tab Index: $currentIndex");
    });
    Timer.periodic(Duration(milliseconds: 800), (timer) {
      if (currentPage < (bannerContent.length - 1)) {
        pageController.nextPage(
            duration: Duration(milliseconds: 800), curve: Curves.ease);
      } else {
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 100), curve: Curves.ease);
      }
    });
    _scrollController.addListener(() {
      globalLogger.d(
          containerKey.globalPaintBounds,
          containerKey.globalPaintBounds!.top <=
              MediaQuery.of(context).viewPadding.top);

      if (containerKey.globalPaintBounds!.top <=
          MediaQuery.of(context).viewPadding.top) {
        _isTopPositionArrive = true;
        setState(() {});
      } else {
        if (_isTopPositionArrive) {
          _isTopPositionArrive = false;
          setState(() {});
        }
      }
      // if (_scrollController.position.pixels ==
      //     _scrollController.position.maxScrollExtent) {
      //   // Perform your task
      // }
    });
    _keyList = List<GlobalKey>.generate(
        tabtiles.length, (index) => GlobalKey(debugLabel: 'key_$index'),
        growable: false);
    super.initState();
  }

  ScrollController _scrollController = ScrollController();

  final containerKey = GlobalKey();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<GlobalKey> _keyList = [];

  late TabController tabController;
  List<Map<String, dynamic>> tabtiles = [
    {
      'title': 'Cookies',
      'key': GlobalKey(),
    },
    {
      'title': 'Dress',
      'key': GlobalKey(),
    },
    {
      'title': 'Cake',
      'key': GlobalKey(),
    },
    {
      'title': 'Veg',
      'key': GlobalKey(),
    },
    {
      'title': 'Meat',
      'key': GlobalKey(),
    },
    {
      'title': 'drinks',
      'key': GlobalKey(),
    },
    {
      'title': 'Perfume',
      'key': GlobalKey(),
    },
    {
      'title': 'Cloths',
      'key': GlobalKey(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).viewPadding.top,
                  // ),
                  CustomSizedBox.space12H,
                  CustomTextField(
                    hintText: 'Search a product',
                    marginVertical: 0,
                    marginHorizontal: 16,
                    enableBorderColor: AppColors.kAccentColor,
                    focusColor: AppColors.kPrimaryColor,
                    prefixWidget: Icon(
                      Icons.search_rounded,
                      color: AppColors.kPrimaryColor,
                    ),
                    borderRadius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 164,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: bannerContent.length,
                        itemBuilder: (context, index) {
                          currentPage = index;
                          String data = bannerContent[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                data,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                height: 135,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(bannerContent.length, (index) {
                      return Container(
                        margin: EdgeInsets.all(4),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? AppColors.kPrimaryColor
                              : AppColors.kAccentColor,
                        ),
                      );
                    }),
                  ),
                  CustomSizedBox.space12H,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6),
                    child: Row(
                      children: [
                        Text(
                          'Shop Name:',
                          style: AppTheme.textStyleBoldBlack16,
                        ),
                        CustomSizedBox.space16W,
                        Text(
                          'perfecto.fgkdfgidfgg',
                          style: AppTheme.textStyleNormalBlack14,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.orangeAccent,
                              size: 20,
                            ),
                            CustomSizedBox.space4W,
                            Text(
                              '2.3',
                              style: AppTheme.textStyleMediumBlack14,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6),
                    child: Row(
                      children: [
                        Text(
                          'Location:',
                          style: AppTheme.textStyleBoldBlack16,
                        ),
                        CustomSizedBox.space16W,
                        Text(
                          'perfecto.fgkdfgidfgg',
                          style: AppTheme.textStyleNormalBlack14,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6),
                    child: Row(
                      children: [
                        Text(
                          'Products:',
                          style: AppTheme.textStyleBoldBlack16,
                        ),
                        CustomSizedBox.space16W,
                        // Text(
                        //   'perfecto.fgkdfgidfgg',
                        //   style: AppTheme.textStyleNormalBlack14,
                        // )
                      ],
                    ),
                  ),
                  TabBar(
                      onTap: (index) {
                        scrollToItem(index);
                      },
                      key: containerKey,
                      isScrollable: true,
                      labelColor: AppColors.kPrimaryColor,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      controller: tabController,
                      tabs: tabtiles.map((e) {
                        return Tab(
                          text: e['title'],
                        );
                      }).toList()),
                  for (int i = 0; i < tabtiles.length; i++)
                    productCategoryWidget(
                        categoryName: tabtiles[i]['title'],
                        controller: _categoryScrollController,
                        key: _keyList[i])
                ],
              ),
            ),
            if (_isTopPositionArrive)
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                        onTap: (index) {
                          scrollToItem(index);
                        },
                        isScrollable: true,
                        labelColor: AppColors.kPrimaryColor,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        controller: tabController,
                        tabs: tabtiles.map((e) {
                          return Tab(
                            text: e['title'],
                          );
                        }).toList()),
                  ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'Cart',
                    onPressed: () {
                      // Get.toNamed(PlaceOrderScreen.routeName);
                    },
                    primary: Colors.white,
                    isBorder: true,
                    elevation: 0,
                    labelColor: AppColors.kPrimaryColor,
                    borderColor: AppColors.kPrimaryColor,
                    borderWidth: 3,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    borderRadiusAll: 22,
                  ),
                ),
                CustomSizedBox.space12W,
                Expanded(
                  child: CustomButton(
                    label: 'Order',
                    onPressed: () {
                      // Get.toNamed(PlaceOrderScreen.routeName);
                    },
                    marginHorizontal: 0,
                    marginVertical: 0,
                    borderRadiusAll: 22,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void scrollToItem(int index) {
    globalLogger.d(tabtiles[index], _keyList[index]);

    Scrollable.ensureVisible(_keyList[index].currentContext!,
        duration: Duration(
          milliseconds: 300,
        ),
        alignment: .55);
  }
// void scrollToItem(int index) {
//   _scrollController.jumpTo(
//     index * 200.0, // Adjust based on the size of your items
//   );
}

class productCategoryWidget extends StatefulWidget {
  final String categoryName;
  final ScrollController controller;

  const productCategoryWidget({
    required this.categoryName,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<productCategoryWidget> createState() => _productCategoryWidgetState();
}

class _productCategoryWidgetState extends State<productCategoryWidget> {
  List<Map<String, dynamic>> productItem = [
    {
      'name': 'Chess Salad with Boiled Egg',
      'price': 280.45,
      'img':
          'https://www.bhg.com/thmb/cX9GeFKdow2d4mNqEbMRTXjpoZQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/difference-between-fruits-vegetables-01-5f92e7ec706b463287bcfb46985698f9.jpg',
      'addtocart': false
    },
    {
      'name': 'Chess Salad with Boiled Egg',
      'price': 280.45,
      'img':
          'https://www.bhg.com/thmb/cX9GeFKdow2d4mNqEbMRTXjpoZQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/difference-between-fruits-vegetables-01-5f92e7ec706b463287bcfb46985698f9.jpg',
      'addtocart': true
    },
    {
      'name': 'Chess Salad with Boiled Egg',
      'price': 280.45,
      'img':
          'https://www.bhg.com/thmb/cX9GeFKdow2d4mNqEbMRTXjpoZQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/difference-between-fruits-vegetables-01-5f92e7ec706b463287bcfb46985698f9.jpg',
      'addtocart': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: widget.key,
      controller: widget.controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.categoryName,
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 210,
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: productItem.length,
            itemBuilder: (BuildContext ctx, index) {
              Map<String, dynamic> data = productItem[index];
              return ProductItem(
                onTap: () {},
                cartTap: () {
                  setState(() {
                    data['addtocart'] = !data['addtocart'];
                  });
                },
                productName: data['name'],
                productImage: data['img'],
                price: data['price'],
                addtocart: data['addtocart'],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.onTap,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.addtocart,
    required this.cartTap,
  }) : super(key: key);
  final Function() onTap;
  final Function() cartTap;
  final String productName;
  final String productImage;
  final double price;
  final bool addtocart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(.12))
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  child: Image.network(
                    productImage,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      productName,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      TitleText(
                        title: '৳ ${price}',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomSizedBox.space4W,
                      TitleText(
                        title: '৳ ${price}',
                        fontSize: 8,
                        textAlign: TextAlign.center,
                        textDecoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff939393),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: addtocart
                ? Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor.withOpacity(.5),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          AssetsConstant.minus_icon,
                          width: 16,
                          color: AppColors.kPrimaryColor,
                        ),
                        Container(
                          height: 30,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          color: AppColors.kPrimaryColor,
                          child: Text(
                            '1',
                            style: AppTheme.textStyleMediumWhite12,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: AppColors.kPrimaryColor,
                        ),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: cartTap,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsConstant.cart_bag_icon,
                            width: 12,
                          ),
                          CustomSizedBox.space8W,
                          const Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    required this.iconData,
    required this.onTap,
    this.iconSize,
    Key? key,
    this.iconColor,
    this.borderRadius,
    this.bgColor,
  }) : super(key: key);
  final IconData iconData;
  final double? iconSize;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: bgColor ?? Colors.transparent, borderRadius: borderRadius),
          child: Center(
            child: Icon(
              iconData,
              color: iconColor ?? AppColors.kPrimaryColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    required this.title,
    this.color,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.fontFamily,
    this.textDecoration,
    Key? key,
  }) : super(key: key);
  final String title;
  final Color? color;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final String? fontFamily;
  final int? maxLines;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.visible,
      style: TextStyle(
        decoration: textDecoration,
        fontFamily: fontFamily,
        color: color ?? AppColors.kPrimaryColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 32,
        height: height,
      ),
    );
  }
}
