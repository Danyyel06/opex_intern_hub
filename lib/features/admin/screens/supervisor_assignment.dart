import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:opex_intern_hub/features/admin/screens/congrats.dart';
import 'package:opex_intern_hub/features/admin/screens/admin_dashboard.dart'; // Import your admin dashboard here

class SupervisorAssignmentPage extends StatefulWidget {
  const SupervisorAssignmentPage({Key? key}) : super(key: key);

  @override
  State<SupervisorAssignmentPage> createState() =>
      _SupervisorAssignmentPageState();
}

class _SupervisorAssignmentPageState extends State<SupervisorAssignmentPage> {
  final _supabase = Supabase.instance.client;

  // State for fetching data for dropdowns
  List<Map<String, dynamic>> _unassignedInterns = [];
  List<Map<String, dynamic>> _supervisors = [];
  bool _isLoadingData = true;

  // State for selected values
  String? _selectedInternId;
  String? _selectedSupervisorId;

  // Track if assignment is in progress
  bool _isAssigning = false;

  @override
  void initState() {
    super.initState();
    _fetchDropdownData();
  }

  // This function fetches the data for both dropdowns
  Future<void> _fetchDropdownData() async {
    setState(() {
      _isLoadingData = true;
    });
    try {
      // Fetch unassigned interns from the database
      final List<dynamic> internsResponse = await _supabase
          .from('interns')
          .select('intern_id, full_name')
          .filter('supervisor_id', 'is', null)
          .not('track_id', 'is', null); // Ensures they've chosen a track

      // Fetch all supervisors from the database
      final List<dynamic> supervisorsResponse = await _supabase
          .from('supervisors') // Assuming your table is named 'supervisors'
          .select(
            'supervisor_id, full_name',
          ); // Assuming your columns are these

      setState(() {
        _unassignedInterns = List<Map<String, dynamic>>.from(internsResponse);
        _supervisors = List<Map<String, dynamic>>.from(supervisorsResponse);
      });
    } catch (e) {
      print('Error fetching dropdown data: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load data: $e')));
    } finally {
      setState(() {
        _isLoadingData = false;
      });
    }
  }

  // This function handles the database update when the button is pressed
  Future<void> _assignSupervisor() async {
    if (_selectedInternId == null || _selectedSupervisorId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both an intern and a supervisor.'),
        ),
      );
      return;
    }

    setState(() {
      _isAssigning = true;
    });

    try {
      await _supabase
          .from('interns')
          .update({'supervisor_id': _selectedSupervisorId})
          .eq('intern_id', _selectedInternId!);

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Supervisor assigned successfully!')),
      );

      Navigator.of(context).pop(true);
    } catch (e) {
      print('Error assigning supervisor: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to assign supervisor: $e')),
      );
    } finally {
      setState(() {
        _isAssigning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

                // Intern Dropdown Section
                Text(
                  'Intern\'s Name',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF374151),
                  ),
                ),
                const SizedBox(height: 8),
                _isLoadingData
                    ? const Center(child: CircularProgressIndicator())
                    : _unassignedInterns.isEmpty
                    ? const Text('No unassigned interns available.')
                    : DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select Intern',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF1E3A8A),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: _selectedInternId,
                      items:
                          _unassignedInterns.map((intern) {
                            return DropdownMenuItem<String>(
                              value: intern['intern_id']?.toString(),
                              child: Text(intern['full_name'] as String),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedInternId = newValue;
                        });
                      },
                    ),
                const SizedBox(height: 40),

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

                // Supervisor Dropdown Section
                Text(
                  'Supervisor',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF374151),
                  ),
                ),
                const SizedBox(height: 8),
                _isLoadingData
                    ? const SizedBox()
                    : _supervisors.isEmpty
                    ? const Text('No supervisors available.')
                    : DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select Supervisor',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF1E3A8A),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: _selectedSupervisorId,
                      items:
                          _supervisors.map((supervisor) {
                            return DropdownMenuItem<String>(
                              value: supervisor['supervisor_id']?.toString(),
                              child: Text(supervisor['full_name'] as String),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSupervisorId = newValue;
                        });
                      },
                    ),
                const SizedBox(height: 60),

                // Assign Supervisor Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isAssigning ? null : _assignSupervisor,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child:
                        _isAssigning
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : const Text(
                              'Assign Supervisor',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
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
}
