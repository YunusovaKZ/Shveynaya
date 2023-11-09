using Shveynaya.Pages;
using Shveynaya.Utilities;
using Shveynaya;
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
using System.Text.RegularExpressions;

namespace Shveynaya.Pages
{
    public partial class Registration : Page
    {
        public Registration()
        {
            InitializeComponent();
        }
        private void BtnRegister_Click(object sender, RoutedEventArgs e)
        {
            Regex checkSpace = new Regex(@"\s", RegexOptions.None);
            Regex checkPassword = new Regex(@"(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^]).*[A-Za-z\d!@#$%^]{6,}", RegexOptions.None);

            if ((TbRegLogin.Text != string.Empty) &&
                (PbRegPassword.Password == PbRegPasswordRepeat.Password) &&
                (!checkSpace.IsMatch(PbRegPassword.Password) &&
                checkPassword.IsMatch(PbRegPassword.Password)))
            {
                if (Db.Conn.User.Where(u => u.Login == TbRegLogin.Text).FirstOrDefault() == null)
                {
                    User user = new User();
                    user.Login = TbRegLogin.Text;
                    user.Password = PbRegPassword.Password;
                    user.IdRole = 1;
                    Db.Conn.User.Add(user);
                    Db.Conn.SaveChanges();

                    MessageBox.Show("Регистрация прошла успешно!");
                    TbRegLogin.Text = string.Empty;
                    PbRegPassword.Password = string.Empty;
                    PbRegPasswordRepeat.Password = string.Empty;
                }
                else
                    MessageBox.Show("Данный логин уже занят.");
            }
            else
            {
                MessageBox.Show(@"Ошибка!!
Необходимо задать логин.
Пароль  должен  отвечать  следующим требованиям: 
•  Минимум 6 символов 
•  Минимум 1 прописная буква 
•  Минимум 1 цифра 
•  Минимум один символ из набора: ! @ # $ % ^.");
            }
        }
        private void BtnAuto_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GetNavigationService(this).Navigate(new Authorisation());
        }
    }
}
