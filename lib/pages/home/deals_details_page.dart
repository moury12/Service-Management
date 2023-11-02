import 'package:flutter/material.dart';

class DealsDetailsScreen extends StatelessWidget {
  const DealsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              child: Icon(Icons.arrow_forward),
            ),
            expandedHeight: 230,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
