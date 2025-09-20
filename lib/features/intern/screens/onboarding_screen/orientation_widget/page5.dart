import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/complete_onboarding.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnboardingStage5 extends StatefulWidget {
  @override
  _OnboardingStage5State createState() => _OnboardingStage5State();
}

class _OnboardingStage5State extends State<OnboardingStage5> {
  String? selectedPath;
  bool _isLoading = false;
  final supabase = Supabase.instance.client;

  Future<void> _saveTrackSelection() async {
    if (selectedPath == null) {
      // Optional: show a snackbar if no track is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a track to continue.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // You'll need a way to map the selected path string to a track ID.
      // For example, using a simple map.
      final Map<String, int> trackMap = {
        'Product Manager': 1, // Assuming these are your track IDs
        'Front-End Engineer': 2,
        'Back-End Engineer': 3,
        'UI/UX Designer': 4,
      };

      final int? selectedTrackId = trackMap[selectedPath];

      if (selectedTrackId != null) {
        final currentUser = Supabase.instance.client.auth.currentUser;
        if (currentUser != null) {
          await Supabase.instance.client
              .from('interns')
              .update({'track_id': selectedTrackId})
              .eq('intern_id', currentUser.id);

          // On success, navigate to the congratulations page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const CongratulationsScreen(),
            ),
          );
        } else {
          throw 'User not logged in';
        }
      } else {
        throw 'Invalid track selected';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A8A),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '5',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF1E3A8A),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'images/Progress.png',
                      fit: BoxFit.cover,
                      width: 350,
                      height: 350,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'STAGE 5',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your Desired\nPath',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Congratulations on reaching the final stage of your onboarding journey!',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This module is your opportunity to define the path you\'d like to take at Opex Consulting. Your selection will help us understand your professional interests and align you with projects and mentors that will be most fulfilling for you.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This is a crucial step in shaping your internship experience and setting you up for success. Please take a moment to review the available roles and select the one that best matches your passion and career goals.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 400,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _buildRoleCard(
                      'Product Manager',
                      'images/Product Manager.png',
                    ),
                    _buildRoleCard(
                      'Front-End Engineer',
                      'images/Web Development 2 (1).png',
                    ),
                    _buildRoleCard('Back-End Engineer', 'images/Coding 2.png'),
                    _buildRoleCard(
                      'UI/UX Designer',
                      'images/Wireframe (1).png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed:
                      selectedPath != null && !_isLoading
                          ? _saveTrackSelection // Call the new function
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF102592),
                    disabledBackgroundColor: const Color(0xFF9CA3AF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  // ... existing style properties
                  child:
                      _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            'Complete Onboarding',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(String title, String imagePath) {
    final isSelected = selectedPath == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPath = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF102592) : const Color(0xFFE5E7EB),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color:
                    isSelected
                        ? const Color(0xFF1B4332)
                        : const Color(0xFF111827),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
