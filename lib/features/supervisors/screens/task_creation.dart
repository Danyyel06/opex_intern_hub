import 'package:flutter/material.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

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
          'Create a new task',
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter task title',
                hintStyle: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E7EB),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E7EB),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF1E3A8A),
                    width: 1,
                  ),
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
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Enter task description',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFF1E3A8A),
                      width: 1,
                    ),
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
}
