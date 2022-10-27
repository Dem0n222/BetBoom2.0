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
    /// Логика взаимодействия для PageHistori.xaml
    /// </summary>
    public partial class PageHistori : Page
    {
        public PageHistori()
        {
            InitializeComponent();
            OstatkDG.ItemsSource = DBEntities.GetContext().Order.ToList()
                .OrderBy(c => c.IdOrder);
        }

        private void BtnBac_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void DbBtn_Click(object sender, RoutedEventArgs e)
        {
            Order order = OstatkDG.SelectedItem as Order;
            ClassVarible.IdOrder = order.IdOrder;
            this.NavigationService.Navigate(new PageOrderHistori(OstatkDG.SelectedItem as Order));
           
        }
    }
}
