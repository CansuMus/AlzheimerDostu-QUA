import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../styles/colors/colors.dart';
import 'Model/contact_model.dart';

class PatientContactPage extends StatefulWidget {
  static String route = "/patientContactPage";
  const PatientContactPage({super.key});

  

  @override
  State<PatientContactPage> createState() => _PatientContactPageState();
}

class _PatientContactPageState extends State<PatientContactPage> {
   final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();


    @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _roleController.dispose();
    super.dispose();
  }


 addContact(Contact contact){
  Box contactBox = Hive.box("contacts");
  contactBox.add(contact);
 }

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _displayDialog();
          // Contact newContact = Contact(number: "0123456456", name: "Musa", title: "Doctor");
          // addContact(newContact);
        }),

        appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        title: const Text('Numaralarım'),
      ),
      body: Column(
        children: [


          // ClipPath(
          //   clipper: CustomClipPath(),
          //   child: Container(
          //     height: 200,
          //     color: Utils.mainThemeColor,
          //     child: Center(
          //       child: ListTile(
          //         leading: IconButton(icon: Icon(Icons.menu, color: Colors.white, size: 26,), onPressed: () {    
          //         },),
          //         title: Text("Hoşgeldin, Ayşe",style: TextStyle(color: Colors.white, fontSize: 20), ),
          //         subtitle: Text("Umarım, güzel bir gün geçirirsin",
          //         style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400 ), ),

          //       ),
          //     ),
          //   ),
          // ),

/*
          Expanded(
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                //childAspectRatio: 3 / 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20),
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text("name"),
                    ),
                  ),

                  Row(
                    children: [
                      Text("Isim Soyisim"),

                      GestureDetector(
                        onTap: () async {
                          const number = '0905527070000'; //set the number here
                           //await FlutterPhoneDirectCaller.callNumber(number);
                           await FlutterPhoneDirectCaller.callNumber("+9012345678");
                           
                           //makePhoneCall('tel:+1234567890'); 
                        },
                        child: Icon(Icons.phone)),
                    ],
                  ),
                 
                ],
              );
            }),
          )
          
*/

                _buildListView()
          
  

          
        ],
      ),
    );
  }







  Widget _buildListView() {
    //Box contactBox = Hive.box("contacts");

   // ignore: deprecated_member_use
   return Expanded(
     child: ValueListenableBuilder(
      valueListenable: Hive.box("contacts").listenable(),
      builder: (context, contactBox, widget){
            return ListView.builder(
                  itemCount: contactBox.length,
                  itemBuilder: (context, index){
                    final contact = contactBox.getAt(index) as Contact;
                    return ListTile(
                    title: Text("${contact.name}"),
                    subtitle: Text("${contact.title}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){
                            makePhoneCall(contact.number);
                        },
                         icon: Icon(Icons.call, color: Colors.green.shade500,)),
   
                         IconButton(onPressed: (){
                            showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              //title: Text('Hata'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      _editContact(index);
                                      //context.pop();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit),
                                        Text("Düzenle"),
                                        
                                      ],
                                    ),
                                    ),

                                    TextButton(
                                    onPressed: (){
                                      contactBox.deleteAt(index);
                                      context.pop();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        Text("Sil"),
                                        
                                      ],
                                    ),
                                    ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Tamam'),
                                ),
                              ],
                            ),
                          );
                         },
                         icon: Icon(Icons.more_horiz)),
                    ],)
                  );
                });
      }),
   );
  }


  void _displayDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(labelText: 'Number'),
              ),
              TextField(
                controller: _roleController,
                decoration: const InputDecoration(labelText: 'Role'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: const Text('Ekle'),
              onPressed: () {
                // Perform your operation here
                String name = _nameController.value.text;
                String role = _roleController.value.text;
                String number = _numberController.value.text;
                Contact newContact = Contact(number: number, name: name, title: role);
                addContact(newContact);
                context.pop();
              },
            ),
          ],
        );
      },

    );
  }




void _editContact (index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(labelText: 'Number'),
              ),
              TextField(
                controller: _roleController,
                decoration: const InputDecoration(labelText: 'Role'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: const Text('Düzenle'),
              onPressed: () {
                // Perform your operation here
                String name = _nameController.value.text;
                String role = _roleController.value.text;
                String number = _numberController.value.text;
                Contact newContact = Contact(number: number, name: name, title: role);
                Box contactBox = Hive.box("contacts");
                contactBox.putAt(index, newContact);
                context.pop();
              },
            ),
          ],
        );
      },




      
    );
  }



}








Future<void> makePhoneCall(String number) async {
    
    await FlutterPhoneDirectCaller.callNumber(number);
  }




