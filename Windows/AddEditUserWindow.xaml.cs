using System;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;

namespace ControlStudy
{
    public partial class AddEditUserWindow : Window
    {
        private Person _currentPerson = new Person();
        private DataGrid _dataGrid;

        public AddEditUserWindow(Person selectedPerson, DataGrid dataGridAdmin)
        {
            InitializeComponent();

            if (selectedPerson != null)
                _currentPerson = selectedPerson;


            comboBoxGroup.ItemsSource = ControlStudyEntities.GetContext().Groups.ToList();
            comboBoxRole.ItemsSource = ControlStudyEntities.GetContext().Roles.ToList();
            _dataGrid = dataGridAdmin;
            DataContext = _currentPerson;
        }

        private void AddEditUserClick(object sender, RoutedEventArgs e) //Добавление/изменение пользователя
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentPerson.Family) || string.IsNullOrWhiteSpace(_currentPerson.Name)
              || string.IsNullOrWhiteSpace(_currentPerson.Patronimic))
                errors.AppendLine("ФИО");
            if (string.IsNullOrWhiteSpace(_currentPerson.Role.Role1))
                errors.AppendLine("Роль");
            if (_currentPerson.Group.Group1 == null)
                errors.AppendLine("Группа (если роль не студент выбрать пустую строку)");
            if (string.IsNullOrWhiteSpace(_currentPerson.LoginUser))
                errors.AppendLine("Логин");
            if (string.IsNullOrWhiteSpace(_currentPerson.Password))
                errors.AppendLine("Пароль");

            if (CheckPass(passwordPersonText.Text) == false)
                errors.AppendLine("В пароле использованы не все необходимые знаки");

            if (CheckFamily(familyText.Text, nameText.Text, patronimicText.Text) == false)
                errors.AppendLine("Введите корректное ФИО");


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentPerson.IdPerson == 0)
                ControlStudyEntities.GetContext().People.Add(_currentPerson);

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

        public static bool CheckPass(string input) // Проверка пароля
        {
            var minMaxChar = new Regex(@".{8}");
            var number = new Regex(@"[0-9]+");
            var upperChar = new Regex(@"[A-Z]");
            var lowerChar = new Regex(@"[a-z]");
            var symbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");

            if (!lowerChar.IsMatch(input))
                return false;

            else if (!upperChar.IsMatch(input))
                return false;

            else if (!minMaxChar.IsMatch(input))
                return false;

            else if (!number.IsMatch(input))
                return false;

            else if (!symbols.IsMatch(input))
                return false;

                return true;
        }

        public static bool CheckFamily(string family, string name, string patronimic) // Проверка ФИО
        {
            var minMaxChar = new Regex(@".{2}");
            var number = new Regex(@"[0-9]+");
            var upperChar = new Regex(@"[А-Я]");
            var lowerChar = new Regex(@"[а-я]");
            var symbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");

            if (!lowerChar.IsMatch(family))
                return false;
            else if (!lowerChar.IsMatch(name))
                return false;
            else if (!lowerChar.IsMatch(patronimic))
                return false;

            else if (!upperChar.IsMatch(family))
                return false;
            else if (!upperChar.IsMatch(name))
                return false;
            else if (!upperChar.IsMatch(patronimic))
                return false;

            else if (!minMaxChar.IsMatch(family))
                return false;
            else if (!minMaxChar.IsMatch(name))
                return false;
            else if (!minMaxChar.IsMatch(patronimic))
                return false;

            else if (number.IsMatch(family))
                return false;
            else if (number.IsMatch(name))
                return false;
            else if (number.IsMatch(patronimic))
                return false;

            else if (symbols.IsMatch(family))
                return false;
            else if (symbols.IsMatch(name))
                return false;
            else if (symbols.IsMatch(patronimic))
                return false;

            return true;
        }

        private void WindowClosed(object sender, EventArgs e)//Обновляет DataGrid 
        {
            ControlStudyEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            _dataGrid.ItemsSource = ControlStudyEntities.GetContext().People.ToList();
        }
    }
}    
