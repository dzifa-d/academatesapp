import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {

  final Map<String, dynamic> userData = {
    'name': 'Gigi',
    'gender': 'Female',
    'description': 'Loves study groups & late-night sessions',
    'preferences': {
      'studyStyle': 'Group Study',
      'studyEnvironment': 'Quiet Library',
      'musicPreference': 'Lo-fi Beats',
    },
    'location': 'New York, NY',
    'age': 22,
    'major': 'Computer Science',
  };

  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 248, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Profile',
        style: TextStyle(
          color: Color.fromARGB(255, 4, 69, 109),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Personal Information'),
            _buildInfoTile('Full Name', userData['name']),
            _buildInfoTile('Gender', userData['gender']),
            _buildInfoTile('Age', userData['age'].toString()),
            _buildInfoTile('Location', userData['location']),
            _buildInfoTile('Major', userData['major']),
            _buildInfoTile('Description', userData['description']),
            _buildSectionTitle('Preferences'),
            _buildInfoTile('Study Style', userData['preferences']['studyStyle']),
            _buildInfoTile('Study Environment', userData['preferences']['studyEnvironment']),
            _buildInfoTile('Music Preference', userData['preferences']['musicPreference']),

            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to edit profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 69, 109),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text('Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ]
        )
      )
    );
  }

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 4, 69, 109),
      ),
    ),
  );
}

Widget _buildInfoTile(String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 4, 69, 109), width: 0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RichText(
        text: TextSpan(
          text: '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}