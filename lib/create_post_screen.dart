import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'post.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _profilePictureUrlController =
  TextEditingController();

  String _postType = 'Regular Post';
  final List<String> _postTypes = ['Regular Post', 'Job Listing'];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Load saved data from SharedPreferences
    setState(() {
      _titleController.text = prefs.getString('title') ?? '';
      _contentController.text = prefs.getString('content') ?? '';
      _imageUrlController.text = prefs.getString('imageUrl') ?? '';
      _profilePictureUrlController.text =
          prefs.getString('profilePictureUrl') ?? '';
    });
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save data to SharedPreferences
    prefs.setString('title', _titleController.text);
    prefs.setString('content', _contentController.text);
    prefs.setString('imageUrl', _imageUrlController.text);
    prefs.setString('profilePictureUrl', _profilePictureUrlController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _postType,
                onChanged: (value) {
                  setState(() {
                    _postType = value!;
                  });
                },
                items: _postTypes.map((postType) {
                  return DropdownMenuItem(
                    value: postType,
                    child: Text(postType),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _profilePictureUrlController,
                decoration:
                InputDecoration(labelText: 'Profile Picture URL'),
              ),
              if (_postType == 'Job Listing') ...[
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Job Details'),
                  maxLines: 3,
                ),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveData(); // Save data when the submit button is pressed
                  // Create a new post object based on the form data
                  Post newPost = Post(
                    title: _titleController.text,
                    content: _contentController.text,
                    candidateName: 'Joel Thomas',
                    imageUrl: _imageUrlController.text,
                    profilePictureUrl: _profilePictureUrlController.text,
                  );
                  // Clear form fields after submitting post
                  _titleController.clear();
                  _contentController.clear();
                  _imageUrlController.clear();
                  _profilePictureUrlController.clear();
                  // Pass the new post back to the HomeScreen
                  Navigator.pop(context, newPost);
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              // Display the image preview
              if (_imageUrlController.text.isNotEmpty)
                Image.network(
                  _imageUrlController.text,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Text('Error loading image');
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}