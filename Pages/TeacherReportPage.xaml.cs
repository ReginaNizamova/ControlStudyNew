using ControlStudy.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Drawing.Charts;
using DocumentFormat.OpenXml.Drawing.Spreadsheet;

namespace ControlStudy.Pages
{
    public partial class TeacherReportPage : System.Windows.Controls.Page
    {
        public TeacherReportPage()
        {
            InitializeComponent();

            groupCB.ItemsSource = ControlStudyEntities.GetContext().Groups.ToList();
            disciplineCB.ItemsSource = ControlStudyEntities.GetContext().Disciplines.ToList();
        }

        private List<ReportGrades> FindGrades()
        {
            List<ReportGrades> reportGrades = new List<ReportGrades>();
            var group = (Group)groupCB.SelectedItem;
            var discipline = (Discipline)disciplineCB.SelectedItem;
            var semester = semesterCB.SelectedIndex;

            if (semester == 0)
                semester = 1;
            else
                semester = 2;

            if (group != null && discipline != null)
            {
                var persons = ControlStudyEntities.GetContext().People.Where(p => p.Group.Group1 == group.Group1).ToList();

                List<Grades> grades = new List<Grades>();
               

                for (int i = 0; i < persons.Count; i++)
                {
                    try
                    {
                        var person = persons[i];
                        var gradePerson = ControlStudyEntities.GetContext().Progresses.Where(p => p.IdPerson == person.IdPerson && p.Discipline.Discipline1 == discipline.Discipline1 && p.Semester == semester).Select(p => p.Grade);

                        if (gradePerson.Any())
                        {
                            grades.Add(new Grades(Math.Round(gradePerson.Average(), 2), gradePerson.Count()));
                            reportGrades.Add(new ReportGrades(person, grades[i]));
                        }
                        else
                        {
                            grades.Add(new Grades(0, 0));
                            reportGrades.Add(new ReportGrades(person, null));
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }

                dataGridGrades.ItemsSource = reportGrades;
            }
            return reportGrades;
        }

        private void GroupCBSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FindGrades();
        }

        private void DisciplineCBSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FindGrades();
        }

        private void SemesterCBSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FindGrades();
        }

        private void GraphicClick(object sender, RoutedEventArgs e)
        {
            using (SpreadsheetDocument document = SpreadsheetDocument.Create(@"C:\Users\User\Desktop\document.xlsx", SpreadsheetDocumentType.Workbook))
            {
                WorkbookPart workbookPart = document.AddWorkbookPart();
                workbookPart.Workbook = new Workbook();
                WorksheetPart worksheetPart = workbookPart.AddNewPart<WorksheetPart>();
                FileVersion fileVersion = new();
                fileVersion.ApplicationName = "Microsoft Office Excel";
                worksheetPart.Worksheet = new Worksheet(new SheetData());
                WorkbookStylesPart stylesPart = workbookPart.AddNewPart<WorkbookStylesPart>();
                stylesPart.Stylesheet = GenerateStyleSheet();
                stylesPart.Stylesheet.Save();

                Columns listColumns = worksheetPart.Worksheet.GetFirstChild<Columns>();
                bool needToInsertColumns = false;
                if (listColumns == null)
                {
                    listColumns = new Columns();
                    needToInsertColumns = true;
                }

                listColumns.Append(new Column() { Min = 1, Max = 10, Width = 20, CustomWidth = true });
                listColumns.Append(new Column() { Min = 2, Max = 10, Width = 20, CustomWidth = true });
                listColumns.Append(new Column() { Min = 3, Max = 10, Width = 20, CustomWidth = true });

                if (needToInsertColumns)
                    worksheetPart.Worksheet.InsertAt(listColumns, 0);

                Sheets sheets = workbookPart.Workbook.AppendChild(new Sheets());
                Sheet sheet = new Sheet() { Id = workbookPart.GetIdOfPart(worksheetPart), SheetId = 1, Name = "Отчет по оценкам" };
                sheets.Append(sheet);

                SheetData sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();

                Row row = new Row() { RowIndex = 1 };
                sheetData.Append(row);

                InsertCell(row, 1, "Группа", CellValues.String, 1);
                InsertCell(row, 2, "Дисциплина", CellValues.String, 1);
                InsertCell(row, 3, "Семестр", CellValues.String, 1);

                row = new Row() { RowIndex = 2 };
                sheetData.Append(row);

                if (groupCB.SelectedItem == null || disciplineCB.SelectedItem == null || semesterCB.SelectedItem == null)
                    MessageBox.Show("Выберите все значения!");
                else
                {
                    var group = (Group)groupCB.SelectedItem;
                    var discipline = (Discipline)disciplineCB.SelectedItem;
                    var semester = semesterCB.SelectedIndex;

                    semester = semester == 0 ? 1 : 2;

                    InsertCell(row, 1, group.Group1, CellValues.String, 2);
                    InsertCell(row, 2, discipline.Discipline1, CellValues.String, 0);
                    InsertCell(row, 3, semester.ToString(), CellValues.String, 2);

                    row = new Row() { RowIndex = 4 };
                    sheetData.Append(row);

                    InsertCell(row, 1, "Фамилия", CellValues.String, 1);
                    InsertCell(row, 2, "Имя", CellValues.String, 1);
                    InsertCell(row, 3, "Ср. балл", CellValues.String, 1);

                    uint rowIndex = 5;
                    int column = 1;

                    foreach (var item in FindGrades())
                    {
                        row = new Row() { RowIndex = rowIndex };
                        sheetData.Append(row);

                        InsertCell(row, column, item.Person.Family, CellValues.String, 0);
                        InsertCell(row, column + 1, item.Person.Name, CellValues.String, 0);

                        if (item.Grades != null)
                            InsertCell(row, column + 2, item.Grades.AverageGrade.ToString(), CellValues.String, 2);
                        rowIndex++;
                    }

                    workbookPart.Workbook.Save();
                    //CreateDiagram(worksheetPart, FindGrades(), workbookPart);
                    CreateDiagram(worksheetPart, FindGrades());
                    document.Close();
                    MessageBox.Show("document.xlsx создан на рабочем столе");
                }
            }

            static void InsertCell(Row row, int cell_num, string val, CellValues type, uint styleIndex)
            {
                Cell refCell = null;
                Cell newCell = new Cell() { CellReference = cell_num.ToString() + ":" + row.RowIndex.ToString(), StyleIndex = styleIndex };
                row.InsertBefore(newCell, refCell);

                // Устанавливает тип значения.
                newCell.CellValue = new CellValue(val);
                newCell.DataType = new EnumValue<CellValues>(type);

            }

            static Stylesheet GenerateStyleSheet()
            {

                return new Stylesheet(
                 new Fonts(
                     new Font(                                                               // Стиль под номером 0 - Шрифт по умолчанию.
                         new FontSize() { Val = 11 },
                         new Color() { Rgb = new HexBinaryValue() { Value = "000000" } },
                         new FontName() { Val = "Calibri" }),
                     new Font(                                                               // Стиль под номером 1 - Полужирный шрифт.
                         new Bold(),
                         new FontSize() { Val = 11 },
                         new Color() { Rgb = new HexBinaryValue() { Value = "000000" } },
                         new FontName() { Val = "Calibri" })
                 ),
                 new Fills(
                    new Fill(                                                           // Стиль под номером 0 - Заполнение ячейки по умолчанию.
                        new PatternFill() { PatternType = PatternValues.None }),
                    new Fill(                                                           // Стиль под номером 1 - Заполнение ячейки серым цветом
                        new PatternFill(
                            new ForegroundColor() { Rgb = new HexBinaryValue() { Value = "FFAAAAAA" } }
                            )
                        { PatternType = PatternValues.Solid }),
                    new Fill(                                                           // Стиль под номером 2 - Заполнение ячейки голубым цветом.
                        new PatternFill(
                            new ForegroundColor() { Rgb = new HexBinaryValue() { Value = "FF9BCACA" } }
                        )
                        { PatternType = PatternValues.Solid })),

                 new Borders(
                     new DocumentFormat.OpenXml.Spreadsheet.Border(      // Стиль под номером 0 - Грани.
                         new LeftBorder(),
                         new RightBorder(),
                         new TopBorder(),
                         new BottomBorder(),
                         new DiagonalBorder()),


                      new DocumentFormat.OpenXml.Spreadsheet.Border(     // Стиль под номером 1 - Заголовки.
                         new LeftBorder(
                             new Color() { Indexed = 64 }
                         )
                         { Style = BorderStyleValues.Medium},

                         new RightBorder(
                             new Color() { Indexed = 64 }
                         )
                         { Style = BorderStyleValues.Medium },

                         new TopBorder(
                             new Color() { Indexed = 64 }
                         )
                         { Style = BorderStyleValues.Medium },

                         new BottomBorder(
                             new Color() { Indexed = 64 }
                         )
                         { Style = BorderStyleValues.Medium },
                         new DiagonalBorder())

                 ),

                  new CellFormats(
                        new CellFormat (new Alignment() { Horizontal = HorizontalAlignmentValues.Left }) {FontId = 0, FillId = 0, BorderId = 0 }, // Стиль 0 - По умолчанию
                        new CellFormat() { FontId = 1, FillId = 2, BorderId = 1, ApplyBorder = true }, // Стиль 1 - Заголовки
                        new CellFormat() { FontId = 0, FillId = 0, BorderId = 0, NumberFormatId = 4} // Стиль 2 - Числовой формат
                )
            ); 
            }

            

         

            #region
            //static void CreateDiagram (WorksheetPart worksheetPart, List<ReportGrades> reportGrades, WorkbookPart workbookPart)
            //{
            //    Sheet sheet = new Sheet() { Id = workbookPart.GetIdOfPart(worksheetPart), SheetId = 2, Name = "График" };
            //    DrawingsPart drawingsPart = worksheetPart.AddNewPart<DrawingsPart>();
            //    worksheetPart.Worksheet.Append(new Drawing()
            //    { 
            //        Id = worksheetPart.GetIdOfPart(drawingsPart) 
            //    });

            //    worksheetPart.Worksheet.Save();

            //    ChartPart chartPart = drawingsPart.AddNewPart<ChartPart>();
            //    chartPart.ChartSpace = new ChartSpace();
            //    chartPart.ChartSpace.Append(new EditingLanguage() 
            //    {
            //        Val = new StringValue("en-US") 
            //    });

            //    Chart chart = chartPart.ChartSpace.AppendChild(new Chart());

            //    PlotArea plotArea = chart.AppendChild(new PlotArea());
            //    Layout layout = plotArea.AppendChild (new Layout());
            //    BarChart barChart = plotArea.AppendChild (new BarChart(new BarDirection()
            //    { 
            //        Val = new EnumValue<BarDirectionValues>(BarDirectionValues.Column) 
            //    },
            //        new BarGrouping() 
            //        { 
            //            Val = new EnumValue<BarGroupingValues>(BarGroupingValues.Clustered) 
            //        }));

            //    uint i = 0;

            //    foreach (var item in reportGrades)
            //    {
            //        BarChartSeries barChartSeries = barChart.AppendChild (new BarChartSeries(new Index()
            //        {
            //            Val = new UInt32Value(i)
            //        },
            //            new Order() 
            //            { 
            //                Val = new UInt32Value(i) 
            //            },

            //            new SeriesText(new NumericValue() 
            //            { 
            //                Text = item.Person.Family
            //            })));

            //        StringLiteral strLit = barChartSeries.AppendChild(new CategoryAxisData()).AppendChild(new StringLiteral());
            //        strLit.Append(new PointCount() 
            //        {
            //            Val = new UInt32Value(1U) 
            //        });
            //        //strLit.AppendChild(new StringPoint() 
            //        //{ 
            //        //    Index = new UInt32Value(0U) 

            //        //}).Append(new NumericValue(reportGrades[Convert.ToInt32(i)].Person.Family));

            //        NumberLiteral numLit = barChartSeries.AppendChild(new DocumentFormat.OpenXml.Drawing.Charts.Values()).AppendChild(new NumberLiteral());
            //        numLit.Append(new FormatCode("float"));
            //        numLit.Append(new PointCount() 
            //        { 
            //            Val = new UInt32Value(1U) 
            //        });
            //        numLit.AppendChild(new NumericPoint() 
            //        { 
            //            Index = new UInt32Value(0u) 
            //        }).Append (new NumericValue(reportGrades[Convert.ToInt32(i)].Grades.AverageGrade.ToString()));

            //        i++;
            //    }

            //    barChart.Append(new AxisId() { Val = new UInt32Value(48650112u) });
            //    barChart.Append(new AxisId() { Val = new UInt32Value(48672768u) });

            //    CategoryAxis catAx = plotArea.AppendChild(new CategoryAxis(new AxisId()
            //    { 
            //        Val = new UInt32Value(48650112u) }, new Scaling(new DocumentFormat.OpenXml.Drawing.Charts.Orientation()
            //    {
            //        Val = new EnumValue<DocumentFormat.OpenXml.Drawing.Charts.OrientationValues>(DocumentFormat.OpenXml.Drawing.Charts.OrientationValues.MinMax)
            //    }),
            //        new AxisPosition() { Val = new EnumValue<AxisPositionValues>(AxisPositionValues.Bottom) },
            //        new TickLabelPosition() { Val = new EnumValue<TickLabelPositionValues>(TickLabelPositionValues.NextTo) },
            //        new CrossingAxis() { Val = new UInt32Value(48672768U) },
            //        new Crosses() { Val = new EnumValue<CrossesValues>(CrossesValues.AutoZero) },
            //        new AutoLabeled() { Val = new BooleanValue(true) },
            //        new LabelAlignment() { Val = new EnumValue<LabelAlignmentValues>(LabelAlignmentValues.Center) },
            //        new LabelOffset() { Val = new UInt16Value((ushort)100) }));

            //    ValueAxis valAx = plotArea.AppendChild(new ValueAxis(new AxisId() { Val = new UInt32Value(48672768u) },
            //        new Scaling(new DocumentFormat.OpenXml.Drawing.Charts.Orientation()
            //        {
            //            Val = new EnumValue<DocumentFormat.OpenXml.Drawing.Charts.OrientationValues>(
            //            DocumentFormat.OpenXml.Drawing.Charts.OrientationValues.MinMax)
            //        }),
            //        new AxisPosition() { Val = new EnumValue<AxisPositionValues>(AxisPositionValues.Left) },
            //        new MajorGridlines(),
            //        new DocumentFormat.OpenXml.Drawing.Charts.NumberingFormat()
            //        {
            //            FormatCode = new StringValue("General"),
            //            SourceLinked = new BooleanValue(true)
            //        }, new TickLabelPosition()
            //        {
            //            Val = new EnumValue<TickLabelPositionValues>(TickLabelPositionValues.NextTo)
            //        }, new CrossingAxis() { Val = new UInt32Value(48650112U) },
            //        new Crosses() { Val = new EnumValue<CrossesValues>(CrossesValues.AutoZero) },
            //        new CrossBetween() { Val = new EnumValue<CrossBetweenValues>(CrossBetweenValues.Between) }));

            //    Legend legend = chart.AppendChild(new Legend(new LegendPosition() 
            //    { 
            //        Val = new EnumValue<LegendPositionValues>(LegendPositionValues.Right) 
            //    },
            //        new Layout()));

            //    chart.Append(new PlotVisibleOnly() 
            //    { 
            //        Val = new BooleanValue(true) 
            //    });

            //    chartPart.ChartSpace.Save();

            //    drawingsPart.WorksheetDrawing = new WorksheetDrawing();
            //    TwoCellAnchor twoCellAnchor = drawingsPart.WorksheetDrawing.AppendChild(new TwoCellAnchor());
            //    twoCellAnchor.Append(new DocumentFormat.OpenXml.Drawing.Spreadsheet.FromMarker(new ColumnId("9"),
            //        new ColumnOffset("581025"),
            //        new RowId("17"),
            //        new RowOffset("114300")));
            //    twoCellAnchor.Append(new DocumentFormat.OpenXml.Drawing.Spreadsheet.ToMarker(new ColumnId("17"),
            //        new ColumnOffset("276225"),
            //        new RowId("32"),
            //        new RowOffset("0")));

            //    GraphicFrame graphicFrame = twoCellAnchor.AppendChild(new GraphicFrame());
            //    graphicFrame.Macro = "";

            //    graphicFrame.Append(new NonVisualGraphicFrameProperties(
            //        new NonVisualDrawingProperties() { Id = new UInt32Value(2u), Name = "Chart 1" },
            //        new NonVisualGraphicFrameDrawingProperties()));

            //    graphicFrame.Append(new Transform(new DocumentFormat.OpenXml.Drawing.Offset() { X = 0L, Y = 0L },
            //                                      new DocumentFormat.OpenXml.Drawing.Extents() { Cx = 0L, Cy = 0L }));

            //    graphicFrame.Append(new DocumentFormat.OpenXml.Drawing.Graphic(new DocumentFormat.OpenXml.Drawing.GraphicData(new ChartReference() { Id = drawingsPart.GetIdOfPart(chartPart) })
            //    { Uri = "http://schemas.openxmlformats.org/drawingml/2006/chart" }));

            //    twoCellAnchor.Append(new ClientData());

            //    drawingsPart.WorksheetDrawing.Save();
            //}
            #endregion


        }
    }
}
