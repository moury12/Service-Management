import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool seleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Write Review',
          style: AppTheme.textStyleSemiBoldBlack20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Text('Rate your experience',
                  style: AppTheme.textStyleSemiBoldBlack16),
            ),
            RatingBar(
              initialRating: 3,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 50,
              ratingWidget: RatingWidget(
                full: Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                half: Icon(
                  Icons.star_half_rounded,
                  color: Colors.amber,
                ),
                empty: Icon(
                  Icons.star_border_rounded,
                  color: Colors.grey.shade400,
                ),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            CustomSizedBox.space24H,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Text('What do you love about the service?',
                  style: AppTheme.textStyleSemiBoldBlack16),
            ),
            ...List.generate(
                3,
                (index) => Row(
                      children: [
                        ...List.generate(
                            2,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      seleted = !seleted;
                                    });
                                  },
                                  child: Container(
                                    child: Text(
                                      'Cozy Place (12)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: seleted
                                              ? AppColors.kPrimaryColor
                                              : Colors.grey,
                                          fontSize: 12),
                                    ),
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 4),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: seleted
                                                ? AppColors.kPrimaryColor
                                                : Colors.grey.shade300,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                )),
                        // Container(
                        //   child: Text(
                        //     'Not very crowded (18)',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.w500,
                        //         color: Colors.grey,
                        //         fontSize: 12),
                        //   ),
                        //   padding: EdgeInsets.all(12),
                        //   margin:
                        //       EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(
                        //           color: Colors.grey.shade300, width: 1.5),
                        //       borderRadius: BorderRadius.circular(30)),
                        // ),
                      ],
                    )),
            CustomSizedBox.space24H,
            CustomTextField(
              hintText:
                  'Would you like to write anymore about your experience?',
              maxLine: 8,
              height: 122,
              borderRadius: 20,
              borderWidth: 2,
              marginVertical: 2,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '400 character remaining',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        label: 'Submit Review',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actions: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomSizedBox.space24H,
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.kPrimaryColor, width: 5)),
                        child: Icon(
                          Icons.check_rounded,
                          color: AppColors.kPrimaryColor,
                          size: 60,
                        ),
                      ),
                      CustomSizedBox.space12H,
                      Text(
                        'Thank you!',
                        style: AppTheme.textStyleBoldBlack20,
                      ),
                      CustomSizedBox.space12H,
                      Text(
                        'your review means a lot for the cafes improvment for the future.',
                        style: AppTheme.textStyleMediumFadeBlack14,
                        textAlign: TextAlign.center,
                      ),
                      CustomSizedBox.space24H,
                    ],
                  ),
                )
              ],
            ),
          );
        },
        marginHorizontal: 16,
        marginVertical: 16,
        borderRadiusAll: 22,
      ),
    );
  }
}
