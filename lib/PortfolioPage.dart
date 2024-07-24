import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:social_media_buttons/social_media_buttons.dart'; // Ensure this package is added to your pubspec.yaml
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  final List<PortfolioItem> portfolioItems = [
    PortfolioItem(
      title: 'Android, iOS, & Web Development for Tytan Title LLC',
      description: "Tytan Title, a premier title insurance agency located in Atlanta, GA, recognized the evolving needs of their clientele in the fast-paced real estate market. In response, they partnered with our software development company to create a bespoke mobile application designed to streamline communication and enhance accessibility. This innovative app not only facilitates effortless contact between Tytan Title and its clients but also integrates seamlessly with Qualia, an external platform critical for managing real estate closing documents. By providing a direct link to Qualia through the app, we ensured that clients could easily access and handle their vital documents on-the-go, thereby significantly improving the efficiency and convenience of the closing process. Additionally, our ongoing collaboration with Tytan Title extends to the updating and maintenance of their website, ensuring that their digital presence is as robust and reliable as the services they offer.",
      imagePaths: [
        "assets/images/tytanlogo.png",
        "assets/images/TT_Android.png",
        "assets/images/TT_iOS.png",
        "assets/images/tytanweb.png",
        "assets/images/tytanweb2.png",
      ],
    ),
    PortfolioItem(
      title: 'Website Development for Real Long Law',
      description: "Real Long Law, a distinctive law firm based in Atlanta, GA, specializes in real estate law, corporate law, and civil litigation. Understanding the importance of a strong online presence in today's digital age, they sought the expertise of Innovate Mobile to rejuvenate and sustain their website. Our collaboration focused on creating a website that reflects Real Long Law's professionalism and breadth of services, ensuring it serves as a comprehensive resource for current and prospective clients. By enhancing the site's user experience and optimizing it for search engines, we aimed to improve accessibility and engagement, thereby facilitating a smoother client journey. Our ongoing partnership with Real Long Law ensures their website remains at the forefront of digital innovation, offering an intuitive, informative, and efficient online experience that mirrors their commitment to excellence in legal services.",
      imagePaths: [
        "assets/images/reallonglawlogo.png",
        "assets/images/RLLWeb1.png",
        "assets/images/RLLWeb2.png",
        "assets/images/RLLWeb3.png",
        "assets/images/RLLWeb4.png",
      ],
    ),
    PortfolioItem(
      title: 'Android App Development for Go Pro REA',
      description: "Go Pro Real Estate Academy (REA), a leading real estate licensing school, recognized the necessity of making their educational resources more accessible to aspiring real estate professionals. To achieve this, they collaborated with Innovate Mobile, leveraging our specialized expertise in mobile application development. The project's goal was to design and launch a user-friendly mobile app on the Android platform, aimed at providing students with an efficient and flexible learning experience. This app not only offers access to comprehensive course materials and licensing guides but also features interactive tools to enhance learning and retention. By introducing this app, Go Pro Real Estate Academy has significantly broadened its reach, enabling students to study anytime, anywhere, and thus fostering a more inclusive and adaptable educational environment. Our partnership with REA underscores Innovate Mobile's commitment to delivering innovative solutions that meet the evolving needs of educational providers and their students.",
      imagePaths: [
        "assets/images/goprologo.png",
        "assets/images/GPAndroid.png",
        "assets/images/GoProWeb.png",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Our Portfolio'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Welcome to Innovate Mobile, where innovation meets precision in software development."),
              ),
              SizedBox(height: 8),
              ...portfolioItems.map((item) => buildPortfolioItemWidget(item.title, item.imagePaths, item.description, context)).toList(),
              SizedBox(height: 15),
              _contactBanner(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPortfolioItemWidget(String title, List<String> imagePaths, String description, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 7),
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: isMobile ? 1 : 2.0,
                ),
                items: imagePaths.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(imagePath, fit: BoxFit.contain),
                      );
                    },
                  );
                }).toList(),
              ),
              Text(
                description,
                style: TextStyle(fontSize: isMobile ? 14 : 16),
                textAlign: TextAlign.justify,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactBanner(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Container(
      color: Colors.blueGrey[900],
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Logo.jpg',
            height: isMobile ? 40 : 60,
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
            style: TextStyle(color: Colors.white, fontSize: isMobile ? 14 : 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async{
              if (await canLaunch("https://calendly.com/joseph-iu8/30min")) {
                await launch("https://calendly.com/joseph-iu8/30min");
              } else {
                throw "Could not launch 'https://calendly.com/joseph-iu8/30min'";
              }
            },
            child: Text('Get in Touch'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.blueGrey[900],
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioItem {
  final String title;
  final String description;
  final List<String> imagePaths;

  PortfolioItem({
    required this.title,
    required this.description,
    required this.imagePaths,
  });
}