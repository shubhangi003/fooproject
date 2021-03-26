
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.ArrayList;
import java.util.List;

public class EmployeeSystemTest {

    static EmployeeSystem  ES1;
    @BeforeAll
    public static void setEmployeeslist() {
        ES1 = new EmployeeSystem();
        EmployeeDetails employee1 = new EmployeeDetails("Jeff", "Jeffson", 28, 28000);
        EmployeeDetails employee2 = new EmployeeDetails("Andy", "Anderson", 29, 29000);
        ES1.addEmployee(employee1);
        ES1.addEmployee(employee2);

        employee1.setID(ES1.getNextID());
        employee2.setID(ES1.getNextID());

    }


    @Test
    public void testEmployeeListInit() {
        List<EmployeeDetails> employeeslist = new ArrayList<>();
        Assertions.assertTrue(employeeslist.isEmpty());
        Assertions.assertTrue(employeeslist.size() == 0);
    }

    @Test
    public void addEmployeeTest() {
        EmployeeSystem ES = new EmployeeSystem();
        EmployeeDetails employee1 = new EmployeeDetails("Jeff", "Jeffson", 28, 28000);
        employee1.setID(ES.getNextID());
        Assertions.assertTrue(ES.addEmployee(employee1));
        EmployeeDetails employee2 = new EmployeeDetails("Andy", "Anderson", 29, 29000); //Test Code
        employee2.setID(ES.getNextID());
        Assertions.assertTrue(ES.addEmployee(employee2));
        Assertions.assertEquals(2, ES.NoOfEmployees());
    }

    @Test
    public void removeEmployee() {
        EmployeeSystem ES = new EmployeeSystem();
        EmployeeDetails employee1 = new EmployeeDetails("Jeff", "Jeffson", 28, 28000);
        EmployeeDetails employee2 = new EmployeeDetails("Andy", "Anderson", 29, 29000);
        employee1.setID(ES.getNextID());
        employee2.setID(ES.getNextID());
        ES.addEmployee(employee1);
        ES.addEmployee(employee2);
        Assertions.assertEquals(2, ES.NoOfEmployees());
        Assertions.assertTrue(ES.removeEmployee(employee2));
        Assertions.assertEquals(1, ES.NoOfEmployees());
    }

    @Test
    public void testEmployeeDetailsbyID() {
        EmployeeSystem ES = new EmployeeSystem();
        EmployeeDetails employee1 = new EmployeeDetails("Jeff", "Jeffson", 28, 28000);
        int ID = EmployeeSystem.getNextID();
        employee1.setID(ID);
        Assertions.assertEquals(ID, employee1.getID());
        Assertions.assertEquals("Jeff",employee1.getfirstname());
        Assertions.assertEquals("Jeffson",employee1.getlastname());

    }

    @Test
    public void testIncrementforAll() {
        EmployeeSystem ES = new EmployeeSystem();
        EmployeeDetails employee1 = new EmployeeDetails("Jeff", "Jeffson", 28, 28000);
        EmployeeDetails employee2 = new EmployeeDetails("Andy", "Anderson", 29, 29000);
        ES.addEmployee(employee1);
        ES.addEmployee(employee2);
        ES.IncrementForAll(-10);
        Assertions.assertEquals(28000, employee1.getsalary());
        ES.IncrementForAll(100);
        Assertions.assertEquals(28000, employee1.getsalary());
        ES.IncrementForAll(10);
        Assertions.assertEquals(30800, employee1.getsalary());
        Assertions.assertEquals(31900,employee2.getsalary());


    }

    @Test
    public void testIncrementForOne() {
        EmployeeSystem ES = new EmployeeSystem();
        EmployeeDetails employee1 = new EmployeeDetails("Jeff", "Jeffson", 28, 28000);
        EmployeeDetails employee2 = new EmployeeDetails("Andy", "Anderson", 29, 29000);
        employee1.setID(ES.getNextID());
        employee2.setID(ES.getNextID());
        ES.addEmployee(employee1);
        ES.addEmployee(employee2);
        ES.IncrementForOne(employee1.getID(),10);
        Assertions.assertEquals(30800, employee1.getsalary());
        Assertions.assertEquals(29000,employee2.getsalary());
    }

    //I just give try for doing this parameterized test
    @ParameterizedTest
    @CsvSource({"1,10,30800"})
    public void testIncrementForOneE(int id,int percent,double expected) {

        ES1.IncrementForOne(id, percent);
        EmployeeDetails employee1 = ES1.getEmployee(id);
        Assertions.assertEquals(expected, employee1.getsalary());
    }


}



