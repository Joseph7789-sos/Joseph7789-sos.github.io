import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.blue, // Adjust the color to match the website's theme
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/ctasection2.png', fit: BoxFit.cover), // Replace with your cover image URL or asset
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Our Mission', style: Theme.of(context).textTheme.headline5),
                  Text(
                    "Many small business owners are frustrated with the high costs and limited utility of off-the-shelf software solutions, which often don't meet the specific needs of their operations. The expenses can become prohibitive as more employees require access, and the software itself tends to be either too complex or insufficiently tailored to address the unique challenges faced by the business. \nRecognizing that each business is unique, Innovate Mobile advocates for custom software development as the solution. Our team is committed to creating bespoke software that not only streamlines your operations but also supports your growth in a cost-effective manner. Book a FREE meeting with us today to understand your software needs.",
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text('Our Services', style: Theme.of(context).textTheme.headline5),
                  // You can use GridView.builder here to create a grid of services if there are many
                  ListTile(
                    leading: Icon(Icons.web), // Use appropriate icons for each service
                    title: Text('Website Development'),
                    subtitle: Text("In today’s digital-first world, your website is the first interaction consumers have with your business. That's why nearly 95% of a user’s first impression relates to web design. It's also why web design services can have an immense impact on your company’s bottom line. Innovate Mobile is at the forefront of creating transformative web experiences that engage your audience, communicate your message clearly, and elevate your brand all at the same time.",),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text('Mobile App Development'),
                    subtitle: Text('In the digital era, mobile apps have become a crucial touchpoint for businesses to connect with their customers. They not only enhance the user experience but also offer a powerful platform for engaging with your audience, improving customer loyalty, and driving growth. Innovate Mobile specializes in crafting bespoke mobile applications that cater to the unique needs of your business and set you apart from the competition.',),
                  ),
                  ListTile(
                    leading: Icon(Icons.desktop_windows),
                    title: Text('Desktop Software Development'),
                    subtitle: Text('In an era where business efficiency and productivity are paramount, desktop software remains a critical tool for many organizations. Despite the rise of web and mobile applications, the demand for robust, reliable, and high-performance desktop software has not waned. Innovate Mobile specializes in developing bespoke desktop applications that are tailored to meet the unique requirements of your business, ensuring seamless operations and enhanced user experiences.',),
                  ),
                  SizedBox(height: 20),
                  Text('Our Tech Stack', style: Theme.of(context).textTheme.headline5),
                  TechnologyStackWidget(),
                  SizedBox(height: 20),
                  _contactBanner(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactBanner(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900], // Adjust the color to fit your theme
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Logo.jpg',
            height: 60, // Adjust the size as needed
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                color: Colors.white,
                onPressed: () {
                  // Logic to open Facebook page
                },
              ),
              SocialMediaButton.instagram(
                onTap: () {

                },
                color: Colors.white,
              ),
              SocialMediaButton.twitter(
                onTap: () {

                },
                color: Colors.white,
              ),
              // Add more social icons as needed
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Contact Us\nEmail: joseph@innovate-mobile.com\nPhone: +1 (470) 289-8360',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (await canLaunch("https://calendly.com/joseph-iu8/30min")) {
                await launch("https://calendly.com/joseph-iu8/30min");
              } else {
                throw "Could not launch 'https://calendly.com/joseph-iu8/30min'";
              }
            },
            child: Text('Get in Touch'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // Button background color
              onPrimary: Colors.blueGrey[900], // Button text color
            ),
          ),
        ],
      ),
    );
  }

}

class TechnologyStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            TechnologyDetail(
              technologyName: 'Figma',
              description: "Figma revolutionizes the way we design and prototype user interfaces and experiences. As a cloud-based design tool, it enables real-time collaboration among team members, allowing designers, developers, and stakeholders to work together seamlessly from anywhere in the world. With its intuitive interface and powerful features like auto layout, variant components, and extensive plugin support, Figma accelerates our design process, ensuring rapid iteration and innovation. It's our go-to tool for transforming ideas into tangible designs, facilitating a smooth transition from wireframes to high-fidelity prototypes.",
              imageName: 'assets/images/figma_logo.png',
            ),
            TechnologyDetail(
              technologyName: 'Flutter SDK',
              description:
              "Flutter is our chosen SDK for crafting high-quality, natively compiled applications for mobile, web, and desktop from a single codebase. Developed by Google, Flutter enables us to deliver beautiful, highly customizable user interfaces with its rich set of pre-designed widgets and powerful animation library. Its hot reload feature significantly boosts our productivity, allowing instant feedback for changes in code, which is essential for agile development practices. By leveraging Flutter, we ensure that our applications are not only visually appealing but also performant across all platforms, providing a unified user experience.",
              imageName: 'assets/images/flutter_logo.png',
            ),
            TechnologyDetail(
              technologyName: 'Firebase DB',
              description:
              "Firebase offers a comprehensive suite of backend services that empower us to develop, manage, and scale our applications more efficiently. From real-time databases and cloud storage solutions to authentication and analytics, Firebase provides everything we need to build robust and secure applications quickly. Its seamless integration with Flutter and other development platforms enables us to focus on creating exceptional user experiences without worrying about the underlying infrastructure. With Firebase, we can easily implement features like push notifications, user authentication, and real-time data synchronization, enhancing our app's functionality and engagement.",
              imageName: 'assets/images/firebase_logo.png',
            ),
          ],
        ),
      ),
    );
  }
}

class TechnologyDetail extends StatelessWidget {
  final String technologyName;
  final String description;
  final String imageName;

  const TechnologyDetail({
    Key? key,
    required this.technologyName,
    required this.description,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Image.asset(
            imageName,
            height: 80,
          ),
          SizedBox(height: 8),
          Text(
            technologyName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}