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
        }

        private void ListBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageOstki());
        }
    }
}
