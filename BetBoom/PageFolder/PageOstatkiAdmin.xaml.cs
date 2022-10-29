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
using BetBoom.DataFolder;
using BetBoom.ClassFolder;

namespace BetBoom.PageFolder
{
    /// <summary>
    /// Логика взаимодействия для PageOstatkiAdmin.xaml
    /// </summary>
    public partial class PageOstatkiAdmin : Page
    {
        public PageOstatkiAdmin()
        {
            InitializeComponent();
            OstatkDG.ItemsSource = DBEntities.GetContext().Produkts.ToList().
                OrderBy(c => c.IdProduk);
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            Produkts product = OstatkDG.SelectedItem as Produkts;
            product.Remains = Convert.ToInt16(OstatkiTb.Text);
            DBEntities.GetContext().SaveChanges();
            OstatkDG.ItemsSource = DBEntities.GetContext().Produkts.ToList().
                 OrderBy(c => c.IdProduk);
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

        private void ListBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageAvto());
        }
    }
}
