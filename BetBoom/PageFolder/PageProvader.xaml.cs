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
    /// Логика взаимодействия для PageProvader.xaml
    /// </summary>
    public partial class PageProvader : Page
    {
        public PageProvader()
        {
            InitializeComponent();
            ProvaderDG.ItemsSource = DBEntities.GetContext().Provader.ToList()
               .OrderBy(c => c.IdProvader);
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageAddProvader());
        }

       

        private void DelBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ProvaderDG.SelectedItem == null)
            {
                ClassMB.MBError("Выберите поставщика для удаления");
            }
            else
            {
                try
                {
                    Provader provader = ProvaderDG.SelectedItem as Provader;
                    if (ClassMB.QuestionMessage($"Удалить выбранного поставщика?"))
                    {
                        DBEntities.GetContext().Provader.Remove(provader);
                        DBEntities.GetContext().SaveChanges();
                        ProvaderDG.ItemsSource = DBEntities.GetContext().Provader.ToList()
              .OrderBy(c => c.IdProvader);

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
