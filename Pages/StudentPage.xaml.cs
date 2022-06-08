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

            if (semester == 0)
                semester = 1;
            else
                semester = 2;

            if(semesterCB.SelectedItem != null && disciplineCB.SelectedItem != null)
            {
                dataGridProgress.ItemsSource = FindProgress().Where(x => x.Discipline == disciplineCB.SelectedItem && x.Semester == semester).ToList();
            }
        }
    }
}
