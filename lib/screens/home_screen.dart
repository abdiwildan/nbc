import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'package:nbc/constants/app_textstyle.dart';
import 'package:nbc/models/card_data.dart';
import 'package:nbc/screens/side_bar.dart';
import 'package:nbc/widgets/akumulasi.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Catat Uang",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          // physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: myCards.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Akumulasi(
                          card: myCards[index],
                        );
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Riwayat Transaksi",
                  style: ApptextStyle.BODY_TEXT,
                ),
                const SizedBox(
                  height: 15,
                ),

                StreamBuilder<QuerySnapshot<Object?>>(
                  stream: controller.streamData(),
                  builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        var listAllDocs = snapshot.data!.docs;
                        return ListView.builder(

                            itemCount: listAllDocs.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                
                                color: Colors.white,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                
                                title: Text(
                                  "${(listAllDocs[index].data() as Map<String, dynamic>) ["source"]}"
                                ),
                                subtitle: Text(
                                  "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>) ["income"]}"
                                ),
                              ),
                            ));
                      }
                      return const Center(child: CircularProgressIndicator());
                    }
                )

                // FutureBuilder<QuerySnapshot<Object?>>(
                //     future: controller.getData(),
                //     
              ],
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  backgroundColor: Colors.greenAccent,
                  child: Icon(Icons.paid_outlined),
                  label: 'Pendapatan',
                  onTap: () {
                    Navigator.pushNamed(context, '/addIncome');
                  }),
              SpeedDialChild(
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.payments_outlined),
                label: 'Pengeluaran',
                onTap: () {
                  Navigator.pushNamed(context, '/addExpense');
                },
              )
            ]));
  }
}


// FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return const AddTransaction();
//               });
//         },
//         tooltip: 'Add',
//         child: const Icon(Icons.add),

// itemBuilder: (context, index) {
//                               return TransactionCard(
//                                   transaction: myTransactions[index]);
//                             });