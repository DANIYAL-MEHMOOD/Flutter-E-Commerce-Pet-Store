import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/feeds_screen.dart';
import '../services/api_handler.dart';
import '../widget/catergory_home.dart';
import '../widget/sale_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import '../models/products_model.dart';
import '../widget/appbar_icons.dart';
import '../widget/feeds_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  List<ProductsModel> productsList = [];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }
  //
  // Future<void> getProducts() async {
  //   productsList = await APIHandler.getAllProducts();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: const Center(child: Text('Pet & Vet')),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const CategoriesScreen()));
            },
            icon: IconlyBold.category,
          ),
          actions: [

            // AppBarIcons(
            //   function: () {},
            //   icon: IconlyBold.user3,
            // ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // IconButton(
                //   onPressed: () {
                //     // Perform action for cart icon
                //   },
                //   icon: Icon(
                //     Icons.shopping_cart,
                //     color: _textEditingController.text.isNotEmpty
                //         ? Theme.of(context).primaryColor
                //         : Theme.of(context).disabledColor,
                //   ),
                // ),
                IconButton(
                  onPressed: () {
                    // Perform action for notification icon
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: _textEditingController.text.isNotEmpty
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Search",
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Perform action for cart icon
                        },
                        icon: Icon(
                          Icons.search,
                          color: _textEditingController.text.isNotEmpty
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     // Perform action for notification icon
                      //   },
                      //   icon: Icon(
                      //     Icons.notifications,
                      //     color: _textEditingController.text.isNotEmpty
                      //         ? Theme.of(context).primaryColor
                      //         : Theme.of(context).disabledColor,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              // TextField(
              //     controller: _textEditingController,
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //         hintText: "Search",
              //         filled: true,
              //         fillColor: Theme.of(context).cardColor,
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //           borderSide: BorderSide(
              //             color: Theme.of(context).cardColor,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //           borderSide: BorderSide(
              //             width: 1,
              //             color: Theme.of(context).primaryColorDark,
              //           ),
              //         ),
              //         suffixIcon: const Icon(
              //           IconlyLight.search,
              //           // color: lightIconsColor,
              //         )),
              //   ),

              SizedBox(height: size.height * 0.01),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return const SaleWidget();
                          },
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white, activeColor: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: const Text(
                          "Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            color: Colors.deepPurpleAccent
                          ),
                        ),
                      ),
                      const Categories(),
                    //  SizedBox(height: size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Latest Products",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                  color: Colors.deepPurpleAccent
                              ),
                            ),
                            const Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const FeedsScreen()));
                                },
                                icon: IconlyBold.arrowRight2,

                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<ProductsModel>>(
                          future: APIHandler.getAllProducts(limit: "20"),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child:
                                    Text("An error occured ${snapshot.error}"),
                              );
                            } else if (snapshot.data == null) {
                              return const Center(
                                child: Text("NO products has been added yet"),
                              );
                            }
                            return FeedsGridWidget(
                                productsList: snapshot.data!);
                          })),
                    ],
                  ),
                ),
              ),
              // const BottomBarScreen(),
            ],
          ),
        ),

      ),
    );
  }
}
