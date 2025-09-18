import 'package:flutter/material.dart';

class ReviewReport extends StatelessWidget {
  const ReviewReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF2D3748),
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'TaskTitle',
          style: TextStyle(
            color: Color(0xFF2D3748),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // File upload container
                    Container(
                      width: 200,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          // Back folder
                          Positioned(
                            top: 15,
                            right: 0,
                            child: Container(
                              width: 120,
                              height: 90,
                              decoration: BoxDecoration(
                                color: const Color(0xFFBFDBFE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          // Front folder with upload icon
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              width: 160,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2563EB),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDDD6FE),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_upward,
                                    color: Color(0xFF2563EB),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // View Report button
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E40AF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle view report action
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'View Report',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom buttons
            Row(
              children: [
                // Reject button
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFDC2626),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Handle reject action
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Reject',
                        style: TextStyle(
                          color: Color(0xFFDC2626),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Accept button
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Handle accept action
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Accept',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
