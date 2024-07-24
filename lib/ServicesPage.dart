import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Services'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _serviceCard(
              context,
              'Website Development',
              'assets/images/website_development.png',
              "In today’s digital-first world, your website is the first interaction consumers have with your business. That's why nearly 95% of a user’s first impression relates to web design. It's also why web design services can have an immense impact on your company’s bottom line. Innovate Mobile is at the forefront of creating transformative web experiences that engage your audience, communicate your message clearly, and elevate your brand all at the same time. \nWhy Choose Innovate Mobile for Your Website Development Needs? \n- Customized Design to Fit Your Brand: We understand that your website is a reflection of your brand. Our team collaborates with you to create a custom design that suits your unique brand identity and meets your specific business needs. We ensure that your website stands out in the digital sea, not as just another website, but as a powerful expression of your business ethos. \n- Responsive and Mobile-Friendly: With over half of global website traffic coming from mobile devices, we ensure your website delivers a flawless experience across all devices. Our responsive designs guarantee that your site looks and functions great on desktops, tablets, and smartphones, enhancing user experience and improving SEO rankings.\n- SEO Optimized Websites: What's a beautiful website if it can't be found? Our websites are built with SEO in mind, ensuring that you rank higher on Google and get noticed by your target audience. From fast loading times to keyword-optimized content, every aspect of your website is fine-tuned to boost your online visibility. \n- Robust Security: Security is non-negotiable. We implement the latest security measures to protect your site from online threats. Regular updates and backups, secure hosting, and SSL certificates are just a few ways we keep your website and your visitors' data safe. \n- User-Centric Design: We place a strong emphasis on creating intuitive, easy-to-navigate websites that enhance user engagement and retention. Our user-centric design approach focuses on delivering a seamless experience that encourages visitors to take action, be it making a purchase, signing up for a newsletter, or contacting your team. \n- Ongoing Support and Maintenance: Our relationship doesn’t end with the launch of your website. We offer ongoing support and maintenance to ensure your website evolves with your business. From updating content to incorporating new features, we're here to support your digital growth every step of the way. \nIn a landscape that's constantly evolving, having a partner like Innovate Mobile can make all the difference. We don’t just build websites; we build digital experiences that empower businesses to achieve their goals. Let us help you make a lasting impression online with a website that’s uniquely yours. \nReady to start your project? Contact us today to schedule a free consultation. Together, we can create a website that not only looks great but also drives results.",
            ),
            _serviceCard(
              context,
              'Mobile App Development',
              'assets/images/mobile_app_development.png',
              "In the digital era, mobile apps have become a crucial touchpoint for businesses to connect with their customers. They not only enhance the user experience but also offer a powerful platform for engaging with your audience, improving customer loyalty, and driving growth. Innovate Mobile specializes in crafting bespoke mobile applications that cater to the unique needs of your business and set you apart from the competition.\n Why Choose Innovate Mobile for Your Mobile App Development?\n-Expertise Across Platforms: Whether you're targeting iOS, Android, or both, our team of seasoned developers brings in-depth expertise to deliver high-performance, feature-rich mobile applications. We leverage the latest technologies and frameworks to ensure your app provides a seamless, intuitive experience across all devices.\n-Custom Solutions Tailored to Your Business: We believe in building solutions that reflect your business goals and meet your users' needs. Our approach involves a deep dive into your business model, target audience, and industry trends to design and develop a mobile app that aligns perfectly with your strategic objectives.\n-Enhanced User Engagement: A mobile app offers a direct channel to your customers. With personalized content, push notifications, and user-friendly interfaces, we ensure your app keeps your audience engaged, informed, and loyal to your brand.\n-Boost Your Brand Visibility: A mobile app is a constant reminder of your brand on your customers' devices. Our strategic app design and development practices ensure your app stands out in the crowded app stores, enhancing your brand's visibility and accessibility.\n-Data-Driven Insights: With integrated analytics, your mobile app becomes a valuable source of user data and insights. We help you leverage this data to understand user behavior, refine your marketing strategies, and make informed decisions to drive growth.\n-Robust Security Measures: Protecting your data and your users' privacy is paramount. We incorporate advanced security features and protocols to ensure your app is secure, reliable, and compliant with the latest data protection regulations.\n-Continuous Support and Evolution: The digital landscape is constantly evolving, and so should your mobile app. From initial launch to ongoing updates, our team provides continuous support and maintenance to ensure your app remains relevant, competitive, and on the cutting edge of technology.\nInnovate Mobile is more than just a mobile app development company; we are your partners in digital transformation. Our mission is to transform your vision into a dynamic mobile app that not only achieves your business goals but also offers a delightful experience to your users.\nReady to bring your app idea to life? Contact us today for a free consultation. Let's build a mobile app that propels your business into the future.",
            ),
            _serviceCard(
              context,
              'Desktop Software Development',
              'assets/images/desktop_software_development.png',
              "In an era where business efficiency and productivity are paramount, desktop software remains a critical tool for many organizations. Despite the rise of web and mobile applications, the demand for robust, reliable, and high-performance desktop software has not waned. Innovate Mobile specializes in developing bespoke desktop applications that are tailored to meet the unique requirements of your business, ensuring seamless operations and enhanced user experiences.\nWhy Opt for Innovate Mobile for Your Desktop Software Development Needs?\n-Tailored Solutions: We understand that one size does not fit all. Our approach is to create custom desktop software that is specifically designed to address your business challenges, integrate with your existing workflows, and support your unique business processes. This ensures a solution that is not just effective but also a natural fit for your organization.\n-Cutting-edge Technology: At Innovate Mobile, we leverage the latest in desktop software development technologies to ensure your application is not only relevant today but also future-proof. Whether you need a solution for Windows, macOS, or Linux, our developers have the expertise to deliver high-quality applications using the most appropriate and efficient technologies.\n-Enhanced Performance and Reliability: Desktop applications offer superior performance and reliability compared to their web counterparts, especially for data-intensive and processor-heavy tasks. We focus on optimizing the performance of your software to ensure it can handle the demands of your operations without compromising speed or efficiency.\n-Security and Data Protection: With cyber threats on the rise, security is at the forefront of our development process. Desktop applications developed by Innovate Mobile are built with the highest security standards, ensuring your data is protected and your operations are compliant with relevant regulations.\n-Seamless Integration: Our desktop software solutions are designed to seamlessly integrate with your existing IT infrastructure, including hardware peripherals, internal systems, and third-party applications. This ensures a cohesive ecosystem that enhances productivity and reduces the need for manual interventions.\n-Ongoing Support and Maintenance: Technology evolves, and so do business needs. We provide comprehensive support and maintenance services to ensure your desktop software remains up-to-date, secure, and aligned with your evolving business requirements.\n-Empower Your Workforce: A well-designed desktop application can significantly enhance your team's productivity and job satisfaction. By automating routine tasks, providing intuitive interfaces, and enabling offline access, we empower your workforce to focus on what they do best.\nInnovate Mobile is dedicated to transforming your business operations with custom desktop software that drives efficiency, enhances security, and offers unparalleled user experiences. Our commitment to quality, innovation, and customer satisfaction makes us the ideal partner for your desktop software development needs.\nReady to explore how custom desktop software can revolutionize your business? Contact us today to schedule a free consultation. Let’s create a solution that not only meets your current needs but also positions you for future success.",
            ),
            _contactBanner(context),
          ],
        ),
      ),
    );
  }

  Widget _serviceCard(BuildContext context, String title, String imagePath, String description) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        if (await canLaunch("https://calendly.com/joseph-iu8/30min")) {
                          await launch("https://calendly.com/joseph-iu8/30min");
                        } else {
                          throw "Could not launch 'https://calendly.com/joseph-iu8/30min'";
                        }
                      },
                      child: Text('Schedule a Meeting', style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
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
