import 'package:blissiqadmin/Global/constants/AppColor.dart';
import 'package:blissiqadmin/Global/constants/CommonSizedBox.dart';
import 'package:blissiqadmin/Home/Attendance/AttendanceHistoryScreen.dart';
import 'package:blissiqadmin/Home/Company/CompanyScreen.dart';
import 'package:blissiqadmin/Home/Conversational/ConversationalScreen.dart';
import 'package:blissiqadmin/Home/Drawer/MainCategoriesPage.dart';
import 'package:blissiqadmin/Home/Drawer/MyDrawer.dart';
import 'package:blissiqadmin/Home/Grammer/GrammarScreen.dart';
import 'package:blissiqadmin/Home/Mentor/MentorScreen.dart';
import 'package:blissiqadmin/Home/School/SchoolScreen.dart';
import 'package:blissiqadmin/Home/Students/StudentScreen.dart';
import 'package:blissiqadmin/Home/Toddler/ToddlerEnglishScreen.dart';
import 'package:blissiqadmin/Home/TopPerformer/AttendanceHistoryScreen.dart';
import 'package:blissiqadmin/Home/Vocabulary/VocabularyScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' as getx;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  String selectedOption = "Student Attendance History";
}

class _HomePageState extends State<HomePage> {
  String profileImage = "assets/icons/icon_white.png";

  String selectedOption = "Student Attendance History";

  final List<Map<String, dynamic>> mainCategoryItems = [
    {
      "title": "Vocabulary",
      "imagePath": "assets/images/vocabulary.png",
      "gradient": LinearGradient(
        colors: [Colors.blue.shade200, Colors.blue.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      "title": "Toddler English",
      "imagePath": "assets/images/toddler-abc.png",
      "gradient": LinearGradient(
        colors: [Colors.green.shade200, Colors.green.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      "title": "Conversational",
      "imagePath": "assets/images/conversational.png",
      "gradient": LinearGradient(
        colors: [Colors.orange.shade200, Colors.orange.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      "title": "Grammar",
      "imagePath": "assets/images/grammer.png",
      "gradient": LinearGradient(
        colors: [Colors.purple.shade200, Colors.purple.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
  ];

  final List<Map<String, dynamic>> userList = [
    {
      "title": "Mentors",
      "imagePath": "assets/icons/mentor.png",
      "gradient": LinearGradient(
        colors: [Colors.red.shade200, Colors.redAccent.shade200],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      "title": "Companies",
      "imagePath": "assets/icons/Company.png",
      "gradient": LinearGradient(
        colors: [Colors.blueAccent.shade100, Colors.blue.shade200],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      "title": "Schools",
      "imagePath": "assets/icons/School.png",
      "gradient": LinearGradient(
        colors: [Colors.deepOrange.shade200, Colors.deepOrange.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      "title": "Students",
      "imagePath": "assets/icons/students.png",
      "gradient": LinearGradient(
        colors: [Colors.pinkAccent.shade100, Colors.pinkAccent.shade200],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check screen size for responsiveness
          bool isWideScreen = constraints.maxWidth > 800;

          return Row(
            children: [
              // Always visible drawer for wide screens
              if (isWideScreen)
                Container(
                  width: 250,
                  color: Colors.orange.shade100,
                  child: MyDrawer(),
                ),
              Expanded(
                child: Scaffold(
                  appBar: isWideScreen
                      ? null // Remove AppBar if the drawer is always visible
                      : AppBar(
                          title: const Text('Dashboard'),
                          scrolledUnderElevation: 0,
                          backgroundColor: Colors.blue.shade100,
                          actions: [
                            IconButton(
                              icon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                // Handle notifications
                              },
                            ),
                          ],
                        ),
                  drawer:
                      isWideScreen ? null : Drawer(child: MyDrawer()),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16),
                    child: _buildMainContent(constraints),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMainContent(BoxConstraints constraints) {
    int crossAxisCount = constraints.maxWidth > 900
        ? 2
        : constraints.maxWidth > 600
            ? 3
            : 2;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.46,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recent Accounts Section
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recent Accounts",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        boxH10(),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: userList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 2,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Handle navigation
                                  switch (index) {
                                    case 0:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MentorScreen()),
                                      );
                                      break;
                                    case 1:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompanyScreen()),
                                      );
                                      break;
                                    case 2:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SchoolScreen()),
                                      );
                                      break;
                                    case 3:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StudentScreen()),
                                      );
                                      break;
                                  }
                                },
                                child: Card(
                                  elevation: 0.8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: userList[index]["gradient"],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            userList[index]["imagePath"],
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                          ),
                                          Text(
                                            userList[index]["title"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth >
                                                      1200
                                                  ? 18
                                                  : constraints.maxWidth > 800
                                                      ? 17
                                                      : constraints.maxWidth >
                                                              600
                                                          ? 16
                                                          : 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  boxW20(),

                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Main Categories",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        boxH10(),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: mainCategoryItems.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 2,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Handle navigation
                                  switch (index) {
                                    case 0:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VocabularyScreen()),
                                      );
                                      break;
                                    case 1:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainCategoriesPage()),
                                      );
                                      break;
                                    case 2:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ConversationalScreen()),
                                      );
                                      break;
                                    case 3:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GrammarScreen()),
                                      );
                                      break;
                                  }
                                },
                                child: Card(
                                  elevation: 0.8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: mainCategoryItems[index]
                                          ["gradient"],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            mainCategoryItems[index]
                                                ["imagePath"],
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                          ),
                                          Text(
                                            mainCategoryItems[index]["title"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: constraints.maxWidth >
                                                      1200
                                                  ? 18
                                                  : constraints.maxWidth > 800
                                                      ? 17
                                                      : constraints.maxWidth >
                                                              600
                                                          ? 16
                                                          : 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Student Data",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            boxH10(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCard(
                        "Student Attendance History",
                        Colors.orange.shade100,
                        Colors.orangeAccent,
                        () {
                          setState(() {
                            selectedOption = "Student Attendance History";
                          });
                        },
                      ),
                      _buildCard(
                        "Top Performing Students",
                        Colors.orange.shade100,
                        Colors.orangeAccent,
                        () {
                          setState(() {
                            selectedOption = "Top Performing Students";
                          });
                        },
                      ),
                    ],
                  ),
                  boxH20(),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.orangeAccent, width: 1),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: selectedOption == "Student Attendance History"
                        ? _buildAttendanceTable()
                        : _buildTopPerformersTable(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, Color backgroundColor, Color borderColor,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0.3,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 180,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 0.9),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Student Attendance History",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: DataTable(
              border: TableBorder.all(color: Colors.grey.shade300),
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Attendance')),
              ],
              rows: List<DataRow>.generate(
                10,
                (index) => DataRow(cells: [
                  DataCell(Text('STU-${index + 1}')),
                  DataCell(Text('Student ${index + 1}')),
                  DataCell(Text('2024-12-${index + 1}')),
                  DataCell(Text(index % 2 == 0 ? 'Present' : 'Absent')),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopPerformersTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Performing Students",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: DataTable(
              border: TableBorder.all(color: Colors.grey.shade300),
              columns: const [
                DataColumn(label: Text('Rank')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Score')),
                DataColumn(label: Text('Grade')),
              ],
              rows: List<DataRow>.generate(
                10,
                (index) => DataRow(cells: [
                  DataCell(Text('#${index + 1}')),
                  DataCell(Text('Student ${index + 1}')),
                  DataCell(Text('${90 + index}')),
                  DataCell(Text('A')),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
