import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/people/controller/people_controller.dart';
import 'package:provider/provider.dart';

class PeopleDetailsScreen extends StatelessWidget {
  static const routeName = '/peopleDetailScreen';
  const PeopleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final peopleCtrlRead = context.read<PeopleController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(peopleCtrlRead.selectedPeople.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 12.0.hp,
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 1.0.wp,
                  vertical: 1.0.hp,
                ),
                child: ListView(
                  children: [
                    Text(
                      peopleCtrlRead.selectedPeople.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 4.50.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.hp),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_history,
                        ),
                        SizedBox(width: 1.5.wp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Currnet location (${peopleCtrlRead.selectedPeople.distance}km away)",
                                style: TextStyle(
                                  fontSize: 4.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 0.2.hp),
                              Text(
                                peopleCtrlRead.selectedPeople.location,
                                style: TextStyle(
                                  fontSize: 3.5.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.hp),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.work,
                        ),
                        SizedBox(width: 1.5.wp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "What I Do?",
                                style: TextStyle(
                                  fontSize: 4.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 0.2.hp),
                              Text(
                                peopleCtrlRead.selectedPeople.whatIDo,
                                style: TextStyle(
                                  fontSize: 3.5.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.hp),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.work,
                        ),
                        SizedBox(width: 1.5.wp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Work At",
                                style: TextStyle(
                                  fontSize: 4.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 0.2.hp),
                              Text(
                                peopleCtrlRead.selectedPeople.workAt,
                                style: TextStyle(
                                  fontSize: 3.5.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.hp),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.people,
                        ),
                        SizedBox(width: 1.5.wp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                  fontSize: 4.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 0.2.hp),
                              Text(
                                peopleCtrlRead.selectedPeople.status,
                                style: TextStyle(
                                  fontSize: 3.5.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.hp),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.interests,
                        ),
                        SizedBox(width: 1.5.wp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Intrests",
                                style: TextStyle(
                                  fontSize: 4.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 0.2.hp),
                              Text(
                                peopleCtrlRead.selectedPeople.intrests,
                                style: TextStyle(
                                  fontSize: 3.5.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(
          Icons.chat_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
