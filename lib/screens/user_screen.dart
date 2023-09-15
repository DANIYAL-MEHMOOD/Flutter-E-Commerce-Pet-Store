import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/dark_theme_provider.dart';
import 'package:flutter_application_1/widget/text_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Hi,  ',
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Muhammad",
                            style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('My name is pressed');
                              }),
                      ],
                    ),
                  ),
                  TextWidget(
                    text: "Email@mail.com",
                    color: color,
                    textSize: 18,
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 20),
                  _listTiles(
                    title: "Address",
                    subtitle: "Subtitle here",
                    icon: IconlyLight.profile,
                    onPressed: () async {
                      await _showAddressDialog();
                    },
                    color: color,
                  ),
                  _listTiles(
                    title: "Orders",
                    icon: IconlyLight.bag,
                    onPressed: () {},
                    color: color,
                  ),
                  _listTiles(
                    title: "Wishlist",
                    icon: IconlyLight.heart,
                    onPressed: () {},
                    color: color,
                  ),
                  _listTiles(
                    title: "Viewed",
                    icon: IconlyLight.show,
                    onPressed: () {},
                    color: color,
                  ),
                  _listTiles(
                    title: "Forget password",
                    icon: IconlyLight.unlock,
                    onPressed: () {},
                    color: color,
                  ),
                  SwitchListTile(
                    title: TextWidget(
                      text:
                          themeState.getDarkTheme ? 'Dark mode' : "Light Mode",
                      color: color,
                      textSize: 18,
                    ),
                    secondary: Icon(themeState.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                    onChanged: (bool value) {
                      setState(() {
                        themeState.setDarkTheme = value;
                      });
                    },
                    value: themeState.getDarkTheme,
                  ),
                  _listTiles(
                    title: "Logout",
                    icon: IconlyLight.logout,
                    onPressed: () async {
                      await _showLogoutDialog();
                    },
                    color: color,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 8),
                const Text("Sign Out"),
              ],
            ),
            content: const Text("Do you wanna sign out?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: 'Cancel',
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  color: Colors.red,
                  text: 'Ok',
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              onChanged: (value) {
                print(
                    '_addressTextController.text ${_addressTextController.text}');
              },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),

            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              )
            ],

            // actions: [
            //   TextButton(
            //     onPressed: () async {
            //       String _uid = user!.uid;
            //       try {
            //         await FirebaseFirestore.instance
            //             .collection('users')
            //             .doc(_uid)
            //             .update({
            //           'shipping-address': _addressTextController.text,
            //         });
            //
            //         Navigator.pop(context);
            //         setState(() {
            //           address = _addressTextController.text;
            //         });
            //       } catch (err) {
            //         GlobalMethods.errorDialog(
            //             subtitle: err.toString(), context: context);
            //       }
            //     },
            //     child: const Text('Update'),
            //   ),
            // ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 18,
      ),
      subtitle: TextWidget(
        text: subtitle ?? "",
        color: color,
        textSize: 14,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
