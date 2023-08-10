import 'package:flutter/material.dart';
import '../models/calls_model.dart';

class CallsData {
  static List<Calls> GetCalls() {
    var Data = <Calls>[];

    var D1 = Calls(
        name: 'Bill Gates',
        time: 'Today 12:08 pm',
        image: 'assets/images/gates.png',
        icon: Icons.transit_enterexit,
        call: Icons.call);

    var D2 = Calls(
        name: 'Zareen',
        time: 'Today 11:06 am',
        image: 'assets/images/kubra.png',
        icon: Icons.call_missed,
        call: Icons.call);

    var D3 = Calls(
        name: 'Elon Musk',
        time: 'Today 1:09 pm',
        image: 'assets/images/elon.png',
        icon: Icons.call_missed_outgoing,
        call: Icons.call);
    var D4 = Calls(
        name: 'Dr Aysha',
        time: 'Today 3:14 pm',
        image: 'assets/images/Aysha.png',
        icon: Icons.call_missed,
        call: Icons.videocam_rounded);
    var D5 = Calls(
        name: 'Bill Gates',
        time: 'Today 12:08 pm',
        image: 'assets/images/gates.png',
        icon: Icons.call_missed,
        call: Icons.call);


    var D6 = Calls(
        name: 'Zoia Khan',
        time: 'Yesterday 9:06 pm',
        image: 'assets/images/zoia.png',
        icon: Icons.call_missed,
        call: Icons.videocam_rounded);
    var D7 = Calls(
        name: 'A kamal',
        time: 'Yesterday 10:00 pm',
        image: 'assets/images/kamal.png',
        icon: Icons.call_missed,
        call: Icons.call,
    );

    Data.add(D1);
    Data.add(D2);
    Data.add(D3);
    Data.add(D4);
    Data.add(D5);
    Data.add(D6);
    Data.add(D7);
    return Data;
  }
}
