import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:innovate_mobile_website/AboutPage.dart';
import 'package:innovate_mobile_website/ContactPage.dart';
import 'package:innovate_mobile_website/PortfolioPage.dart';
import 'package:innovate_mobile_website/ServicesPage.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyB71nUMV4QHh0Mkorr68wVorHP9AGVet_Q",
        authDomain: "innovate-mobile-2e55b.firebaseapp.com",
        projectId: "innovate-mobile-2e55b",
        storageBucket: "innovate-mobile-2e55b.appspot.com",
        messagingSenderId: "674534152097",
        appId: "1:674534152097:web:3400e924182240a39c9de0",
        measurementId: "G-2JBQ2MNSPD"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  AppBar responsiveAppBar(BuildContext context) {
    // Screen width check
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen = screenWidth > 600; // Define breakpoint for wide screen

    List<Widget> actionWidgets = [
      _navButton('Services', context),
      _navButton('Portfolio', context),
      _navButton('About', context),
      _navButton('Contact', context),
    ];

    return AppBar(
      backgroundColor: Colors.blue,
      title: Text('Innovate Mobile'),
      actions: isWideScreen
          ? actionWidgets.expand((widget) => [widget, SizedBox(width: 5,)]).toList()
          : [
        PopupMenuButton<String>(
          onSelected: (value) {
            // Implement navigation logic based on selected menu item
            navigateToPage(value, context);
          },
          itemBuilder: (BuildContext context) {
            return [
              'Services',
              'Portfolio',
              'About',
              'Contact',
            ].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  void navigateToPage(String value, BuildContext context) {
    // Navigation logic based on the value
    // Example:
    switch (value) {
      case 'Services':
        Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
        break;
      case 'Portfolio':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioPage()));
        break;
      case 'About':
        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
        break;
      case 'Contact':
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
        break;
    // Add cases for other values
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: responsiveAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ctaSection(context),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.lightBlue,
              child: Center(
                child: Text(
                  'Our Services',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: <Widget>[
                _serviceCard(
                  'Website Development',
                  'assets/images/website_development.png',
                  "In today’s digital-first world, your website is the first interaction consumers have with your business. That's why nearly 95% of a user’s first impression relates to web design. It's also why web design services can have an immense impact on your company’s bottom line. Innovate Mobile is at the forefront of creating transformative web experiences that engage your audience, communicate your message clearly, and elevate your brand all at the same time.",
                  context,
                ),
                _serviceCard(
                  'Mobile App Development',
                  'assets/images/mobile_app_development.png',
                  'In the digital era, mobile apps have become a crucial touchpoint for businesses to connect with their customers. They not only enhance the user experience but also offer a powerful platform for engaging with your audience, improving customer loyalty, and driving growth. Innovate Mobile specializes in crafting bespoke mobile applications that cater to the unique needs of your business and set you apart from the competition.\n',
                  context,
                ),
                _serviceCard(
                  'Desktop Software Development',
                  'assets/images/desktop_software_development.png',
                  'In an era where business efficiency and productivity are paramount, desktop software remains a critical tool for many organizations. Despite the rise of web and mobile applications, the demand for robust, reliable, and high-performance desktop software has not waned. Innovate Mobile specializes in developing bespoke desktop applications that are tailored to meet the unique requirements of your business, ensuring seamless operations and enhanced user experiences.',
                  context,
                ),
              ],
            ),
            ourProcessSection(),
            Column(
              children: <Widget> [
                _PortfolioItem(
                  'Android, iOS, & Web Development for Tytan Title LLC',
                  'assets/images/tytanlogo.png',
                  "Tytan Title, a premier title insurance agency located in Atlanta, GA, recognized the evolving needs of their clientele in the fast-paced real estate market. In response, they partnered with our software development company to create a bespoke mobile application designed to streamline communication and enhance accessibility. This innovative app not only facilitates effortless contact between Tytan Title and its clients but also integrates seamlessly with Qualia, an external platform critical for managing real estate closing documents. By providing a direct link to Qualia through the app, we ensured that clients could easily access and handle their vital documents on-the-go, thereby significantly improving the efficiency and convenience of the closing process. Additionally, our ongoing collaboration with Tytan Title extends to the updating and maintenance of their website, ensuring that their digital presence is as robust and reliable as the services they offer.",
                  context,
                ),
                _PortfolioItem(
                  'Website Development for Real Long Law',
                  'assets/images/reallonglawlogo.png',
                  "Real Long Law, a distinctive law firm based in Atlanta, GA, specializes in real estate law, corporate law, and civil litigation. Understanding the importance of a strong online presence in today's digital age, they sought the expertise of Innovate Mobile to rejuvenate and sustain their website. Our collaboration focused on creating a website that reflects Real Long Law's professionalism and breadth of services, ensuring it serves as a comprehensive resource for current and prospective clients. By enhancing the site's user experience and optimizing it for search engines, we aimed to improve accessibility and engagement, thereby facilitating a smoother client journey. Our ongoing partnership with Real Long Law ensures their website remains at the forefront of digital innovation, offering an intuitive, informative, and efficient online experience that mirrors their commitment to excellence in legal services.",
                  context,
                ),
                _PortfolioItem(
                  'Android App Development for Go Pro REA',
                  'assets/images/goprologo.png',
                  "Go Pro Real Estate Academy (REA), a leading real estate licensing school, recognized the necessity of making their educational resources more accessible to aspiring real estate professionals. To achieve this, they collaborated with Innovate Mobile, leveraging our specialized expertise in mobile application development. The project's goal was to design and launch a user-friendly mobile app on the Android platform, aimed at providing students with an efficient and flexible learning experience. This app not only offers access to comprehensive course materials and licensing guides but also features interactive tools to enhance learning and retention. By introducing this app, Go Pro Real Estate Academy has significantly broadened its reach, enabling students to study anytime, anywhere, and thus fostering a more inclusive and adaptable educational environment. Our partnership with REA underscores Innovate Mobile's commitment to delivering innovative solutions that meet the evolving needs of educational providers and their students.",
                  context,
                ),
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioPage()));
              },
              child: Text("See More", style: TextStyle(color: Colors.black)),
            ),
            CustomTestimonialsSection(),
            _contactBanner(context),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String title, BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<ContinuousRectangleBorder>(
            ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)
            ),
          )
      ),
      onPressed: () {
        // Navigate based on title
        switch (title) {
          case 'Services':
            Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
            break;
          case 'Portfolio':
            Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioPage()));
            break;
          case 'About':
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
            break;
          case 'Contact':
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
            break;
        // Add cases for other titles as needed
        }
      },
      child: Text(title),
    );
  }


  Widget _ctaSection(BuildContext context) {
    // Get the screen size
    var screenSize = MediaQuery.of(context).size;

    // Determine size adjustments based on the screen width
    double textContainerWidth = screenSize.width > 600 ? screenSize.width / 3 : screenSize.width * 0.8;
    double fontSize = screenSize.width > 600 ? 24 : 18; // Adjust font size for smaller screens
    double buttonHorizontalPadding = screenSize.width > 600 ? 30 : 20;
    double buttonVerticalPadding = screenSize.width > 600 ? 15 : 10;
    double containerPadding = screenSize.width > 600 ? 20 : 10;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ctasection.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.darken), // Add a dark overlay to improve text visibility
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8), // Semi-transparent background for the text container
              borderRadius: BorderRadius.circular(10), // Rounded corners for the container
            ),
            width: textContainerWidth,
            child: Text(
              'Schedule Your Free Consultation\nEnhance your business operations through tailored software solutions.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Improved text color for visibility
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.grey.withOpacity(0.8), // Text shadow for depth
                  ),
                ],
              ),
            ),
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
            child: Text('Schedule Now', style: TextStyle(fontSize: fontSize - 6)),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Button background color
              onPrimary: Colors.white, // Text color
              padding: EdgeInsets.symmetric(horizontal: buttonHorizontalPadding, vertical: buttonVerticalPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5, // Add elevation for a 3D effect
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(String title, String imagePath, String description, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.6,
        width: (MediaQuery.of(context).size.width / 3) - 5,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 7,),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left, // Align text to the left for consistency
              ),
              SizedBox(
                height: 140, // Fixed height for images
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16),
                maxLines: 15, // Ensures text does not exceed 3 lines
                overflow: TextOverflow.ellipsis, // Adds ellipsis for text that exceeds the limit
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
                },
                child: Text("Learn More", style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 7,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _PortfolioItem(String title, String imagePath, String description, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 7,),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left, // Align text to the left for consistency
              ),
              SizedBox(
                height: 140, // Fixed height for images
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16),
                maxLines: 15, // Ensures text does not exceed 3 lines
                overflow: TextOverflow.ellipsis, // Adds ellipsis for text that exceeds the limit
              ),
              SizedBox(height: 10,),
              SizedBox(height: 7,),
            ],
          ),
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
            onPressed: () async{
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

  Widget ourProcessSection() {
    // Define a list of steps for your process
    final List<Map<String, dynamic>> steps = [
      {
        'title': 'Discover',
        'description': 'We start by understanding your business and project goals.',
        'icon': Icons.search,
      },
      {
        'title': 'Design',
        'description': 'We design a solution tailored to your specific needs.',
        'icon': Icons.brush,
      },
      {
        'title': 'Develop',
        'description': 'Our team builds the solution using agile methodologies.',
        'icon': Icons.build,
      },
      {
        'title': 'Deploy',
        'description': 'We deploy the software and ensure everything runs smoothly.',
        'icon': Icons.cloud_upload,
      },
      {
        'title': 'Deliver',
        'description': 'We deliver the project and continue to offer support and maintenance.',
        'icon': Icons.check_circle_outline,
      },
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.lightBlue,
            child: Center(
              child: Text(
                'Our Process',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Generate the list of widgets with arrows in between each ListTile
          ...List.generate(steps.length * 2 - 1, (index) {
            if (index % 2 == 0) {
              // Even indices represent the steps
              return Card(
                elevation: 4,
                margin: EdgeInsets.only(bottom: 20),
                child: ListTile(
                  leading: Icon(steps[index ~/ 2]['icon'], size: 36, color: Colors.blue),
                  title: Text(steps[index ~/ 2]['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text(steps[index ~/ 2]['description']),
                ),
              );
            } else {
              // Odd indices represent the arrows
              return Column(
                children: [
                  Icon(Icons.arrow_downward, color: Colors.blue),
                  SizedBox(height: 10,),
                ],
              );
            }
          }),
        ],
      ),
    );
  }


}

class CustomTestimonialsSection extends StatefulWidget {
  @override
  _CustomTestimonialsSectionState createState() => _CustomTestimonialsSectionState();
}

class _CustomTestimonialsSectionState extends State<CustomTestimonialsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  final List<Map<String, String>> testimonials = [
    {
      "title": "Tytan Title LLC",
      "subtitle": "Tytan Title hired Innovate Mobile to develop an app for our company for customers of Tytan to use to upload various documents, manage their pending real estate closing, and otherwise have visibility on the work done on a pending real estate closing file.  The app was for both the Google Play store and the Apple Store.  Innovate Mobile completed the development of the app and worked with both companies to get the app approved and published on the respective stores.  Tytan Title is pleased it chose Innovate Mobile to develop its apps and would recommend Innovate Mobile to anyone who is looking to have an app developed for their business.",
      "imagePath": "assets/images/Logo.jpg", // Update with actual image path
      "service": "Service: Mobile App Development (Android & iOS) + Website Development"
    },
    {
      "title": "Go Pro REA",
      "subtitle": "Go Pro Real Estate Academy hired Innovate Mobile to develop an app for our company for students to use to take the real estate license courses Go Pro offers.  Innovate Mobile was asked to develop an app for both the Google Play store and the Apple store and Innovate Mobile did not disappoint.  The app has been published on the Google Play store and has been submitted to the Apple Store and should be completed soon.  Go Pro is pleased with the work Innovate Mobile has done on this project to help Go Pro make access to its real estate curriculum more accessible.",
      "imagePath": "assets/images/Logo.jpg", // Update with actual image path
      "service": "Service: Android App Development"
    },
    // Add more testimonials as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Client Testimonials',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: testimonials.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(testimonials[index]["imagePath"]!),
                              ),
                              title: Text(testimonials[index]["title"]!),
                              subtitle: Text(testimonials[index]["service"]!, style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                testimonials[index]["subtitle"]!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                    onPressed: _currentPage > 0
                        ? () {
                      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                    }
                        : null,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                    onPressed: _currentPage < testimonials.length - 1
                        ? () {
                      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                    }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioItem2 {
  final String title;
  final String description;
  final String imagePath;

  PortfolioItem2({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}