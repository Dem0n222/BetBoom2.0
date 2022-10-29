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
    /// Логика взаимодействия для PageEditStaff.xaml
    /// </summary>
    public partial class PageEditStaff : Page
    {
        public PageEditStaff(User user)
        {
            InitializeComponent();
            DataContext = user;
            RoleCb.ItemsSource = DBEntities.GetContext()
                .Role.ToList();
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            User user = DBEntities.GetContext().User.
               FirstOrDefault(s => s.IdUser == ClassVarible.IdUser);
            user.Login = LoginTb.Text;
            user.Password = PasswordTb.Text;
            user.IdRole = Int32.Parse(RoleCb.SelectedValue.ToString());
            DBEntities.GetContext().SaveChanges();
            ClassMB.MBInformation("Сотрудник успешно отредактирован");
            NavigationService.Navigate(new PageListSot());
        }

        private void InfoBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageListSot());
        }

        private void BacBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
