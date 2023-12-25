import 'package:demo_task/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Declaration
  List<Map<String, dynamic>> categories = [
    {
      "image": Assets.ic_accounting,
      "title": "Accounting",
      "courses": "20 Courses "
    },
    {"image": Assets.ic_biology, "title": "Biology", "courses": "15 Courses "},
    {
      "image": Assets.ic_photography,
      "title": "Photography ",
      "courses": "25 Courses "
    },
    {
      "image": Assets.ic_marketing,
      "title": "Marketing ",
      "courses": "18 Courses "
    },
    {
      "image": Assets.ic_accounting,
      "title": "Accounting",
      "courses": "20 Courses "
    },
    {"image": Assets.ic_biology, "title": "Biology", "courses": "15 Courses "},
    {
      "image": Assets.ic_photography,
      "title": "Photography ",
      "courses": "25 Courses "
    },
    {
      "image": Assets.ic_marketing,
      "title": "Marketing ",
      "courses": "18 Courses "
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 13,
              ),
              // Card view
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffE77711)),
                padding: const EdgeInsets.all(26),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Greeting message
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                text: "Hello,\n",
                                style: GoogleFonts.dmSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                children: [
                                  TextSpan(
                                    text: "good Morning",
                                    style: GoogleFonts.dmSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  )
                                ]),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        //Notification
                        GestureDetector(
                          onTap: onClickNotification,
                          child: Container(
                            width: 41,
                            height: 41,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(.30),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(Assets.ic_notification),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    // Search Textfield
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: border(),
                                enabledBorder: border(),
                                focusedBorder: border(),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.grey.shade500,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "All",
                                style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.grey.shade500),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                                color: Colors.grey.shade500,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Explore Categories",
                        maxLines: 1,
                        style: GoogleFonts.dmSans(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    TextButton(
                      onPressed: onPressSeeAll,
                      child: Text(
                        "See all",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffE77711),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              //Categories grid view
              GridView.builder(
                itemCount: categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (_, index) {
                  var data = categories[index];
                  return listTile(data);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  //Custom UI
  OutlineInputBorder border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      );

  Widget listTile(data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              blurRadius: 25,
              offset: const Offset(8, 4),
              color: Colors.black.withOpacity(.08))
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              data['image'],
              height: 84,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            data['title'],
            maxLines: 1,
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            data['courses'],
            maxLines: 1,
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 13),
          ),
        ],
      ),
    );
  }

  //Custom Actions
  void onClickNotification() {}

  void onPressSeeAll() {}
}
