import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_project/GridViewExample.dart';
import 'package:tutorial_project/data/InfoKeys.dart';
import 'package:tutorial_project/data/UserInfoCall.dart';
import 'package:tutorial_project/model/UserClass.dart';
import 'package:tutorial_project/res/ColorResource.dart';
import 'package:tutorial_project/screens/GetUserPage.dart';

//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import your generated localizations file
import 'ExpensesList.dart';
import 'ReusableWidgetContainer.dart';
import 'UserViewModel.dart';

void main() {
  // block rotate
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {

    runApp(/*const ProviderScope(child: MyApp())*/const MyApp()
    );
  });
  ;
}

String? url = null;
int sliderHeight = 150;
List<UserClass>? listDataInfo = List.empty();
List<UserClass>? filteredList = listDataInfo;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider<UserViewModel>(
            create: (_) => UserViewModel(),  // Correct syntax
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: ColorRes.PrimaryColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyHomePage(
            title: "flutter test",
          ) // LoginPage()
        
          ///MyHomePage(title: 'Flutter Demo Home Page'),
          ),
      );
  }
}

bool visibiltyOfImage = false;
bool showLoader = false;

class LoginPage extends State {
  void getDelay() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {});
    });
  }

  void WhenSelect() async {
    final result = await Navigator.of(context)
        .push<Map<Infokeys, UserClass>>(MaterialPageRoute(
            builder: (context) => GridList(
                  listInfoValue: listDataInfo ?? List.empty(),
                )));
    final resultData = result?[Infokeys.gridListItems]!;
    setState(() {
      filteredList = listDataInfo?.where((oneItem) {
        if (resultData?.id != oneItem.id) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    //final result = ref.watch(providerMeals);
    Widget contentList = ExpensesList(
        listData: filteredList ?? List.empty(), onSelectFunction: WhenSelect);
    if (filteredList?.isEmpty == true) {
       contentList = ExpensesList(
          listData: listDataInfo ?? List.empty(), onSelectFunction: WhenSelect);

      //   contentList = Text(AppLocalizations.of(context)!.new_world);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //[800],
        title: Text(
          /*AppLocalizations.of(context)!.new_world*/
          "test",
          textDirection: TextDirection.ltr,
        ),
      ),
      drawer: MainDrawer(
        onSelectFunction: (identifer) {},
      ),
      body:
      Container(
        child: Theme(
          data: ThemeData.light(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (url?.contains("https") == true)
                Image(image: NetworkImage(url!))
              else
                Image(image: AssetImage("images/image_placeholder.png")),
              Visibility(
                  child: Image(image: AssetImage("images/image_placeholder.png")),
                  visible: visibiltyOfImage),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: GestureDetector(
                  onTap: () async {
                    visibiltyOfImage = !visibiltyOfImage;
                   /* final list = await Userinfocall().fetchListUsers();
                    print(list.toString());
                    setState(() {
                      listDataInfo = list;
                    });*/
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Getuserpage()));
                  },
                  child: new Text(
                    /*AppLocalizations.of(context)!.hide_show*/
                    "hello",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // send color as material color
              // flex means that weight
              Expanded(
                  flex: 1,
                  child: Reusablewidgetcontainer(
                    containerColor: ColorRes.PrimaryAssentColor,
                  )),
              Expanded(
                  child: Reusablewidgetcontainer(
                containerColor: ColorRes.PrimaryColor,
              )),
              Slider(
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey,
                  value: sliderHeight.toDouble(),
                  min: 100,
                  max: 200,
                  onChanged: (double newValue) {
                    setState(() {
                      sliderHeight = newValue.round();
                    });
                  }),
              Expanded(
                  child:
                      contentList /*ExpensesList(
                listData: listDataInfo ?? List.empty(),
              ))*/
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  final void Function(String id) onSelectFunction;

  const MainDrawer({super.key, required this.onSelectFunction});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        const DrawerHeader(child: Text("good text")),
        const ListTile(
          leading: Icon(
            Icons.access_alarm,
            color: Colors.white,
          ),
          title: Text("Meal1"),
        ),
        ListTile(
          leading: const Icon(
            Icons.ac_unit_sharp,
            color: Colors.white,
          ),
          title: const Text("Meal2"),
          onTap: () {
            onSelectFunction("meal2");
          },
        )
      ],
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  LoginPage createState() => LoginPage();
}

/*class _MyHomePageState extends State {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
