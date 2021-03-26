public class EmployeeDetails {
    private int age;
    private float increment;
    private int ID;
    private double salary;
    private String lastname;
    private String firstname;


    public EmployeeDetails(String firstname, String lastname, int age,
                           double salary) {

        super();
        this.firstname = firstname;
        this.lastname = lastname;
        this.ID = 0;
        this.age = age;

        this.salary = salary;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setsalary(double salary) {
        this.salary = salary;
    }

    public String getfirstname() {
        return firstname;
    }

    public String getlastname() {
        return lastname;
    }

    public int getID() {
        return ID;
    }

    public double getsalary() {
        return salary;
    }


}
   /* public static double calculateIncrement(double getsalary) {

        double increment = 0;
        EmployeeDetails employee = new EmployeeDetails();
        employee.getEmployeeDetails();
        if(employee.salary< 30000){
            increment = 1500;
        }else{
            increment = 2000;
        }
        return increment;
    }


    EmployeeDetails employee1 = new EmployeeDetails("Jeff","Jeffson",1,28,28000); //Test Code
    EmployeeDetails employee2 = new EmployeeDetails("Andy","Anderson",2,29,29000); //Test Code
    EmployeeDetails employee3 = new EmployeeDetails("Per","Persson",3,30,30000); //Test Code
    EmployeeDetails employee4 = new EmployeeDetails("Hans","Hansson",4,31,31000); //Test Code
*/






/*public class EmployeeDetails {
    public EmployeeDetails(String fname, String lname, int id, int age, int sal) {
    }

    public int getID() {
        final int i = 0;
        return i;
    }
}
*/

