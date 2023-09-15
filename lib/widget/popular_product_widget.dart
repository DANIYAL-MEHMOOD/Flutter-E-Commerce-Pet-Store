import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';

class PopularProductWidget extends StatelessWidget {
  const PopularProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsModelProvider = Provider.of<ProductsModel>(context);
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            "Popular Product",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: 320,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            // itemCount: products.length,
            itemCount: 5,
            separatorBuilder: (_, __) {
              return const SizedBox(width: 16);
            },
            itemBuilder: (context, index) {
              return Container(
                width: 220,
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(1, 1),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 220,
                      height: 180,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/cat/pet-cat1.png',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                       productsModelProvider.title.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text:
                                        productsModelProvider.description.toString(),
                                        // overflow: TextOverflow.ellipsis,
                                        // maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "4",
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.wallet,
                                  color: Color(0xFF076ac7),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '\$${productsModelProvider.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: const Color(0xFF076ac7)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
