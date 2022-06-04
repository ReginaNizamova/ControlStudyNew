using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Media;

namespace ControlStudy.Classes
{
    public class ColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if ((double)value == 0.0 || (double)value < 2.5)
                return new SolidColorBrush((Color.FromArgb(255, 255, 153, 148)));

            else if ((double)value < 3.5 && (double)value >= 2.5)
                return new SolidColorBrush((Color.FromArgb(255, 255, 253, 110)));

            else
                return new SolidColorBrush(Colors.Azure); 
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
