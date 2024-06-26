import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidancePage extends ConsumerWidget {
  GuidancePage({super.key});

  static const String routePath = "/guidance";

  final List<Map<String, String>> guidance = [
    {
      "imageUrl": "assets/glasses.png",
      "title": "Pakai Kacamata",
      "description":
          "Pakai kacamata dengan senyaman mungkin agar tidak terganggu saat berkendara"
    },
    {
      "imageUrl": "assets/btn_i.png",
      "title": "Aktifkan Saklar",
      "description":
          "Geser saklar ke bawah untuk menyalakan alat dan geser ke atas untuk mematikan alat"
    },
    {
      "imageUrl": "assets/bluetooth.png",
      "title": "Hubungkan Alat",
      "description":
          "Hubungkan alat dengan menuju menu bluetooth dan pilih nama opticon"
    },
    {
      "imageUrl": "assets/map.png",
      "title": "Tampilan Ganda",
      "description":
          "Anda bisa melihat data sambil membuka aplikasi lainnya seperti maps"
    },
    {
      "imageUrl": "assets/eye.png",
      "title": "Mata Mengantuk",
      "description":
          "Jika mata anda mengantuk, buzzer akan berbunyi. Sebaiknya anda berhenti sejenak untuk beristirahat"
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
          'Panduan Pakai',
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
