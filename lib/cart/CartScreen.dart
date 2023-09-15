import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../widget/appbar_icons.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Center(child: Text('Cart')),
        actions: [
          AppBarIcons(
            function: () {},
            icon: IconlyBold.heart,
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CartItem(
            name: 'Product 1',
            price: 10.99,
            quantity: 2,
            imageUrl: 'assets/images/cat/dog.png',
          ),
          SizedBox(height: 16.0),
          CartItem(
            name: 'Product 2',
            price: 19.99,
            quantity: 1,
            imageUrl: 'assets/images/cat/cat.png',
          ),
          SizedBox(height: 16.0),
          CartItem(
            name: 'Product 3',
            price: 5.99,
            quantity: 3,
            imageUrl: 'assets/images/cat/dog.png',
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  const CartItem({
    super.key,
    // Key? key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Radio(
            value: "",
            groupValue: "",
            activeColor: Colors.black,
            onChanged: (index) {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            // flex: 2,
            child: Image.asset(
              imageUrl,
              width: 55.0,
              height: 55.0,
            ),
          ),
          const SizedBox(width: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            //flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              //flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              )
                            ]),
                        child: const Icon(
                          CupertinoIcons.minus,
                          size: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              )
                            ]),
                        child: const Icon(
                          CupertinoIcons.plus,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  // Text(
                  //   'Quantity: $quantity',
                  //   style: const TextStyle(
                  //     fontSize: 14.0,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              )),
        ],
      ),
    );
  }
}

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$59.95',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
