using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using BetBoom.ClassFolder;
using BetBoom.DataFolder;

namespace BetBoom.PageFolder
{
    /// <summary>
    /// Логика взаимодействия для PagePrivoz.xaml
    /// </summary>
    public partial class PagePrivoz : Page
    {
        public PagePrivoz()
        {
            InitializeComponent();
            OstatkDG.ItemsSource = DBEntities.GetContext().Produkts.ToList().
                 OrderBy(c => c.IdProdukt);
        }

        private void ListBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageOstki());

        }

        private void DbBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageAdd());
        }

        private void LoginTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                OstatkDG.ItemsSource = DBEntities.GetContext().Produkts.Where
                (u => u.NameProdukt.StartsWith(LoginTb.Text)).ToList();
            }
            catch (Exception ex)
            {
                ClassMB.MBError(ex);
            }
        }
    }
}
