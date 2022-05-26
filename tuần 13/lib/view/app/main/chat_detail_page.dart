import 'dart:io';

import 'package:chat_messanger_ui/controller/apiconstant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as g;
import 'package:http_parser/http_parser.dart';

import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../../constant/constant.dart';
import '../../../controller/con_messange.dart';
import '../../../controller/con_socket.dart';
import '../../../model/mess_model.dart';
import '../../../resources/assets/fonts_assets.dart';
import '../../../resources/assets/icons_assets.dart';
import '../../../resources/theme/colors.dart';
import 'home_page.dart';

class ChatDetailPage extends StatefulWidget {
  final String user, imguser;
  final bool online;
  const ChatDetailPage(
      {required this.user,
      required this.imguser,
      required this.online,
      Key? key})
      : super(key: key);
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState(
        user: user,
        imguser: imguser,
        online: online,
      );
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _sendMessageController = TextEditingController();
  String user, imguser;
  bool online;
  List<Asset> images = <Asset>[];
  Dio dio = Dio();
  _ChatDetailPageState({
    required this.user,
    required this.imguser,
    required this.online,
  });

  XFile? photo;
  XFile? camera;
  String? messageType;
  Future selectImg() async {
    photo = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future selectCamera() async {
    camera = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: AssetThumb(
            asset: asset,
            width: 100,
            height: 100,
          ),
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  void initState() {
    super.initState();
    getData(dio);
    conSocket(chatController);
  }

  _saveCamera(XFile camera) async {
    List<int> imageBytes = File(camera.path).readAsBytesSync();

    MultipartFile multipartFile = MultipartFile.fromBytes(
      imageBytes,
      filename: camera.name,
      contentType: MediaType("image", 'png'),
    );
    FormData formDataCamera = FormData.fromMap({
      "image": multipartFile,
    });
    await dio.post(
        ApiConstant().baseUrl + ApiConstant().server + ApiConstant().upLoadUrl,
        data: formDataCamera);


    var messageJson = {
      'message': camera.name,
      'sentByMe': user,
      'sentByYou': user,
      "messageType": 'img',
    };
    var message = {
      'id': 1,
      'message': camera.name,
      'sentByMe': user,
      'sentByYou': user,
      "messageType": 'img',
    };
    socket.emit('message', messageJson);
    chatController.chatMess.add(Message.fromJson(message));
  }

  _saveImage(List<Asset> images) async {
    //if (images != null) {
    for (var i = 0; i < images.length; i++) {
      ByteData byteData = await images[i].getByteData();
      List<int> imageData = byteData.buffer.asUint8List();

      MultipartFile multipartFile = MultipartFile.fromBytes(
        imageData,
        filename: images[i].name,
        contentType: MediaType("image", 'png'),
      );

      FormData formData = FormData.fromMap({
        "image": multipartFile,
      });
      var messageJson = {
        'message': images[i].name,
        'sentByMe': user,
        'sentByYou': user,
        "messageType": 'img',
      };
      var message = {
        'id': 1,
        'message': images[i].name,
        'sentByMe': user,
        'sentByYou': user,
        "messageType": 'img',
      };

      await dio.post(
          ApiConstant().baseUrl +
              ApiConstant().server +
              ApiConstant().upLoadUrl,
          data: formData);

      socket.emit('message', messageJson);
      chatController.chatMess.add(Message.fromJson(message));
    }
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: MaterialButton(
            onPressed: () {
              chatController.chatMess = <Message>[].obs;
              setState(() {
                messageData = null;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            },
            child: Image(
              image: const AssetImage(IconsAssets.backLogo),
              color: ColorManager.blueAccent,
              width: 40,
              height: 40,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(imguser), fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        user,
                        style: TextStyle(
                            fontSize: FontsSizeAssets.fs18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.black),
                      ),
                      Text(
                        online ? "online" : "offline",
                        style: TextStyle(
                          color: ColorManager.black.withOpacity(0.4),
                          fontSize: FontsSizeAssets.fs14,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: const AssetImage(IconsAssets.phoneLogo),
                  color: ColorManager.blueAccent,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image(
                  image: const AssetImage(IconsAssets.videocallLogo),
                  color: ColorManager.blueAccent,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                      color: online ? ColorManager.green : ColorManager.grey,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white38)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image(
                  image: const AssetImage(IconsAssets.aboutLogo),
                  color: ColorManager.blueAccent,
                ),
              ],
            ))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: getBody(),
          ),
          getBottom()
        ],
      ),
      //body: getBody(),
      //bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration:
                BoxDecoration(color: ColorManager.grey.withOpacity(0.2)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Image(
                    image: const AssetImage(IconsAssets.plusLogo),
                    color: ColorManager.blueAccent,
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () => setState(() {
                      selectCamera();
                      messageType = 'camera';
                    }),
                    child: Image(
                      image: const AssetImage(IconsAssets.cameraLogo),
                      color: ColorManager.blueAccent,
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //selectImg();
                        loadAssets();
                        messageType = 'photo';
                      });
                    },
                    child: Image(
                      image: const AssetImage(IconsAssets.photoLogo),
                      color: ColorManager.blueAccent,
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: Image(
                      image: const AssetImage(IconsAssets.micLogo),
                      color: ColorManager.blueAccent,
                    ),
                  )),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorManager.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextField(
                          cursorColor: ColorManager.black,
                          controller: _sendMessageController,
                          onChanged: (message) {
                            setState(() {
                              messageType = 'text';
                              if (message != '') {
                                messageData = message;
                                messageType = 'text';
                              } else {
                                messageData = null;
                              }
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Aa",
                              suffixIcon: GestureDetector(
                                child: messageData == null
                                    ? const Iconandsend1()
                                    : const Iconandsend(),
                                onTap: () {},
                              )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (messageType == 'text') {
                        _sendMessageController.text = '';

                        sendMess(
                            messageData.toString(), messageType.toString());
                      }
                      if (messageType == 'photo') {
                        _saveImage(images);
                        images = <Asset>[];
                        setState(() {});
                      } else {
                        _saveCamera(camera!);
                      }
                      messageType == '';
                    },
                    child: Image(
                      image: messageData == null
                          ? const AssetImage(IconsAssets.likeLogo)
                          : const AssetImage(IconsAssets.sendLogo),
                      color: ColorManager.blueAccent,
                    ),
                  )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 220,
            child: buildGridView(),
          )
        ],
      ),
    );
  }

  void sendMess(
    String text,
    String messageType,
  ) async {
    var messageJson = {
      'message': text,
      'sentByMe': user,
      'sentByYou': user,
      "messageType": messageType,
    };
    var message = {
      'id': 1,
      'message': text,
      'sentByMe': user,
      'sentByYou': user,
      "messageType": messageType
    };
    sentData(messageJson, dio);
    socket.emit('message', messageJson);
    chatController.chatMess.add(Message.fromJson(message));
  }

  Widget getBody() {
    return g.Obx(() => ListView.builder(
          reverse: true,
          itemCount: chatController.chatMess.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var data = chatController.chatMess.reversed.toList();
            var d = data[index];
            return ChatBubble(
              type: d.messageType,
              isMe: d.senByMe,
              message: d.message,
              user: user,
              profileImg: imguser,
            );
          },
        ));
    // return ListView.builder(
    //       reverse: true,
    //       itemCount: chatController.chatMess.length,
    //       shrinkWrap: true,
    //       itemBuilder: (context, index) {
    //         var data = chatController.chatMess.reversed.toList();
    //         var d = data[index];
    //         return ChatBubble(
    //           type: d.messageType,
    //           isMe: d.senByMe,
    //           message: d.message,
    //           user: user,
    //           profileImg: imguser,
    //         );
    //       },
    //     );
  }
}

class Iconandsend extends StatelessWidget {
  const Iconandsend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Image(
          image: const AssetImage(
            IconsAssets.searchLogo,
          ),
          color: ColorManager.white,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.blueAccent,
        ),
      ),
    );
  }
}

class Iconandsend1 extends StatelessWidget {
  const Iconandsend1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(
        IconsAssets.iconLogo,
      ),
      color: ColorManager.blueAccent,
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String isMe;
  final String profileImg;
  final String message;
  final String messageType;
  final String type;
  final String user;
  final XFile? photo;

  const ChatBubble({
    Key? key,
    this.isMe = '',
    this.profileImg =
        'https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80',
    this.message = '',
    this.messageType = '2',
    required this.user,
    required this.type,
    this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment:
            isMe == user ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          isMe != user
              ? Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(profileImg), fit: BoxFit.cover)),
                )
              : const SizedBox(),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  color: isMe == user
                      ? ColorManager.blueAccent
                      : ColorManager.grey,
                  borderRadius: getMessageType(messageType)),
              child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  // child: photo == null
                  //     ? null
                  //     : Image.file(
                  //         File(photo!.path),
                  //         width: (MediaQuery.of(context).size.width) / 3,
                  //       ),
                  child: type == 'text'
                      ? Text(
                          message,
                          style: TextStyle(
                            color: isMe == user
                                ? ColorManager.white
                                : ColorManager.black,
                            fontSize: FontsSizeAssets.fs17,
                          ),
                        )
                      : Image.network(
                          ApiConstant().baseUrl +
                              ApiConstant().server +
                              ApiConstant().image +
                              message,
                          width: (MediaQuery.of(context).size.width) / 3,
                        )
                  // : Image.file(File(photo!.path)),
                  ),
            ),
          )
        ],
      ),
    );
  }

  getMessageType(messageType) {
    if (isMe == user) {
      // start message
      if (messageType == '1') {
        return const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // middle message
      else if (messageType == '2') {
        return const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // end message
      else if (messageType == '3') {
        return const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // standalone message
      else {
        return const BorderRadius.all(Radius.circular(30));
      }
    }
    // for sender bubble
    else {
      // start message
      if (messageType == '1') {
        return const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // middle message
      else if (messageType == '2') {
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // end message
      else if (messageType == '3') {
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // standalone message
      else {
        return const BorderRadius.all(Radius.circular(30));
      }
    }
  }
}
