class Post {
  final String title;
  final String content;
  final String candidateName;
  final String imageUrl;
  final String profilePictureUrl;
  bool isLiked; // Define isLiked property

  Post({
    required this.title,
    required this.content,
    required this.candidateName,
    required this.imageUrl,
    required this.profilePictureUrl,
    this.isLiked = false, // Initialize isLiked to false
  });
}