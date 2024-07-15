import 'package:flutter/material.dart';
import 'package:route_job_fair_flutter/GUI/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: Scaffold(
        persistentFooterAlignment: AlignmentDirectional.topStart,
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Image(
                  image: AssetImage("assets/image/ruoteLogo.png"),
                  height: 24,
                ),
              )
            ],
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}
