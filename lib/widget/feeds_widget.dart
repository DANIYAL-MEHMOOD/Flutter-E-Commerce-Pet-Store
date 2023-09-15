import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../consts/global_color.dart';
import '../models/products_model.dart';
import '../screens/product_details.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsModelProvider = Provider.of<ProductsModel>(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: ProductDetails(
                id: productsModelProvider.id.toString(),
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      height: size.height * 0.2,
                      width: double.infinity,
                      errorWidget: const Icon(
                        IconlyBold.danger,
                        color: Colors.red,
                        size: 20,
                      ),
                      imageUrl: productsModelProvider.images![0],
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child:  Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "4.5",
                            // "${productsModelProvider.rating}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productsModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productsModelProvider.price}',
                      style: TextStyle(
                        color: lightTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(
                      IconlyLight.heart,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Perform action for product wallet
                    },
                    child: const Icon(
                      Icons.wallet,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Perform action for add to cart
                    },
                    child: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Perform action for add to cart button
              //     },
              //     style: ElevatedButton.styleFrom(
              //       primary: Colors.blueAccent,
              //       onPrimary: Colors.white,
              //     ),
              //     child: const Text('Add to Cart'),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import '../consts/global_color.dart';
// import '../models/products_model.dart';
// import '../screens/product_details.dart';
//
// class FeedsWidget extends StatelessWidget {
//   const FeedsWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final productsModelProvider = Provider.of<ProductsModel>(context);
//
//     Size size = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.all(6.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Theme.of(context).cardColor,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(8.0),
//           onTap: () {
//             Navigator.push(
//               context,
//               PageTransition(
//                 type: PageTransitionType.fade,
//                 child: ProductDetails(id: productsModelProvider.id.toString(),),
//               ),
//             );
//           },
//
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       spreadRadius: 3.0,
//                       blurRadius: 5.0)
//                 ],
//                 color: Colors.white),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5, right: 5, top: 6),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: RichText(
//                           text: TextSpan(
//                               text: '\$',
//                               style: const TextStyle(
//                                   color: Color.fromRGBO(33, 150, 243, 1)),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text: "${productsModelProvider.price}",
//                                     style: TextStyle(
//                                         color: lightTextColor,
//                                         fontWeight: FontWeight.w600)),
//                               ]),
//                         ),
//                       ),
//                       const Icon(IconlyLight.heart),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.01),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: FancyShimmerImage(
//                     height: size.height * 0.2,
//                     width: double.infinity,
//                     errorWidget: const Icon(
//                       IconlyBold.danger,
//                       color: Colors.red,
//                       size: 20,
//                     ),
//                     imageUrl: productsModelProvider.images![0],
//                     boxFit: BoxFit.fill,
//                   ),
//                 ),
//                 // Positioned(
//                 //   top: 8,
//                 //   right: 8,
//                 //   child: Container(
//                 //     decoration: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(8),
//                 //       color: Colors.white.withOpacity(0.8),
//                 //     ),
//                 //     padding: EdgeInsets.all(4),
//                 //     child: Row(
//                 //       children: const [
//                 //         Icon(
//                 //           Icons.star,
//                 //           color: Colors.amber,
//                 //           size: 16,
//                 //         ),
//                 //         SizedBox(
//                 //           width: 4,
//                 //         ),
//                 //         Text(
//                 //           "Rating",
//                 //           // "${productsModelProvider.rating}",
//                 //           style: TextStyle(
//                 //             fontWeight: FontWeight.bold,
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(height: size.height * 0.01),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     productsModelProvider.title.toString(),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       //  fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 // SizedBox(
//                 //  height: size.height * 0.0001,
//                 // ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     productsModelProvider.description.toString(),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       //  fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: size.height * 0.001,
//                 // ),
//                 // product wallet, icon, and favourite icon
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                      Icon(Icons.wallet),
//                       Icon(Icons.add_shopping_cart),
//                     ],
//                   ),
//                 ),
//                 // add to cart button
//                 Flexible(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       child: const Text('Add to Cart',
//                       style: TextStyle(
//                         backgroundColor: Colors.blueAccent
//                       ),),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
