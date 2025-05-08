import 'package:academatesapp/screens/matches_screen.dart';
import 'package:academatesapp/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:academatesapp/screens/chats_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _selectedIndex = 0;

  // Example dummy user data
  final List<Map<String, String>> users = [
    {'name': 'Alex', 'description': 'Loves study groups & late-night sessions'},
    {'name': 'Jamie', 'description': 'Prefers quiet libraries'},
    {'name': 'Morgan', 'description': 'Group work specialist'},
    {'name': 'Taylor', 'description': 'Focuses best with music'},
  ];
  
  void _onFilterPressed() {
    // Logic to show filters
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter options'),
        content: const Text('Here you can add filter controls'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add navigation logic here if needed
  }

  Widget _buildDiscoverPage() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 248, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 239, 248, 255),
        elevation: 0,
        title: const Text(
          'Discover',
          style: TextStyle(color: Color.fromARGB(255, 4, 69, 109), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color.fromARGB(255, 4, 69, 109)),
            onPressed: _onFilterPressed,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GridView.builder(
          itemCount: users.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.person, size: 40),
                    ),
                    const SizedBox(height: 10),
                    Text(user['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(user['description']!, maxLines: 3, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Screens per tab
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      _buildDiscoverPage(),
      const ChatScreen(),
      const MatchesScreen(),
      UserProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        selectedItemColor: const Color.fromARGB(255, 4, 69, 109),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.handshake), label: 'Matches'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}