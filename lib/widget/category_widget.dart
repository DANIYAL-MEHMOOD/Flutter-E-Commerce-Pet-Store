import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categories_model.dart';
import 'package:flutter_application_1/widget/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoriesModel categoriesModelProvider =
    Provider.of<CategoriesModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.pink.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.pink.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(children: [
          // Container for the image
        Flexible(
          child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    height: size.width * 0.45,
                    width: size.width * 0.45,
                    errorWidget: const Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                    imageUrl: categoriesModelProvider.image.toString(),
                    boxFit: BoxFit.fill,
                  ),
                ),
        ),
          // Category name
          TextWidget(
            text: categoriesModelProvider.name.toString(),
            color: Colors.black,
            textSize: 20,
            isTitle: true,
          ),
        ]),
      ),
      // Stack(
      //     children: [
      //       ClipRRect(
      //         borderRadius: BorderRadius.circular(12),
      //         child: FancyShimmerImage(
      //           height: size.width * 0.45,
      //           width: size.width * 0.45,
      //           errorWidget: const Icon(
      //             IconlyBold.danger,
      //             color: Colors.red,
      //             size: 28,
      //           ),
      //           imageUrl: categoriesModelProvider.image.toString(),
      //           boxFit: BoxFit.fill,
      //         ),
      //       ),
      //        Align(
      //         alignment: Alignment.center,
      //         child: Text(
      //           categoriesModelProvider.name.toString(),
      //           textAlign: TextAlign.center,
      //           style: const TextStyle(
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //             backgroundColor: Color(0xFFFfFFFf),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),

    );
  }
}
