using Microsoft.Win32;
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

namespace Shveynaya.Pages
{
    public partial class ProductConstructor : Page
    {
        public ProductConstructor()
        {
            InitializeComponent();
            Product.ItemsSource = Db.Conn.Product.ToList();
            WidthUnit.ItemsSource = Db.Conn.Unit.ToList();
            HeightUnit.ItemsSource = Db.Conn.Unit.ToList();

            Fabric.ItemsSource = Db.Conn.Fabric.ToList();
            Furniture.ItemsSource = Db.Conn.Furniture.ToList();
            Border.ItemsSource = Db.Conn.Fabric.ToList();

        }
        //путь к изображениям
        public string ImagesPath = @"pack:\\siteoforigin:,,,\Images\images\";
        private void Product_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                ProductView.Source = new BitmapImage(new Uri(ImagesPath + @"Изделия/" + Product.SelectedValuePath + ".jpg", UriKind.RelativeOrAbsolute));
            }
            catch
            {
                ProductView.Source = new BitmapImage(new Uri(@".\..\Resources\Images\System\no-image.jpg", UriKind.RelativeOrAbsolute));
            }
        }
        private void CbFabric_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                FabricView.Source = new BitmapImage(new Uri(ImagesPath + @"Ткани\" + Fabric.SelectedValue + ".jpg", UriKind.RelativeOrAbsolute));
            }
            catch
            {
                FabricView.Source = new BitmapImage(new Uri(@".\..\Resources\Images\System\no-image.jpg", UriKind.RelativeOrAbsolute));
            }
        }
        private void CbFurniture_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                FurnitureView.Source = new BitmapImage(new Uri(ImagesPath + @"Фурнитура\" + Furniture.SelectedValue + ".jpg", UriKind.RelativeOrAbsolute));
            }
            catch
            {
                FurnitureView.Source = new BitmapImage(new Uri(@".\..\Resources\Images\System\no-image.jpg", UriKind.RelativeOrAbsolute));
            }
        }
        private void CbBorder_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                BorderView.Source = new BitmapImage(new Uri(ImagesPath + @"Ткани\" + Border.SelectedValue + ".jpg", UriKind.RelativeOrAbsolute));
            }
            catch
            {
                BorderView.Source = new BitmapImage(new Uri(@".\..\Resources\Images\System\no-image.jpg", UriKind.RelativeOrAbsolute));
            }
        }
        private void BtnOrder_Click(object sender, RoutedEventArgs e)
        {

            bool dataIsValid = true;
            string errorMessage = string.Empty;
            try { Convert.ToDouble(TbWidth.Text); }
            catch { errorMessage += "Неравильно заполнено поле \"Ширина\".\n"; dataIsValid = false; }
            try { Convert.ToDouble(TbHeight.Text); }
            catch { errorMessage += "Неравильно заполнено поле \"Высота\".\n"; dataIsValid = false; }
            try { Convert.ToInt32(TbProductAmount.Text); }
            catch { errorMessage += "Неравильно заполнено поле \"Количество\".\n"; dataIsValid = false; }
            if (dataIsValid)
            {
                double productPrice = (
                        Convert.ToDouble(Db.Conn.FabricStock.Where(u => u.IdFabric == (string)Fabric.SelectedValue).FirstOrDefault().PurchasePrice) +
                        Convert.ToDouble(Db.Conn.FurnitureStock.Where(u => u.IdFurniture == (string)Furniture.SelectedValue).FirstOrDefault().PurchasePrice) +
                        Convert.ToDouble(Db.Conn.FabricStock.Where(u => u.IdFabric == (string)Border.SelectedValue).FirstOrDefault().PurchasePrice)
                    ) * Convert.ToDouble(TbProductAmount.Text);
                //сохранение изделия в заказ
                Transfer.CurrentOrder.OrderItem.Add(new OrderItem
                {
                    IdProduct = (string)Product.SelectedValue,
                    IdFabric = (string)Fabric.SelectedValue,
                    IdFurniture = (string)Furniture.SelectedValue,
                    IdBorder = (string)Border.SelectedValue,
                    Width = Convert.ToDouble(TbWidth.Text),
                    Height = Convert.ToDouble(TbHeight.Text),
                    IdUnitHeight = (int)HeightUnit.SelectedValue,
                    IdUnitWidth = (int)WidthUnit.SelectedValue,
                    Amount = Convert.ToInt32(TbProductAmount.Text),
                    Price = productPrice
                });
                NavigationService.GetNavigationService(this).Navigate(new OrderList());
            }
            else
                MessageBox.Show(errorMessage, "Проверьте правильность заполнения данных");
        }
        private void BtnGoBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GetNavigationService(this).GoBack();
        }
    }
}
