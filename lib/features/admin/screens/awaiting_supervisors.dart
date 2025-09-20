import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/admin/screens/supervisor_assignment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupervisorAssignmentScreen extends StatefulWidget {
  const SupervisorAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<SupervisorAssignmentScreen> createState() =>
      _SupervisorAssignmentScreenState();
}

class _SupervisorAssignmentScreenState
    extends State<SupervisorAssignmentScreen> {
  final _supabase = Supabase.instance.client;
  List<dynamic> _unassignedInterns = [];
  bool _isLoading = true;
  int _unassignedCount = 0;

  @override
  void initState() {
    super.initState();
    _fetchUnassignedInterns();
  }

  Future<void> _fetchUnassignedInterns() async {
    try {
      final response = await _supabase
          .from('interns')
          .select('intern_id, full_name, track_id, profile_image')
          .filter('supervisor_id', 'is', null)
          .not('track_id', 'is', null);

      setState(() {
        _unassignedInterns = response;
        _unassignedCount = response.length;
      });
    } catch (e) {
      // In a real app, handle this error more gracefully
      print('Error fetching unassigned interns: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E3A8A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Awaiting Supervisors ($_unassignedCount)',
          style: TextStyle(
            color: Color(0xFF1E3A8A), // Blue color
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: false,
      ),
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 3),
                // Title
                const Text(
                  'Ready for Supervisor\'s\nAssignment',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 32),
                // Team Members List
                // The new section to be added
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _unassignedInterns.isEmpty
                    ? const Center(
                      child: Text('No interns ready for assignment.'),
                    )
                    : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _unassignedInterns.length,
                        itemBuilder: (context, index) {
                          final intern = _unassignedInterns[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 12.0,
                            ),
                            child: _buildTeamMember(
                              intern['full_name'] as String,
                              intern['track_id'] as String,
                              intern['profile_image'] as String?,
                            ),
                          );
                        },
                      ),
                    ),
                const SizedBox(height: 24),
                // Create Intern Account Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Navigate to the assignment page and await the result
                      final bool? result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupervisorAssignmentPage(),
                        ),
                      );

                      // If the result is true, it means an intern was assigned.
                      // We should then refresh the list.
                      if (result == true) {
                        _fetchUnassignedInterns();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Assign a supervisor',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // The updated _buildTeamMember function
  Widget _buildTeamMember(String name, String role, String? imageUrl) {
    return Column(
      children: [
        Row(
          children: [
            // Profile Image
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xFFF1F5F9),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child:
                    imageUrl != null && imageUrl.isNotEmpty
                        ? Image.network(
                          imageUrl,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 24,
                              color: Color(0xFF94A3B8),
                            );
                          },
                        )
                        : const Icon(
                          Icons.person,
                          size: 24,
                          color: Color(0xFF94A3B8),
                        ),
              ),
            ),
            const SizedBox(width: 16),
            // Name and Role
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Divider(
          height: 1,
          color: Color(0xFFE2E8F0),
        ), // Add a subtle divider
      ],
    );
  }
}
