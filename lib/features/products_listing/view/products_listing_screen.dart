import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/features/cart/view_model/cart_provider.dart';
import 'package:sample_app/features/products_listing/view/product_details_screen.dart';
import 'package:sample_app/features/products_listing/view_model/products_provider.dart';

import 'common_app_bar.dart';

class ProductsListingScreen extends StatelessWidget {
  const ProductsListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: CommonAppBar(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                categoryCard('Women'),
                SizedBox(width: 7.w),
                categoryCard('All Apparel'),
              ],
            ),
            SizedBox(height: 17.h),
            Expanded(
              child: Consumer<ProductsProvider>(
                builder: (context, value, child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 165.w / 240.h,
                    ),
                    itemBuilder: (context, index) {
                      final product = value.productsList[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<ProductsProvider>().setProductDetails(product);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Container(
                              height: 170.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(product.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () {
                                  context.read<CartProvider>().addToCart(
                                    product,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Item added to cart'),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Color(0xffDD8560),
                                ),
                              ),
                            ),

                            SizedBox(height: 8.h),
                            Text(product.name),
                            Text(
                              product.description,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              '₹${product.price}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xffDD8560),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: value.productsList.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryCard(String categoryName) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    height: 32.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      border: Border.all(color: Color(0xffDEDEDE)),
    ),
    child: Row(
      children: [
        Text(categoryName, style: TextStyle(fontSize: 16)),
        SizedBox(width: 5),
        Icon(Icons.close, size: 20),
      ],
    ),
  );
}
