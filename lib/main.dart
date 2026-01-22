import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TeacherForm(),
    );
  }
}

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final picker = ImagePicker();
  File? image;

  Future pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  Widget field(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إدارة معهد شنقيط"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: image != null ? FileImage(image!) : null,
                child: image == null
                    ? const Icon(Icons.camera_alt, size: 40)
                    : null,
              ),
            ),
            const SizedBox(height: 12),

            field("اسم الأستاذ"),
            field("تاريخ الميلاد"),
            field("محل الميلاد"),
            field("الرقم الوطني"),
            field("تاريخ الالتحاق بالمعهد"),
            field("الفرع"),
            field("الكفاءة"),
            field("الملاحظة"),

            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 45),
              ),
              onPressed: () {},
              child: const Text("حفظ البيانات"),
            ),
          ],
        ),
      ),
    );
  }
}
