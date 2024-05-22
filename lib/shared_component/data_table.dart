import 'package:employees/models/employee_model.dart';
import 'package:employees/shared_component/text_in_app.dart';
import 'package:flutter/material.dart';
import '../helpers/sql_helper.dart';

class EmployeesTable extends StatefulWidget {
   const EmployeesTable({super.key});

  @override
  State<EmployeesTable> createState() => _EmployeesTableState();
}

class _EmployeesTableState extends State<EmployeesTable> {
  bool sortAscend = true;
  List<Employee> employees = [];
  final SqlHelper sqlHelper = SqlHelper();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await sqlHelper.createDatabase();
    List<Employee> data = await sqlHelper.getDataFromDatabase();
    setState(() {
      employees = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  DataTable(
      sortAscending: sortAscend,
      sortColumnIndex: 1,
      dataRowColor: MaterialStateProperty.all(Colors.blueAccent),
      headingRowColor: MaterialStateProperty.all(Colors.blueGrey),
      border: TableBorder.all(color: Colors.black,),
      columns:  [
        DataColumn(label: textInApp(text: "Employee Name",fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),tooltip: "Employee Name"),
        DataColumn(
          tooltip: "Employee Salary",
          label: textInApp(text: "Employee Salary",fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
          numeric: true,
          onSort:(columnIndex, ascending) {
            sortAscend = ascending;
            setState(() {});
            if(ascending)
            {
              employees.sort((a,b)=> a.salary.compareTo(b.salary));
            }
            else
            {
              employees.sort((b,a)=> a.salary.compareTo(b.salary));
            }
          },
        ),
      ],
      rows:  getEmployees(employees: employees),
    );
  }

  List<DataRow> getEmployees({required List<Employee> employees}) {
    return employees.map((employee) {
      return DataRow(cells: [
        DataCell(textInApp(text: employee.name, fontSize: 25)),
        DataCell(textInApp(text: employee.salary.toString(), fontSize: 25)),
      ]);
    }).toList();
  }
}
