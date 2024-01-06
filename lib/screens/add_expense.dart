import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String txtNama = "";
  String txtMulai = "";
  String txtSelesai = "";
  String txtTgl = "";

  var txtEditNama = TextEditingController();
  var txtDate = TextEditingController();
  var txtFilePicker = TextEditingController();
  DateTime date = DateTime.now();

  String dropdownValue = list.first;

  Widget buildDatePicker(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                readOnly: true,
                controller: txtDate,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal harus diisi';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide( width: 2)),
                  hintText: 'Tanggal Pemasukan',
                  contentPadding: EdgeInsets.all(10.0),
                ),
                style: const TextStyle(fontSize: 16.0)),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(70, 48),
                  maximumSize: const Size(70, 48)),
              onPressed: () => pickDatePicker(context),
              child: const Icon(
                Icons.calendar_today_rounded,
                color: Colors.black,
                size: 24.0,
              ))
        ],
      ),
    );
  }

  Future pickDatePicker(BuildContext context) async {
    final newDatePicker = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: date,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 400.0, maxHeight: 520.0),
                  child: child,
                ),
              )
            ],
          );
        });

    if (newDatePicker == null) return;

    setState(() {
      //
      String rawDate = newDatePicker.toString();
      var explode = rawDate.split(" ");
      String tgl = convertDateFromString(explode[0]).toString();
      txtDate.text = tgl;
    });
  }

  convertDateFromString(String strDate) {
    DateTime date = DateTime.parse(strDate);
    return DateFormat("dd/MM/yyyy").format(date);
  }

  Widget expenseForm(){
    return  Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildDatePicker(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Pengeluaran',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon isi jumlah pengeluaran';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(child: Text('Kategori')),
                  DropdownMenu<String>(
                    initialSelection: list.first,
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                  ),
                ],
              )
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.blue,
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){},
              )
            ),
          ]
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Pengeluaran',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white, 
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: expenseForm(),
    );
  }
}
