import 'package:flutter/material.dart';

void main() {
  runApp(const NexusApp());
}

class NexusApp extends StatelessWidget {
  const NexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Nexus',
      debugShowCheckedModeBanner: false,
      home: NexusShelfScreen(),
    );
  }
}

class NexusShelfScreen extends StatelessWidget {
  const NexusShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EDF5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search & Add Bar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text('Search', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.7),
                    radius: 24,
                    child: const Icon(Icons.add, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // My Services Section
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My services',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black54),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 14,
                      children: [
                        _serviceItem(Icons.qr_code_scanner, 'Scan', Colors.blue),
                        _serviceItem(Icons.chat_bubble_outline, 'ChatGPT', Colors.black87),
                        _serviceItem(Icons.cleaning_services, 'Junk clean', Colors.green),
                        _serviceItem(Icons.delete_outline, 'Uninstall', Colors.red),
                        _serviceItem(Icons.note_add, 'New note', Colors.amber),
                        _serviceItem(Icons.calculate, 'Calculator', Colors.blueGrey),
                        _serviceItem(Icons.grid_view, 'More', Colors.indigo),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Memory Optimization Card
              _buildCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('91.2 MB', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87)),
                        SizedBox(height: 4),
                        Text('Memory optimisations', style: TextStyle(fontSize: 13, color: Colors.black45)),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 26,
                      backgroundColor: Color(0xFFE3F2FD),
                      child: Icon(Icons.ac_unit, color: Colors.blueAccent, size: 28),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Steps & Weather Row
              Row(
                children: [
                  // Step Card
                  Expanded(
                    child: Container(
                      height: 140,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF23C15D),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.directions_walk, color: Colors.white, size: 26),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('784', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                              Text('554 m', style: TextStyle(fontSize: 12, color: Colors.white70)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Weather Card
                  Expanded(
                    child: Container(
                      height: 140,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3B9BFF), Color(0xFF5AB6FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.white, size: 14),
                                  Text(' Chaur', style: TextStyle(color: Colors.white, fontSize: 13)),
                                ],
                              ),
                              Icon(Icons.wb_sunny, color: Colors.amber, size: 20),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('26°', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                              Text('Sunny  24° / 32°', style: TextStyle(fontSize: 12, color: Colors.white70)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  static Widget _serviceItem(IconData icon, String title, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, color: Colors.black87),
        ),
      ],
    );
  }
}
