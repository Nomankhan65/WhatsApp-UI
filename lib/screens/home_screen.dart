import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/screens/chat_screen.dart';
import 'package:whatsapp/screens/contct_screen.dart';
import 'package:whatsapp/utility/calls_handler.dart';
import 'package:whatsapp/utility/chat_handler.dart';
import 'package:whatsapp/utility/status_handler.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  late  TabController tabController;
  var tabIcon=Icons.message;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4, vsync:this)
    ..addListener(() {
      setState(() {
        switch(tabController.index)
        {
          case 0:tabIcon=Icons.groups;
          break;
          case 1:tabIcon=Icons.message_rounded;
          break;
          case 2:tabIcon=Icons.camera_alt_outlined;
          break;
          case 3:tabIcon=Icons.add_ic_call;
          break;
        }

      });
    })
    ;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.teal,
                systemNavigationBarColor: Colors.white,
            ),
            title: const Text('WhatsApp'),
            actions: [
              const Icon(Icons.camera_alt_outlined),
              const SizedBox(
                width: 20,
              ),
              const Icon(Icons.search),
              const SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                  itemBuilder: (context) => [
                        const PopupMenuItem(child: Text('New group')),
                        const PopupMenuItem(child: Text('Linked devices')),
                        const PopupMenuItem(child: Text('Settings')),
                      ])
            ],
            bottom: TabBar(
              controller:tabController,
                tabs: const [
              Tab(
                child: Icon(Icons.group),
              ),
              Tab(
                child: Text(
                  'Chats',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  'Status',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  'Calls',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ]),
          ),
          body: TabBarView(
              controller:tabController,
              children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  Icons.group_add,
                  size: 150,
                  color: Colors.teal,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Introducing communities',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal:50,vertical:10),
                  child: Text(
                    'Easily organise your related groups and send announcements.Now your communities, like school, can have their own space.',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height:30,),
                SizedBox(
                  height:45,
                  width:300,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(30),
                      )
                    ),
                      onPressed: () {
                      }, child: const Text('Start your community',style:TextStyle(fontSize:16),)),
                )
              ],
            ),
            ListView.builder(
                itemCount:ChatData.GetChat().length,
                itemBuilder: (BuildContext context, int index) {
                  var Mychat=ChatData.GetChat()[index];
                  return InkWell(
                    child: ListTile(
                      leading: InkWell(
                        onTap: (){
                          showDialog(
                              context:context, builder:(ctx){
                            return AlertDialog(
                              actions: [
                                 Column(
                                   children: [
                                     Image(image: AssetImage(Mychat.image),
                                     height:280,
                                       width:265,
                                       fit:BoxFit.cover,
                                     ),
                                     Row(
                                       children: [
                                         SizedBox(width:5,),
                                         IconButton(onPressed:(){
                                           Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ChatScreen(chat:Mychat)));
                                         },
                                             icon:const Icon(Icons.message,color:Colors.teal,)),
                                         SizedBox(width:40,),
                                         const Icon (Icons.call,color:Colors.teal,),
                                         SizedBox(width:40,),
                                         const Icon(Icons.videocam_rounded,color:Colors.teal,),
                                         SizedBox(width:40,),
                                         const Icon(Icons.error_outline,color:Colors.teal,)
                                       ],),

                                   ],
                                 )
                              ],
                            );
                          });
                        },
                        child: CircleAvatar(
                          radius:25,
                          backgroundImage:AssetImage(Mychat.image),
                        ),
                      ),
                      title:   Text(
                        Mychat.name,
                        style:
                            const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle:Row(
                        children: [
                          (index/2==0)
                            ?Icon(Mychat.icon, color:Colors.grey,size:21,)
                          :Icon(Mychat.icon, color:Colors.blue,size:21,),

                          const SizedBox(width:5,),
                          Text(Mychat.message),
                        ],
                      ),
                      trailing:Text(Mychat.time),
                    ),
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                        return ChatScreen(chat:Mychat);

                      }));
                    },
                  );
                }),
            ListView.builder(
                itemCount:StatusData.GetStatus().length,
                itemBuilder: (BuildContext context, int index) {
                  var MyStatus=StatusData.GetStatus()[index];
                  if (index == 0) {
                    return ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      title: const Text(
                        'My Status',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Tap to add status update',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (index == 1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Recent updates',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.teal),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(MyStatus.image),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          title:Text(
                            MyStatus.name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                           MyStatus.time,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                      ],
                    );
                  }
                  else if (index == 2) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.teal),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(MyStatus.image),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          title:Text(
                            MyStatus.name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            MyStatus.time,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Viewed updates',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  }
                  else {
                    return ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.grey),
                          image: DecorationImage(
                              image: AssetImage(MyStatus.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title:Text(
                        MyStatus.name,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle:Text(
                        MyStatus.time,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                }),
            ListView.builder(
                itemCount:CallsData.GetCalls().length,
                itemBuilder: (BuildContext context, int index) {
                  var MyCalls=CallsData.GetCalls()[index];
                  if(index==0)
                    {
                      return Column(
                     crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              leading: Container(
                                height: 55,
                                width: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:Colors.teal,
                                ),
                                child:const Icon(Icons.link,color:Colors.white,),
                              ),
                              title: const Text(
                                'Create call link',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                    'Share a link for your WhatsApp call',
                                    style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),
                                  ),
                               ),
                        const Padding(
                          padding: EdgeInsets.only(left:20),
                          child: Text('Recent',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold),),
                        ),

                        ],
                        
                      );
                    }
                  else {
                    return ListTile(
                        leading: Container(
                          height: 55,
                          width: 55,
                          decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(MyCalls.image),
                                fit: BoxFit.cover),
                          ),
                        ),
                        title:Text(
                          MyCalls.name,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            index/2==1? Icon(MyCalls.icon,color:Colors.teal)
                            :Icon(MyCalls.icon,color:Colors.red,),
                            Text(
                              MyCalls.time,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing:Icon(MyCalls.call,color:Colors.teal,),

                    );
                  }
                }),
          ]
          ),
        floatingActionButton:FloatingActionButton(
        onPressed:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
        return const ContactScreen();
        }));
        },
        child:Icon(tabIcon),
        )
        ));
  }
}
