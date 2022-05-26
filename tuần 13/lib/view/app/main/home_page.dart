import 'package:chat_messanger_ui/constant/data.dart';
import 'package:chat_messanger_ui/resources/assets/fonts_assets.dart';
import 'package:chat_messanger_ui/resources/assets/icons_assets.dart';

import 'package:flutter/material.dart';

import '../../../resources/theme/colors.dart';
import 'chat_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Chats",
                    style: TextStyle(fontSize: FontsSizeAssets.fs22, fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: const Image(
                    image: AssetImage(
                      IconsAssets.cameraLogo,
                    ),
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.grey,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: const Image(
                    image: AssetImage(
                      IconsAssets.editLogo,
                    ),
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.grey,
                  ),
                )
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Icon(
                  Icons.search,
                  color: ColorManager.greySearch,
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: FontsSizeAssets.fs18,
                    color: ColorManager.greySearch,
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: ColorManager.grey,
              borderRadius: BorderRadius.circular(25)),
        ),
        const SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.grey,
                        ),
                        child: const Image(
                          image: AssetImage(
                            IconsAssets.meetingLogo,
                          ),
                          fit: BoxFit.contain,
                          width: 30,
                          height: 30,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: Align(
                          child: Column(
                        children: const [
                          Text(
                            'Create',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Room',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
              Row(
                  children: List.generate(userStories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: Stack(
                          children: <Widget>[
                            userStories[index]['story']
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ColorManager.blueAccent,
                                            width: 3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    userStories[index]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                userStories[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                            userStories[index]['online']
                                ? Positioned(
                                    top: 48,
                                    left: 52,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: ColorManager.green,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorManager.white,
                                              width: 3)),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 75,
                        child: Align(
                            child: Text(
                          userStories[index]['name'],
                          overflow: TextOverflow.ellipsis,
                        )),
                      )
                    ],
                  ),
                );
              }))
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: List.generate(userMessages.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatDetailPage(
                              user: userMessages[index]['name'],
                              imguser: userMessages[index]['img'],
                              online: userMessages[index]['online'],
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: Stack(
                        children: <Widget>[
                          userMessages[index]['story']
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: ColorManager.blueAccent,
                                          width: 3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  userMessages[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              userMessages[index]['img']),
                                          fit: BoxFit.cover)),
                                ),
                          userMessages[index]['online']
                              ? Positioned(
                                  top: 48,
                                  left: 52,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: ColorManager.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ColorManager.white,
                                            width: 3)),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userMessages[index]['name'],
                          style: const TextStyle(
                              fontSize: FontsSizeAssets.fs17, fontWeight: FontWeight.w500,),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 135,
                          child: Text(
                            userMessages[index]['message'] +
                                " - " +
                                userMessages[index]['created_at'],
                            style: TextStyle(
                              fontSize: FontsSizeAssets.fs15,
                              color: ColorManager.black.withOpacity(0.8),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    ));
  }
}
