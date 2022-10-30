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
using System.Windows.Shapes;


namespace BetBoom.WindowsFolder
{
    /// <summary>
    /// Логика взаимодействия для ManeFramiWindow.xaml
    /// </summary>
    public partial class ManeFramiWindow : Window
    {
        public ManeFramiWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new PageFolder.PageAvto());

        }

        private void RollUpIm_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.MainWindow.WindowState = WindowState.Minimized;   // свернуть
        }

        private void LogOutIm_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            ClassFolder.ClassMB.ExitMessage();       // Закрыть
        }

        private void logquit_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new PageFolder.PageAvto());
            
        }

        private void MainFrame_Navigated(object sender, System.Windows.Navigation.NavigationEventArgs e)
        {

        }
    }
}
