import 'package:flutter/material.dart';
import 'candidate_screen.dart';

class Candidate extends StatelessWidget {
  final List<Map<String, String>> candidates = [
    {
      "image": 'assets/alen.png',
      "name": 'JOHN DOE',
      "title": 'Content creator',
      "email": 'john@gmail.com',
      "about": 'Hello, my name is JOHN DOE. I am a passionate content creator with a keen eye for detail. I specialize in crafting engaging and informative content across various platforms, including social media, blogs, and websites. My goal is to create content that resonates with audiences and drives meaningful engagement.',
      "address": 'Ontario Canada'
    },
    {
      "image": 'assets/shyam.png',
      "name": 'Danney Smith',
      "title": 'Engineer',
      "email": 'danny123@yahoo.com',
      "about": 'Hello there! I am Danney Smith, a dedicated engineer with a knack for problem-solving and innovation. With a strong background in mechanical engineering and a passion for technology, I thrive in dynamic environments where I can apply my skills to tackle complex challenges. Whether it is designing cutting-edge solutions or optimizing existing processes, I am always up for the task.',
      "address": 'Scarborough,Canada'
    },
    {
      "image": 'assets/annmaria.png',
      "name": 'Ann Maria',
      "title": 'QA',
      "email": 'annmariakv@gmail.com',
      "about": 'Hi, I am Ann Maria, a meticulous quality assurance specialist with a passion for ensuring product excellence. With years of experience in software testing and quality control, I specialize in identifying and resolving defects to deliver flawless products to customers. I am detail-oriented, analytical, and thrive in fast-paced environments where precision is paramount. ',
      "address": 'Periberry,USA'
    },
    {
      "image": 'assets/Ben.png',
      "name": 'Ben George',
      "title": 'UX Designer',
      "email": 'ben@yahoo.com',
      "about": 'Hey, I am Ben George, a creative UX designer with a passion for crafting exceptional user experiences. With a keen eye for aesthetics and a deep understanding of user behavior, I specialize in creating intuitive interfaces that delight users and drive engagement. Whether it is wireframing, prototyping, or conducting user research, I am dedicated to creating solutions that make a lasting impact. Let us collaborate and design experiences that inspire!',
      "address": 'Kitchener,Ontario'
    },
    {
      "image": 'assets/eliz.png',
      "name": 'Eliz Karvey',
      "title": 'Software Engineer',
      "email": 'elizmaria01@gmail.com',
      "about": 'Hi, I am Eliz Karvey, a versatile software engineer with a passion for building innovative solutions. With expertise in full-stack development and a strong foundation in computer science, I thrive in dynamic environments where I can leverage my skills to solve complex problems. Whether its developing scalable web applications, optimizing database performance, or implementing new technologies, I am always up for the challenge. Lets code something amazing together!',
      "address": 'London,Ontario'
    },
    {
      "image": 'assets/eric.png',
      "name": 'Eric Jim',
      "title": 'Marketing Manager',
      "email": 'ericjin11@yahoo.com',
      "about": 'Hi, I am Eric Jim, a results-driven marketing manager with a track record of driving growth and engagement. With a strategic mindset and a passion for storytelling, I specialize in developing and executing marketing campaigns that resonate with audiences and drive meaningful results. Whether its crafting compelling content, optimizing digital channels, or analyzing campaign performance, I am dedicated to delivering impactful marketing strategies that drive success. Lets create marketing magic together!',
      "address": 'Toronto,Ontario'
    },
    {
      "image": 'assets/john.png',
      "name": 'John Key',
      "title": 'Web Developer',
      "email": 'johnn12@gmail.com',
      "about": 'Hi, I am John Key, a passionate web developer with a love for coding and problem-solving. With expertise in front-end and back-end development, I specialize in creating responsive and scalable web applications that deliver exceptional user experiences. Whether its building interactive interfaces, optimizing website performance, or implementing new features, I am committed to creating solutions that make a difference. Lets build the web of tomorrow together!',
      "address": 'New york,USA'
    },
    {
      "image": 'assets/Philip.png',
      "name": 'Philip Harvey',
      "title": 'Hardware Technician',
      "email": 'philip01@gmail.com',
      "about": 'Hey there! I am Philip Harvey, a skilled hardware technician with a passion for technology and innovation. With a background in electrical engineering and hands-on experience in hardware troubleshooting and maintenance, I specialize in diagnosing and repairing a wide range of hardware issues. Whether its upgrading systems, troubleshooting network connectivity, or installing components, I am dedicated to keeping technology running smoothly. Lets keep hardware humming together!',
      "address": 'Berrie,BC'
    },
    {
      "image": 'assets/sam.png',
      "name": 'Sam King',
      "title": 'Database Administrator',
      "email": 'samV@gmail.com',
      "about": 'Hi, I am Sam King, a meticulous database administrator with a knack for optimizing data management systems. With expertise in database design, implementation, and maintenance, I specialize in ensuring data integrity, security, and performance. Whether its designing schema, optimizing queries, or troubleshooting issues, I am committed to keeping databases running smoothly and efficiently. Lets manage data like pros together!',
      "address": 'Hamilton,Ontario'
    },
    {
      "image": 'assets/shyam.png',
      "name": 'Shyam Vargese',
      "title": 'Project Manager',
      "email": 'shyam@yahoo.com',
      "about": 'Hi, I am Shyam Vargese, a seasoned project manager with a passion for delivering successful outcomes. With a strategic mindset and strong leadership skills, I specialize in overseeing projects from inception to completion, ensuring delivery on time and within budget. Whether its managing timelines, mitigating risks, or facilitating communication, I am dedicated to driving project success and exceeding stakeholder expectations. Lets manage projects like pros together!',
      "address": 'Milton,Ontario'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate List',style: TextStyle(fontSize: 20, color: Colors.white)),
        backgroundColor: const Color(0xFF2f6aad),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CandidateDetailsPage(
                    candidate: candidates[index],
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(candidates[index]["image"]!),
                ),
                title: Text(candidates[index]["name"]!),
                subtitle: Text(candidates[index]["title"]!),
              ),
            ),
          );
        },
      ),
    );
  }
}
