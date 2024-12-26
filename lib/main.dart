import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/providers/data_details-provider.dart';
import 'package:flutter_coding_challenge/providers/data_list_provider.dart';
import 'package:flutter_coding_challenge/views/List_page.dart';
import 'package:provider/provider.dart';


const Color primaryColor = Color(0xFF6200EE);

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataDetailsProvider()),
        ChangeNotifierProvider(create: (_) => DatalistProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: primaryColor, // Set color to primaryColor
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
          ),
          primaryColor: primaryColor,
        ),
        home: const ListPage(),
      ),
    );
  }
}
