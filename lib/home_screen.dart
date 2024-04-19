import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import 'CandidatePage.dart';
import 'joblisting.dart';
import 'post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of posts to display
  List<Post> posts = [
    Post(
      title: 'Post 1',
      content: 'Exciting news! Our latest e-learning module is now live! 💻  #OnlineLearning',
      candidateName: 'John Doe',
      profilePictureUrl: 'https://t3.ftcdn.net/jpg/02/43/12/34/240_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
      imageUrl: 'https://static.vecteezy.com/system/resources/previews/003/661/176/original/e-learing-icon-set-vector.jpg',
    ),
    Post(
      title: 'Post 2',
      content: 'Job Hiring',
      candidateName: 'Jane Smith',
      profilePictureUrl: 'https://t3.ftcdn.net/jpg/03/02/88/46/240_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg',
      imageUrl: 'https://dq5pwpg1q8ru0.cloudfront.net/2020/11/04/05/08/07/a1251779-824d-45dd-bf4b-5f82810c28d3/Job%20Posting.jpg',
    ),
    Post(
      title: 'Post 3',
      content: 'Embracing New Challenges and Opportunities',
      candidateName: 'Peter Sam',
      profilePictureUrl: 'https://as1.ftcdn.net/v2/jpg/02/99/04/20/1000_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
      imageUrl: 'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg',
    ),
    Post(
      title: 'Post 4',
      content: 'Exploring the World of Image Processing: A Visual Journey into the Future of Technology',
      candidateName: 'Mike John',
      profilePictureUrl: 'https://as2.ftcdn.net/v2/jpg/02/92/95/17/1000_F_292951705_zv47wnXkjzHzSouYLpYcNgTOOosDv1ml.jpg',
      imageUrl: 'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
    ),
    Post(
      title: 'Post 5',
      content: 'Taj Mahal in sunrise light,Agra, India',
      candidateName: 'Michael Joseph',
      profilePictureUrl: 'https://as2.ftcdn.net/v2/jpg/03/96/06/33/1000_F_396063344_bXCceuBhkjTvvc8sGnNHFACe2lWFL7im.jpg',
      imageUrl: 'https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        const Text('JobNest', style: TextStyle(fontSize: 20,color: Colors.white)),
    ],
    ),
    backgroundColor: const Color(0xFF2f6aad), // Set app bar color directly
    actions: [
      IconButton(
        icon: Icon(Icons.post_add, color: Colors.white),
        onPressed: () async {
          // Navigate to post page and wait for the result (new post)
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostScreen()),
          );

          // Check if newPost is not null and add it to the posts list
          if (newPost != null) {
            setState(() {
              posts.add(newPost);
            });
          }
        },
      ),
      IconButton(
        icon: Icon(Icons.work , color: Colors.white),
        onPressed: () {
          // Navigate to job page
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobLists()),
                    );

        },
      ),
    IconButton(
    icon: Icon(Icons.person, color: Colors.white),
    onPressed: () {
    //Navigate to candidate page (this page)
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CandidateScreen()),
          );

    },
    ),
    ],
    ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'JobNest',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Home Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Create Post'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Create Post Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePostScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Job Lists'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Job Listing Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobLists()),
                );
              },
            ),
            ListTile(
              title: Text('Candidate List'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Candidate List Page
                // Replace `CandidatePage()` with your actual candidate list page class
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidateScreen()),
                );
              },
            ),
          ],
        ),
      ),
    body: Container(
    color: Colors.white, // Set the background color to white
    child: SafeArea(
    child: ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
    final post = posts[index];

    return Card(
    color: Colors.white, // Set the card background color to white
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    child: Padding(
    padding: EdgeInsets.all(15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    CircleAvatar(
    radius: 20.0,
    backgroundImage: NetworkImage(
    post.profilePictureUrl,
    ),
    ),
    SizedBox(width: 10.0),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    post.candidateName,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    Text(
    '1h ago', // Example timestamp
    style: TextStyle(
    color: Colors.grey,
    ),
    ),
    ],
    ),
    ],
    ),
    SizedBox(height: 10.0),
    Text(
    post.content,
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    if (post.imageUrl != null) ...[
    SizedBox(height: 10.0),
    Image.network(
    post.imageUrl!,
    fit: BoxFit.cover,
    ),
    ],
    SizedBox(height: 10.0),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    GestureDetector(
    onTap: () {
    // Navigate to Create Post Screen when the "Create a new post" section is clicked
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CreatePostScreen()),
    );
    },
    child: Text(
    'Create a new post',
    style: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    GestureDetector(
    onTap: () {
    setState(() {
    post.isLiked = !post.isLiked;
    });
    },
    child: AnimatedContainer(
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: post.isLiked ? Colors.blue.withOpacity(0.2) : Colors.transparent,
    ),
      padding: EdgeInsets.all(10.0),
      child: Icon(
        Icons.thumb_up,
        color: post.isLiked ? Colors.blue : Colors.grey,
      ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );
    },
    ),
    ),
    ),
    );
  }
}