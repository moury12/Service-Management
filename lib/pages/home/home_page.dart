import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          // First 2 Rows (Visible)
          Stack(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: showMore ? 8 : 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blue,
                    margin: EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 90,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white.withOpacity(.6),
                  width: double.infinity,
                  height: 100,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              AppColors.kPrimaryColor,
                              AppColors.kAccentColor
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        color: Colors.red),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Show More'),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          // Show More Button

          // Last 2 Rows (Hidden)
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: showMore ? 200 : 0,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: 8,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      'Item ${(index + 8)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!showMore) {
                setState(() {
                  showMore = true;
                });
              } else {
                setState(() {
                  showMore = false;
                });
              }
            },
            child: Text('Show More'),
          ),
        ],
      ),
    );
  }
}
