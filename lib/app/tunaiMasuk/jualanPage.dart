import 'package:flutter/material.dart';
import 'package:project_ras/app/tunaiMasuk/database.dart';
import 'package:project_ras/app/tunaiMasuk/tunai.dart';

class JualanDetailPage extends StatefulWidget {
  const JualanDetailPage({key, @required this.database, @required this.title})
      : super(key: key);
  final Database database;
  final String title;

  //navigator
  static Future<void> show(BuildContext context, String s) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => JualanDetailPage(
        database: new FireStoreDatabase(),
        title: s,
      ),
    ));
  }

  @override
  _JualanDetailPageState createState() => _JualanDetailPageState(title);
}

class _JualanDetailPageState extends State<JualanDetailPage> {
  String title;
  _JualanDetailPageState(this.title);
  String keteranganTunai;
  int ringggitTunai;
  DateTime date;

  final formKey = new GlobalKey<FormState>();
  TextEditingController ringgit = new TextEditingController();
  TextEditingController keterangan = new TextEditingController();

  bool _validateAndSaveForm() {
    final form = formKey.currentState;
    // ignore: unnecessary_null_comparison
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _createTunai() async {
    if (_validateAndSaveForm()) {
      try {
        final tunai = Tunai(
          ringgit: ringggitTunai,
          keterangan: keteranganTunai,
          tarikhMasa: date,
          jenisTunaiMasuk: title,
        );
        await widget.database.createTunai(tunai);
        ringgit.clear();
        keterangan.clear();
        print("$tunai");
      } catch (e) {
        print(e);
      }
    }
  }

  void _pickdate() async {
    final initialDate = DateTime.now();

    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() => date = newDate);
  }

  String getText() {
    if (date == null) {
      return "Pilih Tarikh";
    } else {
      return "${date.day}/${date.month}/${date.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print(sizeWidth);
    print(sizeHeight);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        centerTitle: true,
        elevation: 10.0,
        title: Text(
          title,
          style: TextStyle(
              fontStyle: FontStyle.normal, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(
            left: sizeWidth * 1 / 13,
            right: sizeWidth * 1 / 13,
            top: sizeHeight * 1 / 13,
            bottom: sizeHeight * 1 / 13),
        child: new Form(
            key: formKey,
            child: new Column(
              children: _buildContext() + _submitButton(),
            )),
      )),
    );
  }

  List<Widget> _buildContext() {
    return [
      new Text(
        "TARIKH",
        style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 8,
      ),
      new ElevatedButton(
        onPressed: _pickdate,
        child: Text(
          getText(),
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(40), primary: Colors.white),
      ),
      SizedBox(
        height: 30,
      ),
      new Text(
        "JUMLAH",
        style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold),
      ),
      new TextFormField(
        onSaved: (value) => ringggitTunai = int.tryParse(value),
        controller: ringgit,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan Jumlah';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0)),
            hintText: "RM"),
      ),
      SizedBox(
        height: 30,
      ),
      new Text(
        "KETERANGAN",
        style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold),
      ),
      new TextFormField(
        onSaved: (value) => keteranganTunai = value,
        controller: keterangan,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan Keterangan';
          }
          return null;
        },
        maxLines: 6,
        decoration: new InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0)),
            hintText: ""),
      )
    ];
  }

  List<Widget> _submitButton() {
    return [
      SizedBox(
        height: 30,
      ),

      // ignore: deprecated_member_use
      new RaisedButton(
        onPressed: _createTunai,
        color: Colors.green[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        child: Text(
          "SIMPAN",
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
        ),
      ),
    ];
  }
}
