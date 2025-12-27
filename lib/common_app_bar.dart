import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      backgroundColor: Color(0xffFFFFFF),
      title: Text('Open Fashion'),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
      ],
      centerTitle: true,
    );
  }
}
