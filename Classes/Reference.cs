namespace ControlStudy.Classes
{
    public class Reference   
    {
        public Reference(int Semester, string Dates)
        {
            this.Semester = Semester;
            this.Dates = Dates;
        }

        public int Semester { get; set; }
        public string Dates { get; set; }
    }
}
