import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatData {
  static List<Chat> GetChat() {
    var Data = <Chat>[];

    var D1 = Chat(
        name: 'Dr Aysha',
        message: 'ok i will sent you latter',
        time: '6:23 pm',
        icon: Icons.done_all,
        image: 'assets/images/Aysha.png');
    var D2 = Chat(
        name: 'Elon Musk',
        message: 'Good luck',
        time: '5:01 pm',
        icon: Icons.done,
        image: 'assets/images/elon.png');
    var D3 = Chat(
        name: 'Mehreen',
        message: 'Today i will complete',
        time: '4:49 pm',
        icon: Icons.done_all,
        image: 'assets/images/mehreen.png');
    var D4 = Chat(
        name: 'Zareen',
        message: '1:35',
        time: '4:01 pm',
        icon: Icons.mic,
        image: 'assets/images/zareen.png');
    var D5 = Chat(
        name: 'Zoia khan',
        message: '2:04',
        time: '2:00 pm',
        icon: Icons.mic,
        image: 'assets/images/zoia.png');
    var D6 = Chat(
        name: 'A Kamal',
        message: 'Call me latter',
        time: '11:23 am',
        icon: Icons.done_all,
        image: 'assets/images/kamal.png');
    var D7 = Chat(
        name: 'Bill gates',
        message: '0:35',
        time: 'yesterday',
        icon: Icons.mic,
        image: 'assets/images/gates.png');
    var D8 = Chat(
        name: 'Kubra',
        message: 'Ok by',
        time: 'yesterday',
        icon: Icons.done_all,
        image: 'assets/images/kubra.png');
    var D9 = Chat(
        name: 'Sofia',
        message: 'Does,t matter!',
        time: 'yesterday',
        icon: Icons.done_all,
        image: 'assets/images/Anil.png');
    var D10 = Chat(
        name: 'I Khan',
        message: 'Call me ',
        time: 'yesterday',
        icon: Icons.done_all,
        image: 'assets/images/elon.png');
    var D11 = Chat(
        name: 'Noman',
        message: '0:35',
        time: 'yesterday',
        icon: Icons.mic,
        image: 'assets/images/nomi.jpg');
    var D12 = Chat(
        name: 'Amelia',
        message: '1:08',
        time: 'yesterday',
        icon: Icons.mic,
        image: 'assets/images/Amelia.png');


    Data.add(D1);
    Data.add(D2);
    Data.add(D3);
    Data.add(D4);
    Data.add(D5);
    Data.add(D6);
    Data.add(D7);
    Data.add(D8);
    Data.add(D9);
    Data.add(D10);
    Data.add(D11);
    Data.add(D12);
    return Data;
  }
}
