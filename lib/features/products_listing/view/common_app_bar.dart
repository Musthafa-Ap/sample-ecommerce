import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/features/cart/view_model/cart_provider.dart';

import '../../cart/view/cart_screen.dart';

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
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen()),
                );
              },
            ),
            Consumer<CartProvider>(
              builder: (context, value, child) {
                if(value.cartItems.isEmpty){
                  return SizedBox();
                }
                return Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      value.cartItems.length.toString(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        SizedBox(width: 10),
      ],
      centerTitle: true,
    );
  }
}
