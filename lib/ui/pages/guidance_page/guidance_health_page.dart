import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidanceHealthPage extends ConsumerWidget {
  GuidanceHealthPage({super.key});

  static const String routePath = "/guidance/health";

  final List<Map<String, String>> guidance = [
    {
      "imageUrl": "assets/clock.png",
      "title": "Berhenti Sejenak",
      "description":
          "Jika anda merasa lelah, sebaiknya berhenti sejenak untuk beristirahat"
    },
    {
      "imageUrl": "assets/sandclock.png",
      "title": "Atur Waktu Berkendara",
      "description":
          "Jangan memaksakan berkendara dengan waktu yang lama, gunakan fitur prediksi keamanan untuk mengetahui waktu berkendara yang aman"
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          'Panduan Aman',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView.builder(
            itemCount: guidance.length,
            itemBuilder: (context, index) {
              final data = guidance[index];
              return _buildContainer(context,
                  imageUrl: data['imageUrl']!,
                  index: index + 1,
                  title: data['title']!,
                  description: data['description']!);
            },
          )),
    );
  }

  Widget _buildContainer(context,
      {required String imageUrl,
      required int index,
      required String title,
      required String description}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: colorScheme.outline.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  height: 64,
                  width: 64,
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$index.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.grey.shade600),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey.shade600),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ))
          ],
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}
