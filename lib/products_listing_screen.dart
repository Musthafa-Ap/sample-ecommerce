import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/product_details_screen.dart';
import 'package:sample_app/product_model.dart';

import 'common_app_bar.dart';


class ProductsListingScreen extends StatefulWidget {
  const ProductsListingScreen({super.key});

  @override
  State<ProductsListingScreen> createState() => _ProductsListingScreenState();
}

class _ProductsListingScreenState extends State<ProductsListingScreen> {
  List wishlistItems = [];


  @override
  Widget build(BuildContext context) {
    log('------rebuilding products listing screen------');

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
            // Expanded(
            //   child: GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 15.h,
            //       crossAxisSpacing: 12.w,
            //       childAspectRatio: 165.w / 240.h,
            //     ),
            //     itemBuilder: (context, index) {
            //       final product = productsList[index];
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) {
            //                 return ProductDetailsScreen(product: product);
            //               },
            //             ),
            //           );
            //         },
            //         child: Column(
            //           crossAxisAlignment: .start,
            //           children: [
            //             Container(
            //               height: 170.h,
            //               width: double.infinity,
            //               decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                   image: AssetImage(product.image),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               alignment: Alignment.bottomRight,
            //               child: IconButton(
            //                 onPressed: () {
            //                   if (wishlistItems.contains(product.id)) {
            //                     wishlistItems.remove(product.id);
            //                   } else {
            //                     wishlistItems.add(product.id);
            //                   }
            //                   setState(() {});
            //                 },
            //                 icon: Icon(
            //                   wishlistItems.contains(product.id)
            //                       ? Icons.favorite
            //                       : Icons.favorite_border,
            //                   color: Color(0xffDD8560),
            //                 ),
            //               ),
            //             ),

            //             SizedBox(height: 8.h),
            //             Text(product.name),
            //             Text(
            //               product.description,
            //               style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            //             ),
            //             SizedBox(height: 2.h),
            //             Text(
            //               '₹${product.price}',
            //               style: TextStyle(
            //                 fontSize: 16.sp,
            //                 color: Color(0xffDD8560),
            //                 fontWeight: FontWeight.w700,
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //     itemCount: productsList.length,
            //   ),
            // ),
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
