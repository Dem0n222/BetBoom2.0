using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace BetBoom.ClassFolder
{
    internal class ClassMB
    {
        public static void MBError(Exception text)
        {
            MessageBox.Show(text.Message, "Ошибка", MessageBoxButton.OK,
                MessageBoxImage.Error);
        }
        public static void MBError(string text)
        {
            MessageBox.Show(text, "Ошибка", MessageBoxButton.OK,
                MessageBoxImage.Error);
        }
        public static void MBInformation(string textMessage)
        {
            MessageBox.Show(textMessage, "Информация", MessageBoxButton.OK,
                MessageBoxImage.Information);
        }
        public static bool QuestionMessage(string text)
        {
            return MessageBoxResult.Yes == MessageBox.Show(text, "Вопрос",
              MessageBoxButton.YesNo, MessageBoxImage.Question);

        }
        public static void ExitMessage()
        {
            bool resultMB = QuestionMessage("Вы дествительно хотите выйти");
            if (resultMB == true)
            {
                App.Current.Shutdown();
            }
        }
    }
}
