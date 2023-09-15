import 'dart:developer';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../consts/global_color.dart';
import '../models/products_model.dart';
import '../services/api_handler.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  ProductsModel? productsModel;
  bool isError = false;
  String errorStr = "";
  Future<void> getProductInfo() async {
    try {
      productsModel = await APIHandler.getProductById(id: widget.id);
    } catch (error) {
      isError = true;
      errorStr = error.toString();
      log("error $error");
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productsModelProvider = Provider.of<ProductsModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const AddToCartBottomBar(),
      body: SafeArea(
        child:isError
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "An error occured $errorStr",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            :
        productsModel == null
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        const BackButton(),

                        SizedBox(
                          height: size.height * 0.4,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return FancyShimmerImage(
                                width: double.infinity,
                                imageUrl:
                                    productsModel!.images![index].toString(),
                                boxFit: BoxFit.fill,
                              );
                            },
                            //autoplay: true,
                            itemCount: 3,
                            pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.white,
                                activeColor: Colors.red,
                              ),
                            ),
                            // control: const SwiperControl(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productsModel!.category!.name.toString(),
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      productsModel!.title.toString(),
                                      textAlign: TextAlign.start,
                                      style: titleStyle,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                          text: '\$',
                                          style: const TextStyle(
                                              fontSize: 25,
                                              color: Color.fromRGBO(
                                                  33, 150, 243, 1)),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: productsModel!.price
                                                    .toString(),
                                                style: TextStyle(
                                                    color: lightTextColor,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Description',
                              style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 24.0)),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                productsModel!.description.toString(),
                                textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontFamily: 'Varela',
                                      fontSize: 16.0,
                                      color: Colors.grey,
                              ),),
                            ],
                          ),
                        ),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform action for checkout button
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
                          child: const Text('Add To Cart',
                            style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),),

                        ),
                      ),
            ],
                    ),
                  ),
      ),
    );
  }
}


class AddToCartBottomBar extends StatelessWidget {
  const AddToCartBottomBar({Key? key}) : super(key: key);

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
              children:[
                const Text(
                  '\$59.95',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                ElevatedButton.icon(onPressed: (){},
                  icon: const Icon(CupertinoIcons.cart_badge_plus),
                  label: const Text('Add To Cart',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),)
              ],
            ),

          ],
        ),
      ),

    );
  }
}
