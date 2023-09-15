import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/dark_theme_provider.dart';
import 'package:flutter_application_1/screens/btm_bar.dart';
import 'package:provider/provider.dart';
import 'consts/theme_data.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Error\n 4{details.execpton}',
        style: TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PET SHOP',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          // theme: ThemeData(
          //   scaffoldBackgroundColor: lightScaffoldColor,
          //   primaryColor: lightCardColor,
          //   backgroundColor: lightBackgroundColor,
          //   appBarTheme: AppBarTheme(
          //     iconTheme: IconThemeData(
          //       color: lightIconsColor,
          //     ),
          //     backgroundColor: lightScaffoldColor,
          //     centerTitle: true,
          //     titleTextStyle: TextStyle(
          //         color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
          //     elevation: 0,
          //   ),
          //   iconTheme: IconThemeData(
          //     color: lightIconsColor,
          //   ),
          //
          //   textSelectionTheme: const TextSelectionThemeData(
          //     cursorColor: Colors.black,
          //     selectionColor: Colors.blue,
          //     // selectionHandleColor: Colors.blue,
          //   ),
          //   // textTheme: TextTheme()
          //   // textTheme: Theme.of(context).textTheme.apply(
          //   //       bodyColor: Colors.black,
          //   //       displayColor: Colors.black,
          //   //     ),
          //   cardColor: lightCardColor,
          //   brightness: Brightness.light,
          //   colorScheme: ThemeData().colorScheme.copyWith(
          //     secondary: lightIconsColor,
          //     brightness: Brightness.light,
          //   ),
          // ),
          // home: const UserScreen(),
          //  routes: {
          //   "/": (context)=> const HomeScreen(),
          //    "/User": (context)=> const UserScreen(),
          //    "/Feeds": (context)=> const FeedsScreen(),
          //    // "/Product": (context)=> const ProductDetails(),
          //    "CategoriesScreen": (context)=> const CategoriesScreen(),
          //  },
          // initialRoute: AppRouteName.getStarted,
          // onGenerateRoute: AppRoute.generate,
          home: const BottomBarScreen(),
        );
      }),
    );
  }
}
