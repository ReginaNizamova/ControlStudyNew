using ControlStudy.Classes;
using System.Collections.Generic;
using System.Windows;

namespace ControlStudy.Windows
{
    public partial class ReferenceWindow : Window
    {
        public ReferenceWindow(string group)
        {
            InitializeComponent();
            AddDataReference(group);
        }

        private void AddDataReference(string group)
        {
            List<Reference> references = new List<Reference>();
            List<string> dates = new List<string>()
            { 
                "09.2017 - 12.2017",//0
                "01.2018 - 06.2018",//1
                "09.2018 - 12.2018",//2
                "01.2019 - 06.2019",//3
                "09.2019 - 12.2019",//4
                "01.2020 - 06.2020",//5
                "09.2020 - 12.2020",//6
                "01.2021 - 06.2021",//7
                "09.2021 - 12.2021",//8
                "01.2022 - 06.2022" //9
            };


            switch (group)
            {
                case "115":
                {
                    references.Add(new Reference(1, dates[8]));
                    references.Add(new Reference(2, dates[9]));
                    break;
                }

                case "215":
                {
                    references.Add(new Reference(1, dates[6]));
                    references.Add(new Reference(2, dates[7]));
                    references.Add(new Reference(3, dates[8]));
                    references.Add(new Reference(4, dates[9]));
                    break;
                }

                case "315":
                {
                    references.Add(new Reference(1, dates[4]));
                    references.Add(new Reference(2, dates[5]));
                    references.Add(new Reference(3, dates[6]));
                    references.Add(new Reference(4, dates[7]));
                    references.Add(new Reference(5, dates[8]));
                    references.Add(new Reference(6, dates[9]));
                    break;
                }

                case "415":
                {
                    references.Add(new Reference(1, dates[2]));
                    references.Add(new Reference(2, dates[3]));
                    references.Add(new Reference(3, dates[4]));
                    references.Add(new Reference(4, dates[5]));
                    references.Add(new Reference(5, dates[6]));
                    references.Add(new Reference(6, dates[7]));
                    references.Add(new Reference(7, dates[8]));
                    references.Add(new Reference(8, dates[9]));
                    break;
                }

                case "515":
                {
                    references.Add(new Reference(1, dates[0]));
                    references.Add(new Reference(2, dates[1]));
                    references.Add(new Reference(3, dates[2]));
                    references.Add(new Reference(4, dates[3]));
                    references.Add(new Reference(5, dates[4]));
                    references.Add(new Reference(6, dates[5]));
                    references.Add(new Reference(7, dates[6]));
                    references.Add(new Reference(8, dates[7]));
                    references.Add(new Reference(9, dates[8]));
                    references.Add(new Reference(10, dates[9]));
                    break;
                }
            }

            referenceData.ItemsSource = references;
        }

    }
}
