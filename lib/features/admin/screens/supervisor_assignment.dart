import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/admin/widgets/congrats.dart';

class SupervisorAssignmentPage extends StatefulWidget {
  const SupervisorAssignmentPage({Key? key}) : super(key: key);

  @override
  State<SupervisorAssignmentPage> createState() =>
      _SupervisorAssignmentPageState();
}

class _SupervisorAssignmentPageState extends State<SupervisorAssignmentPage> {
  final TextEditingController _supervisorController = TextEditingController();

  @override
  void dispose() {
    _supervisorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Title
              const Text(
                'Ready for Supervisor\'s\nAssignment',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 60),

              // Name Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF374151),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Olunupe Kolade Emmanuel',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF111827),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // "to" text
              const Center(
                child: Text(
                  'to',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Supervisor Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Supervisor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF374151),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      controller: _supervisorController,
                      decoration: const InputDecoration(
                        hintText: 'Enter supervisor name',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Assign Supervisor Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupervisorAssignedScreen(),
                      ),
                    );
                    // Handle assign supervisor action
                    if (_supervisorController.text.isNotEmpty) {
                      // Add your assignment logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Supervisor "${_supervisorController.text}" assigned successfully!',
                          ),
                          backgroundColor: const Color(0xFF1E3A8A),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a supervisor name'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Assign Supervisor',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
