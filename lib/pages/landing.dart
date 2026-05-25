import 'package:drawingapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 31, 31, 32),
                  ),

                  Positioned(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "Tarik Oliveira",
                              style: GoogleFonts.alkatra(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Divider(
                              color: Colors.grey,
                              thickness: 2,
                              indent: 120,
                              endIndent: 120,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 6,
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 24),
                
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Personal Portraits & Art",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                
                          const SizedBox(height: 13),
                
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Handcrafted portraits of iconic artists and figures, made with premium quality materials and extra care.",
                                style: GoogleFonts.lato(
                                  color: const Color.fromARGB(255, 70, 70, 70),
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      const SizedBox(height: 30),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "20+",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                "Drawings",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "100%",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                "Handmade",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                
                      const SizedBox(height: 45),
                
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              )
                            ),
                
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 31, 31, 32),
                              foregroundColor: Colors.white,
                              minimumSize: Size(360, 70),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              )
                            ),
                
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Shop Now",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}