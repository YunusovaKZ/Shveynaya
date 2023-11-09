using Shveynaya.Utilities;
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

namespace Shveynaya.Pages
{
    public partial class Orders : Page
    {
        public Orders()
        {
            InitializeComponent();
            switch (Transfer.LoggedUser.IdRole)
            {
                case 1:
                    DgtcIdUser.Visibility = Visibility.Hidden;
                    DgtcCbOrderState.Visibility = Visibility.Hidden;
                    DgOrders.ItemsSource = Db.Conn.Order.Where(u => u.IdUser == Transfer.LoggedUser.Id).ToList();
                    break;
                case 2:
                    DgtcBtnPay.Visibility = Visibility.Hidden;
                    BtnAddNewOrder.Visibility = Visibility.Hidden;

                    DgOrders.ItemsSource = Db.Conn.Order.Where(u => u.IdManager == null || u.IdManager == Transfer.LoggedUser.Id).ToList();
                    break;
            }
        }
        private void BtnAddNewOrder_Click(object sender, RoutedEventArgs e)
        {
            Transfer.CurrentOrder = new Order
            {
                IdUser = Transfer.LoggedUser.Id
            };
            NavigationService.GetNavigationService(this).Navigate(new OrderList());
        }

        private void CbOrderState_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Order orderToAccept = ((FrameworkElement)sender).DataContext as Order;
            if (orderToAccept != null)
            {
                switch ((sender as ComboBox).SelectedIndex)
                {
                    case 0:
                        break;
                    case 1: // обработка
                        if (orderToAccept.IdState == 1 || orderToAccept.IdState == 2)
                        {
                            orderToAccept.IdState = 3;
                            orderToAccept.IdManager = Transfer.LoggedUser.Id;
                        }
                        break;
                    case 2: // отклонен
                        if (orderToAccept.IdState == 3)
                            orderToAccept.IdState = 4;
                        break;
                    case 3: //к оплате
                        if (orderToAccept.IdState == 3)
                            orderToAccept.IdState = 5;
                        break;
                    case 4: //раскрой
                        if (orderToAccept.IdState == 6)
                            orderToAccept.IdState = 7;
                        break;
                }
                Db.Conn.SaveChanges();
                DgOrders.ItemsSource = Db.Conn.Order.Where(u => u.IdManager == null || u.IdManager == Transfer.LoggedUser.Id).ToList();
            }
        }
        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Order orderToEdit = ((FrameworkElement)sender).DataContext as Order;
            if (Transfer.LoggedUser.IdRole == 2 || orderToEdit.IdState < 2)
            {
                Transfer.CurrentOrder = orderToEdit;
                Transfer.CurrentOrder.OrderItem = orderToEdit.OrderItem.ToList();
                NavigationService.GetNavigationService(this).Navigate(new OrderList());
            }
            else
            {
                MessageBox.Show("Изменения невозможны, заказ устарел");
            }
        }
        private void BtnPay_Click(object sender, RoutedEventArgs e)
        {
            Order orderToPay = ((FrameworkElement)sender).DataContext as Order;
            if (orderToPay.IdState == 5)
            {
                if (MessageBox.Show("Вы согласны оплатить заказ?", "Оплата заказа", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    // возможен переход к форме оплаты, на данный момент заглушка
                    orderToPay.IdState = 6;
                    Db.Conn.SaveChanges();
                    DgOrders.ItemsSource = Db.Conn.Order.Where(u => u.IdUser == Transfer.LoggedUser.Id).ToList();
                }
            }
            else
            {
                MessageBox.Show("Оплата невозможно, подождите, пока ваш заказ обработают");
            }
        }
        private void SearchTBChanged(object sender, TextChangedEventArgs e)
        {
            string str = ((TextBox)sender).Text;
            var dbList = Db.Conn.Order.Where(x => x.Id.ToString().Contains(str)).ToList();
            DgOrders.ItemsSource = dbList;
        }
    }
}
