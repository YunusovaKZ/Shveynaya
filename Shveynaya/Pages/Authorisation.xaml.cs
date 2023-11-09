using Shveynaya.Pages;
using Shveynaya.Utilities;
using Shveynaya;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

namespace Shveynaya.Pages
{
    /// <summary>
    /// Interaction logic for PgAuthorisation.xaml
    /// </summary>
    public partial class Authorisation : Page
    {


        public Authorisation()
        {
            InitializeComponent();
            TbLoginLogin.Focus();

        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            var user = Db.Conn.User.Where(u => u.Login == TbLoginLogin.Text && u.Password == PbLoginPassword.Password).FirstOrDefault();
            if (user == null)
            {
                MessageBox.Show("Неверный логин или пароль.");
            }
            else
            {
                Transfer.LoggedUser = user;
                switch (user.IdRole)
                {
                    case 1:
                        NavigationService.Navigate(new Customer());
                        break;
                    case 2:
                        NavigationService.Navigate(new Manager());
                        break;
                    case 3:
                        NavigationService.Navigate(new Director());
                        break;
                }
            }
           
        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GetNavigationService(this).Navigate(new Registration());
        }

    }
}