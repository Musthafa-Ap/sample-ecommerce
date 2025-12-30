import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/features/cart/view_model/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider provider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Cart'), backgroundColor: Colors.deepOrange),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final product = provider.cartItems[index];

          return Row(
            children: [
              Image.asset(
                product.image,
                height: 110,
                width: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(product.description),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹${product.price}',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xffDD8560),
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            provider.deleteFromCart(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: provider.cartItems.length,
      ),
    );
  }
}
