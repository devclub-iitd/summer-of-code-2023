import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File ?_image;
  String ?_imageUrl;

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });

    if (_image != null) {
      final metadata = SettableMetadata(contentType: "image/jpeg");
      final storageRef = FirebaseStorage.instance.ref();
      final filePath = "product_images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
      final uploadTask = storageRef.child(filePath).putData(await _image!.readAsBytes(), metadata);

      uploadTask.whenComplete(() async {
        if (uploadTask.snapshot.state == TaskState.success) {
          final downloadUrl = await storageRef.child(filePath).getDownloadURL();
          setState(() {
            _imageUrl = downloadUrl;
          });
        } else {
          print("error");
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!)
                : Text('No image selected'),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Select Image'),
              onPressed: _uploadImage,
            ),
            SizedBox(height: 20.0),
            _imageUrl != null
                ? Text(_imageUrl!.toString())
                : Text('No uploaded image'),
          ],
        ),
      ),
    );
  }
}
