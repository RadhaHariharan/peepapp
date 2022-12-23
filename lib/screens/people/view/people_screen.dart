import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/people/controller/people_controller.dart';
import 'package:peepapp/screens/people/view/people_detail.dart';
import 'package:provider/provider.dart';

class PeopleScreen extends StatelessWidget {
  static String routeName = "/peopleScreen";
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final peopleCtrlWatch = context.watch<PeopleController>();
    return Container(
      child: Column(
        children: [
          Container(
            height: 2.0.hp,
            padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
            margin: EdgeInsets.symmetric(vertical: 0.75.hp),
            child: TextFormField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.only(top: 0.1.hp, left: 1.0.wp),
                hintText: "Search people here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.wp),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.wp),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.wp),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: peopleCtrlWatch.peoples.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  peopleCtrlWatch.choosePeople(
                    peopleCtrlWatch.peoples[i],
                  );
                  Navigator.pushNamed(context, PeopleDetailsScreen.routeName);
                },
                child: Container(
                  height: 2.5.hp,
                  padding: EdgeInsets.only(bottom: 0.5.hp),
                  margin: EdgeInsets.only(left: 0.5.wp, right: 1.0.wp),
                  child: Row(
                    children: [
                      Container(
                        height: 5.0.wp,
                        width: 5.0.wp,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/bg.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.5.wp,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              peopleCtrlWatch.peoples[i].name.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 4.25.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              peopleCtrlWatch.peoples[i].whatIDo,
                              style: TextStyle(
                                fontSize: 3.75.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${peopleCtrlWatch.peoples[i].distance} km away",
                        style: TextStyle(
                          fontSize: 3.25.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
