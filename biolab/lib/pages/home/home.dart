import 'package:biolab/pages/blinks/blink_biometric.dart';
import 'package:biolab/pages/faces/face_biometric.dart';
import 'package:biolab/pages/fingers/finger_biometric.dart';
import 'package:biolab/pages/hands/hand_biometric.dart';
import 'package:biolab/pages/iris/iris_biometric.dart';
import 'package:biolab/pages/pupils/pupil_biometric.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scofKey = GlobalKey();
  late TabController _tabController;

  @override
  void initState(){
    Future.delayed(Duration.zero, () async{
      try{
        // await iCloud.populate();
      }catch(ex){
        debugPrint("HomePage initState: $ex");
      }
    });
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 6,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void moveToTab(int index) {
    if(index <= _tabController.length) {
      _tabController.index = index;
      _tabController.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          key: _scofKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: TabBarView(
            controller: _tabController,
            children:  const <Widget> [
              FingerBiometric(),
              HandBiometric(),
              FaceBiometric(),
              BlinkBiometric(),
              IrisBiometric(),
              PupilBiometric()
            ],
          ),
          bottomNavigationBar: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.blue,
            tabs:  const [
              Tab( text: "Finger Prints", icon: ImageIcon(AssetImage("assets/images/finger.png")),),
              Tab( text: "Full Hands", icon: ImageIcon(AssetImage("assets/images/hand.png")),),
              Tab(text: "Facial", icon: ImageIcon(AssetImage("assets/images/face.png")),),
              Tab( text: "Blink Detection", icon: ImageIcon(AssetImage("assets/images/blink.png")),),
              Tab( text: "Iris Identity", icon: ImageIcon(AssetImage("assets/images/eye.png")),),
              Tab( text: "Pupil Unlock", icon: ImageIcon(AssetImage("assets/images/pupil.png")),),
            ],
            onTap: (int index){ },
          ),
        )
    );
  }

}
