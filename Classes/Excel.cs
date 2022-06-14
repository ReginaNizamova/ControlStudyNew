using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace ControlStudy.Classes
{
    public class Excel
    {
        public static void CreateTableExcel (ComboBox groupCB, ComboBox disciplineCB, ComboBox semesterCB, List<ReportGrades> FindGrades)
        {
            var pathDesktop = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);

            using (SpreadsheetDocument document = SpreadsheetDocument.Create(pathDesktop + @"\document.xlsx", SpreadsheetDocumentType.Workbook))
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

                    foreach (var item in FindGrades)
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
                    document.Close();
                    MessageBox.Show("document.xlsx создан на рабочем столе");
                }
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
                     { Style = BorderStyleValues.Medium },

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
                    new CellFormat(new Alignment() { Horizontal = HorizontalAlignmentValues.Left }) { FontId = 0, FillId = 0, BorderId = 0 }, // Стиль 0 - По умолчанию
                    new CellFormat() { FontId = 1, FillId = 2, BorderId = 1, ApplyBorder = true }, // Стиль 1 - Заголовки
                    new CellFormat() { FontId = 0, FillId = 0, BorderId = 0, NumberFormatId = 4 } // Стиль 2 - Числовой формат
            )
        );
        }
    }
}
