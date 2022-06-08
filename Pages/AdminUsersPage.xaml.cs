using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace ControlStudy.Pages
{
    public partial class AdminUsersPage : Page
    {
        public AdminUsersPage()
        {
            InitializeComponent();

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

        private bool Filter(object item)
        {
            if (string.IsNullOrEmpty(filterText.Text))
                return true;
            else
                return ((item as Person).Role.Role1.IndexOf(filterText.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    (item as Person).LoginUser.IndexOf(filterText.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    (item as Person).Family.IndexOf(filterText.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    (item as Person).Group.Group1.IndexOf(filterText.Text, StringComparison.OrdinalIgnoreCase) >= 0);
        }

        private void FilterTextTextChanged(object sender, TextChangedEventArgs e) //Фильтр
        {
            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(dataGridAdmin.Items);
            view.Filter = Filter;
            CollectionViewSource.GetDefaultView(dataGridAdmin.Items).Refresh();
        }
    }
}
