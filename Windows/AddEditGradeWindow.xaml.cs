using System;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;

namespace ControlStudy
{
    public partial class AddEditGradeWindow : Window
    {
        private  Progress _currentProgress = new Progress();
        private  DataGrid _dataGrid;

        public AddEditGradeWindow(Progress selectedProgress, DataGrid dataGridAdmin)
        {
            InitializeComponent();

            if (selectedProgress != null)
                _currentProgress = selectedProgress;

            DataContext = _currentProgress;

            if (_currentProgress.DateGrade == DateTime.Parse("01.01.0001 0:00:00"))
                  _currentProgress.DateGrade = DateTime.Today.Date;

            comboBoxGroup.ItemsSource = ControlStudyEntities.GetContext().Groups.ToList();
            comboBoxDiscipline.ItemsSource = ControlStudyEntities.GetContext().Disciplines.ToList();
          
            _dataGrid = dataGridAdmin;
        }

        private void AddEditGradeClick(object sender, RoutedEventArgs e) //Добавление/изменение оценки
        {
          
            StringBuilder errors = new StringBuilder();

            if (comboBoxPerson.Text == "")
                errors.AppendLine(" - фамилию");

            if (comboBoxDiscipline.Text == "")
                errors.AppendLine(" - дисциплину");

            if (comboBoxGroup.Text == "" || comboBoxGroup.Text == " ")
                errors.AppendLine(" - группу");

            if (_currentProgress.DateGrade == null)
                errors.AppendLine(" - дату");

            if (CheckGrade(_currentProgress.Grade.ToString()) == false)
               errors.AppendLine(" - оценку");

          
            if (errors.Length > 0)
            {
                MessageBox.Show("Введите: \n" + errors.ToString());
                return;
            }

            int idPerson = ControlStudyEntities.GetContext().People.Where(c => c.Family == comboBoxPerson.Text).Select(c => c.IdPerson).FirstOrDefault();
            DateTime startDateSemester1 = DateTime.Parse("01.09.2021 0:00:00");
            DateTime endDateSemester1 = DateTime.Parse("31.12.2021 0:00:00");

            DateTime startDateSemester2 = DateTime.Parse("01.01.2022 0:00:00");
            DateTime endDateSemester2 = DateTime.Parse("30.06.2022 0:00:00");
            int semester = 0;

            if (_currentProgress.DateGrade.Date > startDateSemester1 && _currentProgress.DateGrade.Date < endDateSemester1)
                semester = 1;
            else if (_currentProgress.DateGrade.Date > startDateSemester2 && _currentProgress.DateGrade.Date < endDateSemester2)
                semester = 2;

            switch (comboBoxGroup.Text)
            {
                case "115":
                {
                    if (semester == 1)
                        semester = 1;

                    else if (semester == 2)
                        semester = 2;
                    break;
                }

                case "215":
                {
                    if (semester == 1)
                        semester = 3;

                    else if (semester == 2)
                        semester = 4;
                    break;
                }

                case "315":
                {
                    if (semester == 1)
                        semester = 5;

                    else if (semester == 2)
                        semester = 6;
                    break;
                }

                case "415":
                {
                    if (semester == 1)
                        semester = 7;

                    else if (semester == 2)
                        semester = 8;
                    break;
                }

                case "515":
                {
                    if (semester == 1)
                        semester = 9;

                    else if (semester == 2)
                        semester = 10;
                    break;
                }
            }

            _currentProgress.IdPerson = idPerson;
            _currentProgress.Semester = semester;

            if (_currentProgress.IdProgress == 0)
                ControlStudyEntities.GetContext().Progresses.Add(_currentProgress);

            try
            {
                ControlStudyEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void WindowClosed(object sender, EventArgs e)//Обновляет DataGrid 
        {
            ControlStudyEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            _dataGrid.ItemsSource = ControlStudyEntities.GetContext().Progresses.ToList();
        }

        private int FillIdGroup (string valueComboBoxGroup) 
        {
            int id = 0;

            if (valueComboBoxGroup == "1")
                id = 1;

            if (valueComboBoxGroup == "2")
                id = 2;

            if (valueComboBoxGroup == "3")
                id = 3;

            if (valueComboBoxGroup == "4")
                id = 4;

            if (valueComboBoxGroup == "5")
                id = 5;

            if (valueComboBoxGroup == "0")
                id = 6;

            return id;
        }

        private void СomboBoxGroupOnSelectionChanged(object sender, SelectionChangedEventArgs e) // Выбор значений для textName (ФИО) в зависимости от значения comboBoxGroup
        {
            string valueComboBoxGroup = comboBoxGroup.SelectedIndex.ToString();

            comboBoxPerson.Items.Clear();
            int idGroup = FillIdGroup(valueComboBoxGroup);

            if(idGroup != 6)
            {
                var result = from Person in ControlStudyEntities.GetContext().People
                             where Person.IdGroup == idGroup
                             select new
                             {
                                 Person.Family,
                                 Person.Name,
                                 Person.IdGroup,
                                 Person.IdPerson
                             };

                result.ToList();

                foreach (var item in result)
                {
                    comboBoxPerson.Items.Add(item.Family);
                    idStudent.Text = Convert.ToString(item.IdPerson);
                }
            }
        }

        public static bool CheckGrade(string grade)
        {
            if (grade == null)
                grade = "";

            var minMaxChar = new Regex(@"^(?=.{1}$)");
            var number = new Regex(@"[2-5]+");
            var upperChar = new Regex(@"[A-Z]");
            var lowerChar = new Regex(@"[a-z]");
            var symbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");

            if (lowerChar.IsMatch(grade))
                return false;

            else if (upperChar.IsMatch(grade))
                return false;

            else if (!number.IsMatch(grade))
                return false;

            else if (!minMaxChar.IsMatch(grade))
                return false;

            else if (symbols.IsMatch(grade))
                return false;

            return true;
        }
    }
}
