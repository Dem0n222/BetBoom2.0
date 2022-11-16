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
    /// Логика взаимодействия для PageAddProvader.xaml
    /// </summary>
    public partial class PageAddProvader : Page
    {
        public PageAddProvader()
        {
            InitializeComponent();
            CantriCb.ItemsSource = DBEntities.GetContext()
              .Cantri.ToList();
            CiteCb.ItemsSource = DBEntities.GetContext()
                .Cite.ToList();
            StritCb.ItemsSource = DBEntities.GetContext()
                .Strit.ToList();
        }

        private void BacBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            DBEntities.GetContext().Provader.Add(new Provader()
            {
                NameProvader = NameTb.Text,
                IdCantri = Int32.Parse(CantriCb.SelectedValue.ToString()),
                IdCite = Int32.Parse(CiteCb.SelectedValue.ToString()),
                IdStrit = Int32.Parse(StritCb.SelectedValue.ToString()),

            });
            DBEntities.GetContext().SaveChanges();
            ClassMB.MBInformation("Успешно");
            NavigationService.Navigate(new PageProvader());
        }
    }
}
