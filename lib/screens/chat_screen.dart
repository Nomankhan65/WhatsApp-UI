import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
class ChatScreen extends StatelessWidget {
  final Chat chat;
  const ChatScreen({Key? key,required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image:DecorationImage(image: AssetImage('assets/images/whatsapp.jpg'),
          fit:BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        appBar:AppBar(
          actions: [
            const SizedBox(width:45,),
           Expanded(
             flex:2,
             child: Row(
               children: [
                 CircleAvatar(
                   radius:22,
                   backgroundImage:AssetImage(chat.image),
                 ),
                 const SizedBox(width:5,),
                 Column(
                   crossAxisAlignment:CrossAxisAlignment.start,
                   mainAxisAlignment:MainAxisAlignment.center,
                   children: [
                     Text(chat.name,style:const TextStyle(fontSize:17,fontWeight:FontWeight.bold),),
                     const Text('online',style:TextStyle(fontSize:13),),
                   ],
                 ),
               ],
             ),
           ),
            Expanded(
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.videocam_rounded),
                  Icon(Icons.call),

                ],
              ),
            )

          ],
        ),
        body:Column(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
            Row(
              children: [
      ],
            ),
          ],
        ),
      ),
    );
  }
}
