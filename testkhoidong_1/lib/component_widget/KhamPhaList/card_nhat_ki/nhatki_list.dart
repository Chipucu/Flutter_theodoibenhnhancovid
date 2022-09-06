import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testkhoidong_1/component_widget/KhamPhaList/card_nhat_ki/khao_sat.dart';
class NhatkiList extends StatefulWidget {
  const NhatkiList({Key? key}) : super(key: key);

  @override
  State<NhatkiList> createState() => _NhatkiListState();
}

class _NhatkiListState extends State<NhatkiList> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  // Map<String, dynamic> _trieuchung = <String, dynamic>{
  //   "ho": ho,
  //   "sot": sot,
  // };
  final List<String> trieu_chung = <String>[
    'Ho',
    'Đau Đầu',
    'Chóng Mặt',
    'Đau Mỏi Cơ Bắp',
    'Mệt Mỏi'
  ];
  final _clicked = <String>{};
//get check box item
  var tmpArray = [];

  getCheckboxItems(){

    trieu_chung.forEach((value) {
      if(value == true)
      {
        tmpArray.add(value);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  final CollectionReference _nhatki= FirebaseFirestore.instance.collection('nhatki');
@override
  Widget buildListTile(BuildContext context, String title) {
    bool _isClick = _clicked.contains(title);
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      title: Text(title),
      trailing: Icon(
        _isClick ? Icons.check_box : Icons.check_box_outline_blank,
        color: _isClick ? Colors.blueAccent : null,
      ),
      onTap: () {
        setState(() {
          if (_isClick) {
            _clicked.remove(title);
          } else {
            _clicked.add(title);
          }
        });
      },
    );
  }

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['ghichu'];
      _priceController.text = documentSnapshot['ndoxi'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return
            Container(
              child: Padding(
              padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    // prevent the soft keyboard from covering text fields
                    bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //tao ra cac check box
                    buildListTile(context, trieu_chung[0]),
                    const Divider(indent: 20, endIndent: 20, thickness: 2),
                    buildListTile(context, trieu_chung[1]),
                    const Divider(indent: 20, endIndent: 20, thickness: 2),
                    buildListTile(context, trieu_chung[2]),
                    const Divider(indent: 20, endIndent: 20, thickness: 2),
                    buildListTile(context, trieu_chung[3]),
                    const Divider(indent: 20, endIndent: 20, thickness: 2),
                    buildListTile(context, trieu_chung[4]),
                    // truong nhap ten
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Ghi Chu'),
                    ),
                    TextField(
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: 'Nong do Oxi',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text(action == 'create' ? 'Create' : 'Update'),
                      onPressed: () async {
                        final String? name = _nameController.text;
                        final double? price =
                        double.tryParse(_priceController.text);
                        if (name != null && price != null) {
                          if (action == 'create') {
                            // Persist a new product to Firestore
                            await _nhatki.add({"ghichu": name, "ndoxi": price});
                          }

                          if (action == 'update') {
                            // Update the product
                            await _nhatki
                                .doc(documentSnapshot!.id)
                                .update({"ghichu": name, "ndoxi": price});
                          }

                          // Clear the text fields
                          _nameController.text = '';
                          _priceController.text = '';

                          // Hide the bottom sheet
                          Navigator.of(context).pop();
                        }
                      },
                    )
                  ],
              ),
            ),
               );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _nhatki.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhật kí sức khỏe'),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
        stream: _nhatki.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['ghichu']),
                    subtitle: Text(documentSnapshot['ndoxi'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // Press this button to edit a single product
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          // This icon button is used to delete a single product
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProduct(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }


  //buld listile

}

