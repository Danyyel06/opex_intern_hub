import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:opex_intern_hub/features/auth/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Status bar area
              const SizedBox(height: 20),

              // Main illustration area
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    width: 320,
                    height: 280,
                    child: Image.asset(
                      'images/Innovation (2).png',
                      width: 320,
                      height: 280,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Title and subtitle section
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to\nOpex In-Hub',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF102592),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Transforming futures, shaping success.\nYour journey starts here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6B7280),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Login button
              Container(
                width: double.infinity,
                height: 56,
                margin: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF102592),
                    elevation: 0,
                    side: const BorderSide(
                      color: Color(0xFF102592),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
