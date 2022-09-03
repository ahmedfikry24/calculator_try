
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
 const  Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String result = "0";
  String enter = "0";
  String expression = "";
  double resultSize = 25;
  double enterSize = 20;

  Widget BuildItem (
      context,
      Color? colorItem,
      String? text,
      double? height,
      double? width,
      ) =>   Container(
    height: height,
    width: width,
    color: colorItem,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(5),
    child: TextButton(onPressed: (){
      onPresse(text!);
    },child: Text(text!,style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w400),)),

  );
  void onPresse(String buttonText){
    setState((){
      if(buttonText == 'C'){
        enter = '0';
        result = '0';
        enterSize = 20;
        resultSize = 25;
      }else if(buttonText == '←'){
        enterSize = 25;
        resultSize = 20;
        enter = enter.substring(0, enter.length -1);
        if(enter == '') enter = '0';
      }else if(buttonText == '='){
        enterSize = 20;
        resultSize = 25;
        expression = enter;
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel contextModel = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, contextModel)}';
        enter = '0';

      }else{
        enterSize = 25;
        resultSize = 20;
        enter = enter + buttonText;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.white,
              child: Text(
               this.enter,
                style: TextStyle(
                  fontSize:this.enterSize,
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(20),
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.white,
              child: Text(
                this.result,
                style: TextStyle(
                  fontSize: this.resultSize,
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          BuildItem(context,Colors.red,'C',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'*',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'/',80,MediaQuery.of(context).size.width * .235,),

                        ],
                      ),
                      Row(
                        children: [
                          BuildItem(context,Colors.black54,'9',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'8',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'7',80,MediaQuery.of(context).size.width * .235,),
                        ],
                      ),
                      Row(
                        children: [
                          BuildItem(context,Colors.black54,'6',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'5',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'4',80,MediaQuery.of(context).size.width * .235,),
                        ],
                      ),
                      Row(
                        children: [
                          BuildItem(context,Colors.black54,'3',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'2',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'1',80,MediaQuery.of(context).size.width * .235,),

                        ],
                      ),
                      Row(
                        children: [
                          BuildItem(context,Colors.black54,'%',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'0',80,MediaQuery.of(context).size.width * .235,),
                          BuildItem(context,Colors.black54,'.',80,MediaQuery.of(context).size.width * .235,),


                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      BuildItem(context, Colors.blue, '←', 81, MediaQuery.of(context).size.width * .235,),
                      BuildItem(context, Colors.black54, '-', 81, MediaQuery.of(context).size.width * .235,),
                      BuildItem(context, Colors.black54, '+', 81, MediaQuery.of(context).size.width * .235,),
                      BuildItem(context, Colors.black, '=', 162, MediaQuery.of(context).size.width * .235,),

                    ],
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


//←