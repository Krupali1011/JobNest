// JobLists.dart
import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import 'jobdetails.dart';

class JobLists extends StatefulWidget {
  const JobLists({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JobListsState createState() => _JobListsState();
}

class _JobListsState extends State<JobLists> {
  List<Map<String, String>> jobs = [
     {
      "title": "iOS Developer",
      "company": "Apple Corp.",
      "description": "Join our team at Apple and be part of a company that is revolutionizing technology and changing the way we interact with the world. As an iOS Developer, you will have the opportunity to work on cutting-edge projects, develop innovative applications for Apple devices, and contribute to the success of products that millions of users rely on every day. Whether you're passionate about user interface design, mobile development, or backend systems, Apple offers a collaborative and dynamic environment where you can unleash your creativity and make a real impact.",
      "image": "assets/apple.png",
    },
    {
      "title": "Logistics Coordinator",
      "company": "Fedex corp.",
      "description": "Become part of the global logistics powerhouse that is FedEx and play a vital role in ensuring the efficient movement of goods around the world. As a Logistics Coordinator, you will be responsible for overseeing the end-to-end logistics process, from coordinating shipments and managing transportation to optimizing supply chain operations and ensuring on-time delivery for our customers. Join our team and be part of a company that is committed to delivering excellence, innovation, and reliability in every aspect of our business.",
      "image": "assets/fedex.png",
    },
    {
      "title": "Software Engineer",
      "company": "Google",
      "description": "Join the world-class engineering team at Google and embark on a journey of innovation, collaboration, and impact. As a Software Engineer, you will have the opportunity to work on cutting-edge projects, develop scalable software solutions, and tackle some of the most challenging problems in technology. Whether you're passionate about building distributed systems, designing user interfaces, or optimizing algorithms, Google offers a dynamic and supportive environment where you can thrive, grow, and make a difference.",
      "image": "assets/google.png",
    },
    {
      "title": "Content Writer",
      "company": "Grammarly",
      "description": "Are you passionate about the power of words and the art of storytelling? Join the Content Writing team at Grammarly and become part of a company that is dedicated to helping people communicate more effectively. As a Content Writer, you will have the opportunity to create compelling and error-free content for Grammarly's products, including articles, blog posts, social media posts, and marketing materials. Whether you're a seasoned wordsmith or a budding wordsmith, Grammarly offers a supportive and collaborative environment where you can unleash your creativity, refine your writing skills, and make a meaningful impact on millions of users worldwide.",
      "image": "assets/grammarly.jpeg",
    },
    {
      "title": "Hardware Engineer",
      "company": "HP",
      "description": "Join the innovative hardware engineering team at HP and help shape the future of technology. As a Hardware Engineer, you will have the opportunity to design and develop cutting-edge hardware solutions for HP's range of products, from laptops and desktops to printers and peripherals. Whether you're passionate about circuit design, mechanical engineering, or product testing, HP offers a dynamic and collaborative environment where you can bring your ideas to life, push the boundaries of innovation, and make a real impact on the world.",
      "image": "assets/hp.png",
    },
    {
      "title": "Financial Analyst",
      "company": "HSBC Ltd.",
      "description": "Join the dynamic world of finance at HSBC and play a key role in driving business growth, strategy, and decision-making. As a Financial Analyst, you will have the opportunity to analyze financial data, prepare reports, and provide insights that help shape the direction of one of the world's largest banking and financial services organizations. Whether you're passionate about risk management, investment analysis, or financial modeling, HSBC offers a supportive and collaborative environment where you can grow your career, expand your skills, and make a meaningful impact on the global economy.",
      "image": "assets/hsbc.png",
    },
    {
      "title": "Data Scientist",
      "company": "IBM",
      "description": "Join the data-driven world of IBM and unlock the power of data to drive innovation, solve complex problems, and transform industries. As a Data Scientist, you will have the opportunity to leverage advanced analytics, machine learning, and artificial intelligence techniques to extract valuable insights from data and deliver actionable recommendations to clients across a variety of sectors. ",
      "image": "assets/ibm.png",
    },
    {
      "title": "Hardware Design Engineer",
      "company": "Intel core",
      "description": "Join the groundbreaking hardware engineering team at Intel and help drive innovation in the semiconductor industry. As a Hardware Design Engineer, you will have the opportunity to design and develop next-generation processors and hardware components that power Intel's range of computing products. ",
      "image": "assets/intel.png",
    },
    {
      "title": "Marketing Specialist",
      "company": "October",
      "description": "Are you passionate about marketing and communication? Join the marketing team at October and become part of a company that is redefining the way small businesses access financing. As a Marketing Specialist, you will have the opportunity to plan and execute marketing campaigns, manage social media channels, and engage with customers to promote October's products and services. Whether you're a creative thinker, a strategic planner, or a data-driven marketer, October offers a collaborative and dynamic environment where you can unleash your creativity, drive business growth, and make a real impact on the success of small businesses around the world.",
      "image": "assets/october.jpeg",
    },
    {
      "title": "Database Administrator",
      "company": "Oracle",
      "description": "As a Database Administrator, you will have the opportunity to manage and optimize Oracle databases, ensure data security and integrity, and provide technical support to users and applications. Whether you're an expert in database performance tuning, backup and recovery, or SQL optimization, Oracle offers a collaborative and supportive environment where you can expand your skills, solve complex challenges, and drive innovation in the database industry.",
      "image": "assets/oracle.png",
    },
    {
      "title": "Android Developer",
      "company": "Samsung",
      "description": " Join the innovative mobile development team at Samsung and help create the next generation of Android applications and services. As an Android Developer, you will have the opportunity to work on cutting-edge projects, develop innovative features, and contribute to Samsung's ecosystem of mobile devices and services. ",
      "image": "assets/samsung.png",
    },
    {
      "title": "Product Manager",
      "company": "Slack ltd.",
      "description": "Are you passionate about building products that improve collaboration and productivity? Join the product management team at Slack and become part of a company that is revolutionizing the way teams work together. As a Product Manager, you will have the opportunity to lead the development of new features and enhancements for Slack's collaboration platform, driving product strategy and roadmap prioritization. ",
      "image": "assets/slack.jpeg",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Lists"),
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
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetails(
                    title: jobs[index]["title"]!,
                    company: jobs[index]["company"]!,
                    description: jobs[index]["description"]!,
                    imageUrl: jobs[index]["image"]!,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        jobs[index]["image"]!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobs[index]["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "Company: ${jobs[index]["company"]}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
