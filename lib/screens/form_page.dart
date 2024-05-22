import 'package:employees/shared_component/custom_textFormField.dart';
import 'package:employees/shared_component/text_in_app.dart';
import 'package:employees/screens/show_data.dart';
import 'package:employees/sql_helper.dart';
import 'package:flutter/material.dart';



class EmployeeFormPage extends StatefulWidget {
  const EmployeeFormPage({super.key});

  @override
  State<EmployeeFormPage> createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  var employeeNameController = TextEditingController();
  var employeeSalaryController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidate = false;
  SqlHelper sql = SqlHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            textInApp(text: "Employee Store",color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 40),
            const SizedBox(height: 20,),
            textInApp(text: "Add Employee",fontSize: 30,color: Colors.blueAccent.shade200),
            const SizedBox(height: 7,),
            textInApp(text: "Enter Employee data to save it",color: Colors.blueAccent.shade100),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 22,right: 22,top: 50),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                   BoxShadow(
                      color: Colors.white60,
                      spreadRadius: 2,
                     offset: Offset(0,3)
                   ),
                ]
              ),
              child: Form(
                key: formKey,
                autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultTextFormField(
                      controller:employeeNameController ,
                      validatorText: "Employee Name",
                      label: "Employee Name",
                    ),
                    DefaultTextFormField(
                      controller:employeeSalaryController ,
                      keyboardType: TextInputType.number,
                      validatorText: "Employee Salary",
                      label: "Employee Salary",
                      textInputAction: TextInputAction.done,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                              onPressed: ()  async {
                                setState(() {
                                  autoValidate = true;
                                });
                                if(formKey.currentState!.validate())
                                  {
                                    num? salary = num.tryParse(employeeSalaryController.text);
                                    if (salary != null)
                                    {
                                      sql.insertToDatabase(name:employeeNameController.text,salary: salary );
                                    }
                                    employeeNameController.clear();
                                    employeeSalaryController.clear();
                                    setState(() {
                                      autoValidate = false;
                                    });
                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShowEmployeesData(),));

                                  }
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                              ),
                              child: textInApp(
                                  text: "Save",
                                 color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold
                              )),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
     employeeNameController.dispose();
     employeeSalaryController.dispose();
    super.dispose();
  }
}
