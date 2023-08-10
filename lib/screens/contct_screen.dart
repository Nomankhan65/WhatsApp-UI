import 'package:flutter/material.dart';

import '../utility/contact_handler.dart';
class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contact=ContactData.GetContact();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
            const Text('Select contact',style:TextStyle(fontSize:19,fontWeight:FontWeight.bold),),
              Row(
                children: [

                  Text(contact.length.toString(),style:TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width:4,),
                  const Text('contacts',style:TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(width:130),
          const Icon(Icons.search),
          PopupMenuButton(itemBuilder: (context)=>[
            const PopupMenuItem(child:Text('Invite friends')),
            const PopupMenuItem(child:Text('Contact')),
            const PopupMenuItem(child:Text('Refresh')),
            const PopupMenuItem(child:Text('Help')),

          ])
        ],
      ),

      body:ListView.builder(
        itemCount:ContactData.GetContact().length,
        itemBuilder:(BuildContext context,int index)
        {
          var Mycotact=ContactData.GetContact()[index];

          if(index==0)
            {
              return const ListTile(
                leading:CircleAvatar(
                  radius:25,
                  backgroundColor:Colors.teal,
                  child:Icon(Icons.group,color:Colors.white,),
                ),

                title:Text('New group',style:TextStyle(fontWeight: FontWeight.bold),),
              );
            }
          else if(index==1)
          {
            return const ListTile(
              leading:CircleAvatar(
                radius:25,
                backgroundColor:Colors.teal,
                child:Icon(Icons.person_add,color:Colors.white,),
              ),

              title:Text('New contact',style:TextStyle(fontWeight: FontWeight.bold),),
              trailing:Icon(Icons.qr_code),
            );
          }
          if(index==2)
          {
            return Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading:CircleAvatar(
                    radius:25,
                    backgroundColor:Colors.teal,
                    child:Icon(Icons.groups,color:Colors.white,),
                  ),

                  title:Text('New community',style:TextStyle(fontWeight: FontWeight.bold),),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Contacts on WhatsApp',style:TextStyle(fontWeight:FontWeight.bold),),
                )
              ],
            );
          }
          else {
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Mycotact.image),
              ),
              title: Text(
                Mycotact.title, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(Mycotact.subTitle),
            );
          }
      },
      )
    );
  }
}
