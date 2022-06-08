using ControlStudy.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using DocumentFormat.OpenXml;
using System.Windows.Forms.DataVisualization.Charting;


namespace ControlStudy.Pages
{
    public partial class TeacherReportPage : Page
    {
        public TeacherReportPage()
        {
            InitializeComponent();

            chartGrades.ChartAreas.Add(new ChartArea("Main"));

            var currentSeries = new Series("Оценки")
            {
                IsValueShownAsLabel = true
            };

            chartGrades.Series.Add(currentSeries);
            
            groupCB.ItemsSource = ControlStudyEntities.GetContext().Groups.ToList();
            disciplineCB.ItemsSource = ControlStudyEntities.GetContext().Disciplines.ToList();
            chartCB.ItemsSource = Enum.GetValues(typeof(SeriesChartType));
        }

        public List<ReportGrades> FindGrades() // Высчитывает средний балл
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
                            reportGrades.Add(new ReportGrades(person, grades[i]));
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }

            return reportGrades;
        }

        private void SaveExcelClick(object sender, RoutedEventArgs e)
        {
            Excel.CreateTableExcel(groupCB, disciplineCB, semesterCB, FindGrades());
        }

        private void ChartSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Chart();
        }

        private void Chart() // Выводит диаграмму
        {
            try
            {
                if (groupCB.SelectedItem is Group currentGroup && disciplineCB.SelectedItem is Discipline currentDiscipline &&
                semesterCB.SelectedItem != null && chartCB.SelectedItem is SeriesChartType currentType)
                {
                    Series currentSeries = chartGrades.Series.FirstOrDefault();
                    currentSeries.ChartType = currentType;
                    currentSeries.Points.Clear();

                    var listPersons = FindGrades();

                    foreach (var item in listPersons)
                    {
                        currentSeries.Points.AddXY(item.Person.Family, item.Grades.AverageGrade);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
