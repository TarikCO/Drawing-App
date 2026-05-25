import 'package:drawingapp/components/bottom_nav_bar.dart';
import 'package:drawingapp/pages/cart.dart';
import 'package:drawingapp/pages/landing.dart';
import 'package:drawingapp/pages/shop.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // index to keep track
  int selectedIndex = 0;

  // method to change selected Index
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Pages we can navigate from
  final List<Widget> pages = [
    const ShopPage(),
    
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12, top: 12),
              child: Icon(
                Icons.menu, 
                color: Colors.black),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 31, 31, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(child: Image.asset(
                  'lib/images/logo.png',
                  color: Colors.white,
                  )
                ),

                SizedBox(height: 30),

                // pages
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text("Home", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text("About", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),


            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingPage(),
                  ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text("Logout", style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}