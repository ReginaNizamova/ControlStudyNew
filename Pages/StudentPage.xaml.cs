using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Data;
using System.Linq;
using System.Collections.Generic;

namespace ControlStudy
{
    public partial class StudentPage : Page
    {
        readonly SessionTimer Timer = new SessionTimer(); //Включение таймера
        ControlStudyEntities dataContext = new ControlStudyEntities();

        public StudentPage(string loginNowUser)
        {
            InitializeComponent();

            List<Progress> progresses = new List<Progress>();

            var idPerson = dataContext.Users.Where(p => p.LoginUser == loginNowUser).Select(p => p.IdPerson).FirstOrDefault();

            progresses = dataContext.Progresses.Where(p => p.IdPerson == idPerson).ToList();

            dataGridProgress.Items.Clear();
            dataGridProgress.ItemsSource = progresses;

            Application.Current.MainWindow.Closing += new CancelEventHandler(MainWindowClosing);
            void MainWindowClosing(object sender, CancelEventArgs e) // При закрытии формы сохраняет значение таймера
            {
                Timer.SaveTimeSession(loginNowUser);
            }
        }
    }
}
