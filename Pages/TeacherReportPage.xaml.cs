using ControlStudy.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using DocumentFormat.OpenXml;


namespace ControlStudy.Pages
{
    public partial class TeacherReportPage : Page
    {
        public TeacherReportPage()
        {
            InitializeComponent();

            groupCB.ItemsSource = ControlStudyEntities.GetContext().Groups.ToList();
            disciplineCB.ItemsSource = ControlStudyEntities.GetContext().Disciplines.ToList();
        }

        private List<ReportGrades> FindGrades()
        {
            List<ReportGrades> reportGrades = new List<ReportGrades>();
            var group = (Group)groupCB.SelectedItem;
            var discipline = (Discipline)disciplineCB.SelectedItem;
            var semester = semesterCB.SelectedIndex;

            if (semester == 0)
                semester = 1;
            else
                semester = 2;

            if (group != null && discipline != null)
            {
                var persons = ControlStudyEntities.GetContext().People.Where(p => p.Group.Group1 == group.Group1).ToList();

                List<Grades> grades = new List<Grades>();
               

                for (int i = 0; i < persons.Count; i++)
                {
                    try
                    {
                        var person = persons[i];
                        var gradePerson = ControlStudyEntities.GetContext().Progresses.Where(p => p.IdPerson == person.IdPerson && p.Discipline.Discipline1 == discipline.Discipline1 && p.Semester == semester).Select(p => p.Grade);

                        if (gradePerson.Any())
                        {
                            grades.Add(new Grades(Math.Round(gradePerson.Average(), 2), gradePerson.Count()));
                            reportGrades.Add(new ReportGrades(person, grades[i]));
                        }
                        else
                        {
                            grades.Add(new Grades(0, 0));
                            reportGrades.Add(new ReportGrades(person, null));
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }

                dataGridGrades.ItemsSource = reportGrades;
            }
            return reportGrades;
        }

        private void GroupCBSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FindGrades();
        }

        private void DisciplineCBSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FindGrades();
        }

        private void SemesterCBSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FindGrades();
        }

        private void GraphicClick(object sender, RoutedEventArgs e)
        {
            Graphic.CreateGraphic(groupCB, disciplineCB, semesterCB, FindGrades());
        }
    }
}
