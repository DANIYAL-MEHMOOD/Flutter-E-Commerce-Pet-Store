import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // width: 55,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/cat/cat.png"),
                  width: 30,
                  height: 30,
                ),
                Text("text!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.deepPurpleAccent
                  ),),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }
}

















// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/categories_model.dart';
// import 'package:flutter_application_1/widget/text_widget.dart';
// import 'package:provider/provider.dart';
// import '../consts/global_color.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
//
// class Categories extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> categories = [
//       {"icon": "assets/images/cat/cat.png", "text": "Cat"},
//       {"icon": "assets/images/cat/dog.png", "text": "Dog"},
//       {"icon": "assets/images/cat/pet-cat1.png", "text": "Bird"},
//       {"icon": "assets/images/cat/pet-cat2.png", "text": "Horse"},
//       {"icon": "assets/images/cat/parrot.png", "text": "Parrot"},
//     ];
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: List.generate(
//           categories.length,
//               (index) => CategoryCard(
//             icon: categories[index]["icon"],
//             text: categories[index]["text"],
//             press: () {},
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.press,
//   }) : super(key: key);
//
//   final String? icon, text;
//   final GestureTapCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: SizedBox(
//         width: 55,
//         child: Column(
//           children: [
//             Container(
//                // padding: const EdgeInsets.all(8.0),
//               height: 60,
//               width: 70,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFECDF),
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: AssetImage(icon!),
//                  fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(text!, textAlign: TextAlign.center
//             )],
//         ),
//       ),
//     );
//   }
// }