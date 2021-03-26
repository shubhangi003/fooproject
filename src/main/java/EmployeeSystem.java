import java.util.ArrayList;
import java.util.List;


public class EmployeeSystem {

    private List<EmployeeDetails> employeeslist;
    private static int Counter = 0;

    public EmployeeSystem() {
        employeeslist = new ArrayList<>();

    }

    public int NoOfEmployees() {
        return employeeslist.size();

    }

    public static int getNextID() {
        return ++Counter;

    }

    public boolean addEmployee(EmployeeDetails employee) {

        return employeeslist.add(employee);
    }

    public boolean removeEmployee(EmployeeDetails employee) {

        return employeeslist.remove(employee);

    }


    public void IncrementForAll(int percentage) {
        if (percentage>0 && percentage<100) {

            for (int i = 0; i < employeeslist.size(); i++) {
                EmployeeDetails employee = employeeslist.get(i);
                double currentSalary = employee.getsalary();
                double newSalary = currentSalary + (currentSalary * percentage) / 100;
                employee.setsalary(newSalary);
            }
        }

    }


    public void IncrementForOne(int id,int percentage) {
        for(int i=0;i<employeeslist.size();i++) {
            EmployeeDetails employee = employeeslist.get(i);

            int specificID = employee.getID();
            if (specificID == id) {

                double currentSalary = employee.getsalary();
                double newSalary = currentSalary + (currentSalary * percentage) / 100;
                employee.setsalary(newSalary);
            }
        }
    }

    public EmployeeDetails getEmployee(int id) {
        for(int i=0;i<employeeslist.size();i++) {
            EmployeeDetails employee = employeeslist.get(i);
            int specificID = employee.getID();
            if (specificID == id) {

                return employee;
            }
        }
        return null;
    }
}

