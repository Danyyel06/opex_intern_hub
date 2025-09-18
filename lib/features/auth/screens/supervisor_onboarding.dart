import 'package:flutter/material.dart';

class SupervisorProfileScreen extends StatelessWidget {
  const SupervisorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1E3A8A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Supervisor Profile',
          style: TextStyle(
            color: Color(0xFF1E3A8A), // Blue color
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Avatar
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 4),
                  color: Colors.white,
                ),
                child: const Icon(Icons.person, size: 50, color: Colors.black),
              ),
            ),

            const SizedBox(height: 40),

            // Full Name Section
            _buildInfoSection(
              'Full Name',
              'Ifeoluwa Bankole Simeon',
              Icons.person,
            ),

            const SizedBox(height: 24),

            // Phone Number Section
            _buildInfoSection('Phone Number', '070 000 00 000', Icons.phone),

            const SizedBox(height: 24),

            // Location Section
            _buildInfoSection('Location', 'Lokoja, Nigeria', Icons.location_on),

            const SizedBox(height: 24),

            // Email Section
            _buildInfoSection('Email', 'tolagben23@gmail.com', Icons.email),

            const SizedBox(height: 40),

            // Supervisor's & Personal Information Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Supervisor\'s & Personal Information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Role/Title
                  _buildCardInfoRow('Role/Title', 'Senior Software Engineer'),

                  const SizedBox(height: 16),

                  // Department
                  _buildCardInfoRow('Department', 'Software Engineering'),

                  const SizedBox(height: 16),

                  // New Password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'New Password',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '••••••••',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(height: 1, color: const Color(0xFFE5E7EB)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Complete Profile Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Complete Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40), // Extra bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(icon, size: 20, color: Colors.black),
            const SizedBox(width: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: const Color(0xFFE5E7EB)),
      ],
    );
  }

  Widget _buildCardInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: const Color(0xFFE5E7EB)),
      ],
    );
  }
}
