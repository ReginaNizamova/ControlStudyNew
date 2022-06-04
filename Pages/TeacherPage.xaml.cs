using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;

namespace ControlStudy.Pages
{
    public partial class TeacherPage : Page
    {
        SessionTimer Timer = new SessionTimer(); //Включение таймера
        public TeacherPage(string loginNowUser)
        {
            InitializeComponent();

            teacherFrame.Navigate(new TeacherJournalPage());

            Application.Current.MainWindow.Closing += new CancelEventHandler(MainWindowClosing);
            void MainWindowClosing(object sender, CancelEventArgs e) // При закрытии формы сохраняет значение таймера
            {
                Timer.SaveTimeSession(loginNowUser);
            }
        }

        private void JournalClick(object sender, RoutedEventArgs e)
        {
            teacherFrame.Navigate(new TeacherJournalPage());
        }

        private void ReportClick(object sender, RoutedEventArgs e)
        {
            teacherFrame.Navigate(new TeacherReportPage());
        }
    }
}
