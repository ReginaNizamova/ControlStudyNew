
namespace ControlStudy.Classes
{
    public class ReportGrades
    { 
        public ReportGrades(Person Person, Grades Grades)
        {
            this.Person = Person;
            this.Grades = Grades;
        }

        public Person Person { get; set; }
        public Grades Grades { get; set; }
    }

    public class Grades
    {
        public Grades(double AverageGrade, int CountGrade)
        {
            this.AverageGrade = AverageGrade;
            this.CountGrade = CountGrade;
        }

        public  double AverageGrade { get; set; }
        public  int CountGrade { get; set; }
    }
}
