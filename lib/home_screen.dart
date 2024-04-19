import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import 'joblisting.dart';
import 'post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                'JobNest', style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
        backgroundColor: const Color(0xFF2f6aad), // Set app bar color directly
        actions: [
          IconButton(
            icon: const Icon(Icons.post_add, color: Colors.white),
            onPressed: () {
              // Navigate to post page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePostScreen()),
              );
            },
          ),

        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
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
              title: const Text('Create Post'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePostScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Job Lists'), // Add this ListTile for Job Lists
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobLists()),
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
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.candidateName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '1h ago', // Example timestamp
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        post.content,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      if (post.imageUrl != null) ...[
                        const SizedBox(height: 10.0),
                        Image.network(
                          post.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      ],
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to Create Post Screen when the "Create a new post" section is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreatePostScreen()),
                              );
                            },
                            child: const Text(
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
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: post.isLiked ? Colors.blue.withOpacity(
                                    0.2) : Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(10.0),
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
