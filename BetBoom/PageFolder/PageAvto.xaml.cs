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
    /// Логика взаимодействия для PageAvto.xaml
    /// </summary>
    public partial class PageAvto : Page
    {
       
        public PageAvto()
        {
            InitializeComponent();
            
        }

        private void InBtn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(LoginTB.Text))
            {
                ClassMB.MBError("Ввндите логин");
                LoginTB.Focus();
            }
            if (string.IsNullOrEmpty(PasswordTB.Password))
            {
                ClassMB.MBError("Ввндите пароль");
                PasswordTB.Focus();
            }
            else
            {
                try
                {
                    var user = DBEntities.GetContext().User.FirstOrDefault
                        (u => u.LoginUser == LoginTB.Text);
                    if (user == null)
                    {
                        ClassMB.MBError("Пользователь не найден");
                        LoginTB.Focus();
                        return;
                    }
                    if (user.Password != PasswordTB.Password)
                    {
                        ClassMB.MBError("Введен не правильный пароль");
                        PasswordTB.Focus();
                        return;
                    }
                    else
                    {
                        switch (user.IdRole)
                        {
                            case 1:
                                NavigationService.Navigate(new PageOstki());
                                
                                break;
                            case 2:
                                
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    ClassMB.MBError(ex);
                }
            }


        }
    }
}
