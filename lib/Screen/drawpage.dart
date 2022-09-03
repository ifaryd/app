import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:pkp_android_app/Screen/MenuItems/Interviews.dart';
import 'package:pkp_android_app/Screen/MenuItems/Serviteurs.dart';
import 'package:pkp_android_app/Screen/MenuItems/photos.dart';
import 'package:pkp_android_app/const.dart';

import 'MenuItems/Biographie.dart';
import 'MenuItems/Cantiques.dart';
import 'MenuItems/Livre.dart';

class Drawpage extends StatefulWidget {
  const Drawpage({Key? key}) : super(key: key);

  @override
  State<Drawpage> createState() => _DrawpageState();
}

class _DrawpageState extends State<Drawpage> {
  Function updateState(int index) {
    return () {
      if (index == 0) {
        Navigator.of(context).push(PageAnimationTransition(
            page: Biographie(
              title: 'Biographie',
            ),
            pageAnimationType: RightToLeftTransition()));
      }
      else if (index == 1) {
        Navigator.of(context).push(PageAnimationTransition(
            page: LivrePkp(
              title: 'Livre',
            ),
            pageAnimationType: RightToLeftTransition()));
      } else if (index == 2) {
        Navigator.of(context).push(PageAnimationTransition(
            page: IntervewsV(
              title: 'Interviews Vidéos',
            ),
            pageAnimationType: RightToLeftTransition()));
      }else if (index == 3) {
        Navigator.of(context).push(PageAnimationTransition(
            page: photos(
              title: 'Photos',
            ),
            pageAnimationType: RightToLeftTransition()));
      }else if (index == 4) {
        Navigator.of(context).push(PageAnimationTransition(
            page: Cantiques(
              title: 'Cantiques & Louanges',
            ),
            pageAnimationType: RightToLeftTransition()));
      }
      else if (index == 5) {
        Navigator.of(context).push(PageAnimationTransition(
            page: ServFidl(
              title: 'Serviteurs Fidèles',
            ),
            pageAnimationType: RightToLeftTransition()));
      }else if (index == 6) {
        Navigator.of(context).push(PageAnimationTransition(
            page: Cantiques(
              title: 'Témoignages',
            ),
            pageAnimationType: RightToLeftTransition()));
      }else if (index == 7) {
        Navigator.of(context).push(PageAnimationTransition(
            page: Cantiques(
              title: 'Mes Notes',
            ),
            pageAnimationType: RightToLeftTransition()));
      }else if (index == 8) {
        Navigator.of(context).push(PageAnimationTransition(
            page: Cantiques(
              title: 'Contacts',
            ),
            pageAnimationType: RightToLeftTransition()));
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      bottomSheet: Container(
        color: Color.fromARGB(234, 248, 248, 251),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Paramètres',
                  style: TextStyle(color: AppColor.blackcolor, fontSize: 16),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Langues',
                    style:
                        TextStyle(color: AppColor.blackcolor, fontSize: 16))),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(234, 248, 248, 251),
        title: Text(
          "Livre du prophète Kacou Philippe",
          style: TextStyle(color: AppColor.blackcolor, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                AppBarTile(
                    index: 2,
                    onTap: updateState(0),
                    title: 'Biographie',
                    icon: Icons.person_outline),
                Divider(
                  color: AppColor.blackcolor,
                ),
                AppBarTile(
                  index: 0,
                  onTap: updateState(1),
                  title: 'Livre',
                  icon: CupertinoIcons.book,
                ),
                AppBarTile(
                    index: 1,
                    onTap: updateState(2),
                    title: 'Interviews Videos',
                    icon: Icons.video_collection_outlined),
                AppBarTile(
                  index: 3,
                  onTap: updateState(3),
                  title: 'Photos',
                  icon: Icons.photo_album_outlined,
                ),
                AppBarTile(
                  index: 4,
                  onTap: updateState(4),
                  title: 'Cantiques & Louanges',
                  icon: Icons.my_library_music_outlined,
                ),
                AppBarTile(
                  index: 5,
                  onTap: updateState(5),
                  title: 'Serviteurs Fidèles',
                  icon: Icons.people_alt_outlined,
                ),
                AppBarTile(
                  index: 6,
                  onTap: updateState(6),
                  title: 'Témoignages',
                  icon: Icons.message_outlined,
                ),
                AppBarTile(
                    index: 6,
                    onTap: updateState(7),
                    title: 'Notes',
                    icon: CupertinoIcons.doc_text),
                AppBarTile(
                  index: 7,
                  onTap: updateState(8),
                  title: 'Contacts',
                  icon: Icons.phone,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarTile extends StatelessWidget {
  const AppBarTile(
      {Key? key,
      required this.index,
      required this.icon,
      required this.onTap,
      required this.title})
      : super(key: key);

  final int index;
  final String title;
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: () {
          onTap();
        },
        leading: Icon(
          icon,
          size: 25,
          color: AppColor.blackcolor2,
        ),
        trailing: Icon(
          CupertinoIcons.right_chevron,
          color: Color.fromARGB(79, 0, 0, 0),
        ),
        title: Text(
          title,
          style: TextStyle(color: AppColor.blackcolor2),
        ),
      ),
    );
  }
}