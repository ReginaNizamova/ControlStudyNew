using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;


namespace ControlStudy.Pages
{
    public partial class AdminUsersPage : Page
    {
        public AdminUsersPage()
        {
            InitializeComponent();

            //dataGridAdmin.Items.Clear();
            dataGridAdmin.ItemsSource = ControlStudyEntities.GetContext().People.ToList();
        }

        private void AddClick(object sender, RoutedEventArgs e)
        {
            AddEditUserWindow window = new AddEditUserWindow(null, dataGridAdmin);
            window.ShowDialog();              
        }

        private void EditClick(object sender, RoutedEventArgs e)
        {
            AddEditUserWindow window = new AddEditUserWindow((sender as Button).DataContext as Person, dataGridAdmin);
            window.ShowDialog();
        }

        private void DeleteClick(object sender, RoutedEventArgs e)
        {
            var personDelete = dataGridAdmin.SelectedItems.Cast<Person>().ToList();

            if (MessageBox.Show($"Удалить следующие {personDelete.Count()} элементы?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question)==MessageBoxResult.Yes)
            {
                try
                {
                    ControlStudyEntities.GetContext().People.RemoveRange(personDelete);
                    ControlStudyEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    dataGridAdmin.ItemsSource = ControlStudyEntities.GetContext().People.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }    
        }
    }
}
