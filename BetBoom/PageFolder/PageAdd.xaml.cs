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
    /// Логика взаимодействия для PageAdd.xaml
    /// </summary>
    public partial class PageAdd : Page
    {
        public PageAdd()
        {
            InitializeComponent();
            ProductCb.ItemsSource = DBEntities.GetContext()
                .Produkts.ToList();
            SuppliersCb.ItemsSource = DBEntities.GetContext()
                .Provider.ToList();
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ProductCb.SelectedItem == null)
            {
                ClassMB.MBError("Выберите тавар");
                ProductCb.Focus();
            }
            if (SuppliersCb.SelectedItem == null)
            {
                ClassMB.MBError("Выберите поставщика");
                SuppliersCb.Focus();
            }
            if (string.IsNullOrEmpty(quantityTb.Text))
            {
                ClassMB.MBError("Введите количество");
                quantityTb.Focus();
            }
            else
            {
                AddOrder();
                ClassMB.MBInformation("Заказ создан");
                NavigationService.GoBack();

            }
        }
        private void AddOrder()
        {
            var addOrder = new Order()
            {
                IdProdukt = Int32.Parse(ProductCb.SelectedValue.ToString()),
                DataOrder = DateTime.Now,
                QuantityOrder = Convert.ToInt32(quantityTb.Text),
                IdProvider = Int32.Parse(SuppliersCb.SelectedValue.ToString()),
               

            };
            DBEntities.GetContext().Order.Add(addOrder);
            DBEntities.GetContext().SaveChanges();
        }

        private void HistorBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageHistori());
        }
    }
}
