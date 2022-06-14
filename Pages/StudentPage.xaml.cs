using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using System;
using ControlStudy.Pages;

namespace ControlStudy
{
    public partial class StudentPage : Page
    {
        readonly SessionTimer Timer = new SessionTimer(); //Включение таймера
        string login;

        public StudentPage(string loginNowUser)
        {
            InitializeComponent();

            login = loginNowUser;
            dataGridProgress.ItemsSource = FindProgress();
            disciplineCB.ItemsSource = ControlStudyEntities.GetContext().Disciplines.ToList();

            Application.Current.MainWindow.Closing += new CancelEventHandler(MainWindowClosing);
            void MainWindowClosing(object sender, CancelEventArgs e) // При закрытии формы сохраняет значение таймера
            {
                Timer.SaveTimeSession(loginNowUser);
            }
        }

        private List<Progress> FindProgress()
        {
            int idPerson = ControlStudyEntities.GetContext().People.Where(p => p.LoginUser == login).Select(p => p.IdPerson).FirstOrDefault();
            return ControlStudyEntities.GetContext().Progresses.Where(p => p.IdPerson == idPerson).ToList();
        }

        private void ComboBoxSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var semester = semesterCB.SelectedIndex;  

            switch (semesterCB.SelectedIndex)
            {
                case 0:
                {
                    semester = 1;
                    break;
                }

                case 1:
                {
                    semester = 2;
                    break;
                }

                case 2:
                {
                    semester = 3;
                    break;
                }

                case 3:
                {
                    semester = 4;
                    break;
                }

                case 4:
                {
                    semester = 5;
                    break;
                }

                case 5:
                {
                    semester = 6;
                    break;
                }

                case 6:
                {
                    semester = 7;
                    break;
                }

                case 7:
                {
                    semester = 8;
                    break;
                }

                case 8:
                {
                    semester = 9;
                    break;
                }

                case 9:
                {
                    semester = 10;
                    break;
                }

            }

            if(semesterCB.SelectedItem != null && disciplineCB.SelectedItem != null)
                dataGridProgress.ItemsSource = FindProgress().Where(x => x.Semester == semester && x.Discipline == disciplineCB.SelectedItem).ToList();
        }
    }
}
