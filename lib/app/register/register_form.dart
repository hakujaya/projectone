import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Daftar".text.xl5.bold.color(Colors.green).make(),
                "Isi maklumat dibawah dengan lengkap"
                    .text
                    .color(Colors.black54)
                    .make(),
                CupertinoFormSection(
                    header: "Maklumat Peribadi".text.make(),
                    children: [
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Nama Penuh",
                        ),
                        prefix: "Nama".text.make(),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "No Telefon",
                        ),
                        prefix: "No. Tel".text.make(),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "No Kad Pengenalan",
                        ),
                        prefix: "IC".text.make(),
                      ),
                    ]),
                Padding(padding: Vx.m32),
                CupertinoFormSection(
                    header: "Maklumat Perniagaan".text.make(),
                    children: [
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Nama Syarikat",
                        ),
                        prefix: "Syarikat".text.make(),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Jenis Perniagaan",
                        ),
                        prefix: "Perniagaan".text.make(),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Sub Jenis Perniagaan",
                        ),
                        prefix: "Sub".text.make(),
                      )
                    ]),
                20.heightBox,
                Material(
                  color: context.theme.buttonColor,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ).centered(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
