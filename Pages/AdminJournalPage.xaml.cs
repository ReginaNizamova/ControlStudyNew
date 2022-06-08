using System;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Data;

namespace ControlStudy.Pages
{
    public partial class AdminJournalPage : Page
    {
        public AdminJournalPage()
        {
            InitializeComponent();

            dataGridAdmin.ItemsSource = ControlStudyEntities.GetContext().Sessions.ToList();
        }

        private bool Filter(object item)
        {
            if (string.IsNullOrEmpty(filterText.Text))
                return true;
            else
                return ((item as Session).DateSession.ToShortDateString().IndexOf(filterText.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    (item as Session).Person.Family.IndexOf(filterText.Text, StringComparison.OrdinalIgnoreCase) >= 0);
        }

        private void FilterTextTextChanged(object sender, TextChangedEventArgs e) //Фильтр
        {
            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(dataGridAdmin.Items);
            view.Filter = Filter;
            CollectionViewSource.GetDefaultView(dataGridAdmin.Items).Refresh();
        }
    }
}
