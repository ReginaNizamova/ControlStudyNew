using System.Linq;
using System.Windows.Controls;

namespace ControlStudy.Pages
{
    public partial class AdminJournalPage : Page
    {
        public AdminJournalPage()
        {
            InitializeComponent();
            ControlStudyEntities dataContext = new ControlStudyEntities();
            dataGridAdmin.ItemsSource = dataContext.Sessions.ToList();
        }
    }
}
