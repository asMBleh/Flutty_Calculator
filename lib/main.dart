import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int fnum;
  int snum;
  String res;
  String stringtodisplay="";
  String operatortoperform;
  void buttonpress(String buttonText){
    if(buttonText == "clear"){
      fnum=0;
      snum=0;
      stringtodisplay="";
      res="";
    }else if(buttonText =="*" || buttonText == "-" || buttonText == "+" || buttonText =="/" )
    {
      fnum=int.parse(stringtodisplay);
      res="";
      operatortoperform=buttonText;
    }
    else if(buttonText == ".")
    {
      if(res.contains(".")){
        print("Already contains a decimal.");
        return;
      }else{
        res = res + buttonText;
      }
    }else if(buttonText == "="){
      snum=int.parse(stringtodisplay);
      if(operatortoperform == "+"){
        res=(fnum + snum).toString();
      }
      if(operatortoperform == "-"){
        res=(fnum - snum).toString();
      }
      if(operatortoperform == "*"){
        res=(fnum * snum).toString();
      }
      if(operatortoperform == "/"){
        res=(fnum / snum).toString();
      }
    }else{
      res=int.parse(stringtodisplay + buttonText).toString();
    }
    setState(() {
      stringtodisplay=res;
    });
  }
  Widget buildbutton(String buttonText){
    return Expanded(
      child: new MaterialButton(
        child: new Text(buttonText ,style:TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold
        )),
        onPressed:() =>
            buttonpress(buttonText),
        color: Colors.black,
        textColor: Colors.white,
        padding: new EdgeInsets.all(24.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:new Container(
          child: new Column(children: <Widget>[
            Container(
              child: new Text("$stringtodisplay",style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold),),
              padding: new EdgeInsets.symmetric(vertical: 24.0,horizontal: 12.0),
              alignment: Alignment.centerRight,),
            new Expanded(child: new Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildbutton("1"),
                    buildbutton("2"),
                    buildbutton("3"),
                    buildbutton("/"),
                  ],
                ),
                Row(children: <Widget>[
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                  buildbutton("*"),
                ],
                ),
                Row(children: <Widget>[
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                  buildbutton("-"),
                ],
                ),
                Row(children: <Widget>[
                  buildbutton("."),
                  buildbutton("0"),
                  buildbutton("00"),
                  buildbutton("+"),
                ],
                ),
                Row(children: <Widget>[
                  buildbutton("CLEARgit "),
                  buildbutton("="),
                ],
                ),
              ],
            )
          ],),

        )
    );
  }
}