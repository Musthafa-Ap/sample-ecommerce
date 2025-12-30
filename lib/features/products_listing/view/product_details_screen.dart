import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/features/cart/view_model/cart_provider.dart';
import 'package:sample_app/features/products_listing/view_model/products_provider.dart';

import 'common_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
   ProductsProvider provider = context.watch<ProductsProvider>();

   final product = provider.productDetails;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: CommonAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Image.asset(
              product?.image??'',
              height: 280.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product?.name??'Product Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                Icon(Icons.ios_share, size: 20.h),
              ],
            ),
            SizedBox(height: 10),
            Text(
              product?.description??'',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            SizedBox(height: 10),
            Text(
              '₹${product?.price??0}',
              style: TextStyle(
                fontSize: 25.sp,
                color: Color(0xffDD8560),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Inclusive of all taxes',
              style: TextStyle(fontSize: 12.sp, color: Colors.black),
            ),

            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addToCart(product!);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Item added to cart')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffDD8560),
                minimumSize: Size(double.infinity, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
