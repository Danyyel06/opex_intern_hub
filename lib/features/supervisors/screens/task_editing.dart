import 'package:flutter/material.dart';

class TaskEditing extends StatelessWidget {
  const TaskEditing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1E293B),
            size: 24,
          ),
        ),
        title: const Text(
          'Edit a task',
          style: TextStyle(
            color: Color(0xFF1E3A8A),
            fontSize: 28,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        titleSpacing: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),

            // Task Title Section
            const Text(
              'Task Title',
              style: TextStyle(
                color: Color(0xFF374151),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              ),
              child: const Text(
                'Create an onboarding screen',
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Task Description Section
            const Text(
              'Task Description',
              style: TextStyle(
                color: Color(0xFF374151),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description paragraph
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(text: 'Description: '),
                            TextSpan(
                              text:
                                  'This task involves creating a comprehensive design system for the Opex Intern Hub. The design system will define all of the core visual and interactive components, including the color palette, typography, iconography, and reusable UI elements, to ensure a consistent and scalable user experience across the entire application.',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Sub-tasks section
                      const Text(
                        'Sub-tasks:',
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Bullet points
                      _buildBulletPoint(
                        'Conduct a design audit of existing screens.',
                      ),
                      _buildBulletPoint(
                        'Design a library of reusable UI components.',
                      ),
                      _buildBulletPoint('Create a consistent set of icons.'),
                      _buildBulletPoint(
                        'Document all guidelines for designers and developers.',
                      ),

                      const SizedBox(height: 32),

                      // Due Date section
                      const Text(
                        'Due Date',
                        style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '25th of September, 2025',
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Publish Task Button
            Container(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Handle publish task action
                  print('Publish Task pressed');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Publish Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              color: Color(0xFF1F2937),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
