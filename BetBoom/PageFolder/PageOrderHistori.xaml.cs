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
    /// Логика взаимодействия для PageOrderHistori.xaml
    /// </summary>
    public partial class PageOrderHistori : Page
    {
        public PageOrderHistori(Order order)
        {
            InitializeComponent();
            DataContext = order;
        }


        private void BacBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
