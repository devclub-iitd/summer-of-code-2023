import 'package:flutter/material.dart';
import 'package:myapp/product.dart';
import 'apiservice.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
class PostProductForm extends StatefulWidget {
  final String addit;
  final Product? product;
  final Function() onUpdateParentState;
  PostProductForm({required this.addit,required this.onUpdateParentState,this.product});
  @override
  _PostProductFormState createState() => _PostProductFormState();
}

class _PostProductFormState extends State<PostProductForm> {

  final _formKey = GlobalKey<FormState>();
  String _id = '';
  String _title = '';
  String _description = '';
  int _price = 0;
  String _category = '';
  String _location = '';
  bool _isNegotiable = true;
  String _imageUrl = '';
  String _uploadStatus = 'Upload Image...';
  @override
  void initState() {
    Product? product = widget.product;
    if (product != null){
      _id = product.id;
      _title = product.title;
      _description = product.description;
      _price = product.price;
      _category = product.category;
      _location = product.location;
      _isNegotiable = product.isNegotiable;
      _imageUrl = product.image;
      _uploadStatus = "Previous image";
    }
    super.initState();
  }
  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    File ?_image;
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _uploadStatus = "Uploading";
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

            _uploadStatus = "Uploaded.";
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
        title: Text('${widget.addit} Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    initialValue: _title,
                    style: const TextStyle(color: Colors.blue),
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value ?? '';
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          initialValue: _category,
                          style: const TextStyle(color: Colors.blue),
                          decoration: const InputDecoration(
                            labelText: 'Category',
                            labelStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a category';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _category = value ?? '';
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          initialValue: _price.toString(),
                          style: const TextStyle(color: Colors.blue),
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            labelStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a price';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a int price(backend issue)';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _price = int.tryParse(value ?? '') ?? 0;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    initialValue: _location,
                    style: const TextStyle(color: Colors.blue),
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _location = value ?? '';
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    initialValue: _description,
                    style: const TextStyle(color: Colors.blue),
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value ?? '';
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Is Negotiable',
                      style: TextStyle(color: Colors.black),
                    ),
                    Switch(
                      value: _isNegotiable,
                      onChanged: (value) {
                        setState(() {
                          _isNegotiable = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_uploadStatus                      ,
                      style: TextStyle(color: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        _uploadImage();
                      },
                      child: Text('Select Image'),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_imageUrl != "") {
                        _formKey.currentState!.save();
                        // Process the form data, e.g., save the product to the database
                        if (widget.addit == "Add") {
                          ApiService.addProduct(
                              _category,
                              _location,
                              _title,
                              _description,
                              _price.toString(),
                              _isNegotiable.toString(),
                              _imageUrl).then((value) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Product Added'),
                                  content: const Text(
                                      'Your product has been added to the market place.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        widget.onUpdateParentState();
                                        Navigator.of(context)
                                            .pop(); // Navigate to the home page
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        } else {
                          if (!(widget.product == null)) {
                            ApiService.editProduct(
                                _id,
                                _category,
                                _location,
                                _title,
                                _description,
                                _price.toString(),
                                _isNegotiable.toString(),
                                _imageUrl.toString(),
                            ).then((value) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Edited'),
                                    content: const Text(
                                        'Your product has been edited succesfully.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          widget.onUpdateParentState();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          }
                        }
                      } else{
                        setState(() {
                          _uploadStatus = "Uploading image is compulsory.";
                        });
                      }
                    }
                  },
                  child: Text('${widget.addit} Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
