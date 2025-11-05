import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Profile Circle
          Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff74A73D), width: 4.0),
            ),
            child: ClipOval(
              child: _selectedImage == null
                  ? Image.asset(
                      "assets/images/Ellipse 79.png",
                      fit: BoxFit.cover,
                    )
                  : Image.file(File(_selectedImage!.path), fit: BoxFit.cover),
            ),
          ),

          // Camera Icon
          Positioned(
            right: -5.w,
            bottom: 1.h,
            child: GestureDetector(
              onTap: () async {
                // Show bottom sheet for camera or gallery choice
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  builder: (_) => _buildImagePickerOptions(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff74A73D)),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: const Color(0xff74A73D),
                  size: 25.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePickerOptions() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text("Camera"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff74A73D),
              foregroundColor: Colors.white,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
            icon: const Icon(Icons.photo_library),
            label: const Text("Gallery"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff74A73D),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
