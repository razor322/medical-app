import 'package:flutter/material.dart';
import 'package:medical_app/screen/gallery_screen.dart';
import 'package:medical_app/screen/home_screen.dart';
import 'package:medical_app/screen/pegawai/pegawai_screen.dart';
import 'package:medical_app/screen/profil_screen.dart';
import 'package:medical_app/screen/splash_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 170, 146)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          HomeScreen(),
          GalleryScreen(),
          PegawaiScreen(),
          ProfilScreen()
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Color.fromARGB(255, 0, 170, 146),
        waterDropColor: Colors.white,
        onItemSelected: (index) {
          tabController.animateTo(index);
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home_rounded,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: Icons.browse_gallery_rounded,
            outlinedIcon: Icons.browse_gallery_outlined,
          ),
          BarItem(
            filledIcon: Icons.person_search_rounded,
            outlinedIcon: Icons.person_search_outlined,
          ),
          BarItem(
            filledIcon: Icons.lock_person_rounded,
            outlinedIcon: Icons.lock_person_outlined,
          ),
        ],
      ),
    );
  }
}
