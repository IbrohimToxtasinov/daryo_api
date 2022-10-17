import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text(
                        "Daryo",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 25,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          child: const Center(
                            child: Text(
                              "LOTINCHA",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                              color: Colors.blue,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: const Center(
                            child: Text(
                              "KIRILCHA",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Toshkent",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 16),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          " +12.0",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Colors.grey,
                  thickness: 3,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.currency_exchange_sharp,
                      color: Colors.white,
                    ),
                    Text(
                      " 10769.78",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.currency_ruble,
                      color: Colors.white,
                    ),
                    Text(
                      " 146.17",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.euro_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      " 12166.62",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            tileColor: Colors.yellow.withOpacity(0.5),
            title: Container(
              child: const Text("Qo'lanma ekranini ko'rsatish",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              ),
          ),
          ListTile(
            tileColor: Colors.grey.withOpacity(0.3),
            title: const Text("So'ngi Yangiliklar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),
          ),
          const ListTile(
            title: Text("Mahalliy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Dunyo",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Texnalogiyalar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          ListTile(
            tileColor: Colors.grey.withOpacity(0.3),
            title: const Text("Tanlangan xabarlar",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Madaniyat",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Avto",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Sport",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Foto",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Lifestyle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          const ListTile(
            title: Text("Kolumnistlar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          ListTile(
            tileColor: Colors.grey.withOpacity(0.3),
            title: const Text("Afisha",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
