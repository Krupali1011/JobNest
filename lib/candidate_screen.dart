import 'package:flutter/material.dart';

class CandidateDetailsPage extends StatefulWidget {
  final Map<String, String> candidate;

  const CandidateDetailsPage({Key? key, required this.candidate}) : super(key: key);

  @override
  _CandidateDetailsPageState createState() => _CandidateDetailsPageState();
}

class _CandidateDetailsPageState extends State<CandidateDetailsPage> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.candidate["name"]!,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF2f6aad),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      widget.candidate["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  widget.candidate["name"]!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.candidate["title"]!,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  widget.candidate["email"]!,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  widget.candidate["address"]!,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  widget.candidate["about"]!,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isFollowing = !_isFollowing;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      _isFollowing ? Colors.green : const Color(0xFF2f6aad),
                    ),
                  ),
                  child: Text(
                    _isFollowing ? "Unfollow" : "Connect +",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            ),
    );
    }
}