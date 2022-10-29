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
    /// Логика взаимодействия для PageListSot.xaml
    /// </summary>
    public partial class PageListSot : Page
    {
        public PageListSot()
        {
            InitializeComponent();
            UserDG.ItemsSource = DBEntities.GetContext().User.ToList()
               .OrderBy(c => c.IdUser);
        }

        private void DelBtn_Click(object sender, RoutedEventArgs e)
        {
            if (UserDG.SelectedItem == null)
            {
                ClassMB.MBError("Выберите сотрудника для удаления");
            }
            else
            {
                try
                {
                    User user = UserDG.SelectedItem as User;
                    if (ClassMB.QuestionMessage($"Удалить выбранного сотрудника?"))
                    {
                        DBEntities.GetContext().User.Remove(user);
                        DBEntities.GetContext().SaveChanges();
                        UserDG.ItemsSource = DBEntities.GetContext().User.ToList()
              .OrderBy(c => c.IdUser);

                    }
                }
                catch (Exception ex)
                {
                    ClassMB.MBError(ex);
                }
            }
        }

        private void EditBtn_Click(object sender, RoutedEventArgs e)
        {
            if (UserDG.SelectedItem == null)
            {
                ClassMB.MBError("Выберите сотрудника для редактирования");
            }

            User user = UserDG.SelectedItem as User;
            ClassVarible.IdUser = user.IdUser;
            this.NavigationService.Navigate(new PageEditStaff(UserDG.SelectedItem as User));
          
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageAddSot());
        }
    }
}
