   M S B A M L   `   `   `  ���� G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy      ControlStudy.TeacherPage   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ,localclr-namespace:ControlStudy       N� Title$  TeacherPage�� � 	Resources  �� 
TargetType   textBox �� Property �� Value��%E   &	        �� " ��.���  � ��$ 18(���  � ��
 �����.��� -    �Name$
 grid�� � RowDefinitions �� $��6* ��� $��* �.+�&   System.Windows.Controls.DataGrid  -     Name$ dataGridProgress��$��0q�   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 	   
IsReadOnly	 . 
   AutoGenerateColumns
 .  $��25q�$��15(� J� Opacity$
 0.85Q�
�������   AlternatingRowBackground �#9ACeeb �� AlternationCount$ 2��   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Группа��   Width$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Person.Group.Group1+  $ Фамилия��$
 1.5*  �� *Person.Family+  $ Имя��$
 1.5*  �� *Person.Name+  $ Дисциплина��$ 2*  �� *Discipline.Discipline1+  $ Оценка��$ *  �� *Grade+  $ Дата��$ 2*  �� *DateGrade.Date+ �� StringFormat$ 
dd.MM.yyyy��4  .System.Windows.Controls.DataGridTemplateColumn  $	 100    CellTemplate �� .R���  ��Name$
 edit��-   $	��100��$��0q�
������ $��14(�$ ��Редактировать�� =  7System.Windows.Controls.Primitives.DataGridColumnHeader��%a   '        �� "  .���  � �� �#9ACeeb��  � ��$
 Bold"���  � ��$ 30���� $��1��
���   �$	 0.5Q��� $��Center=�$��1�� �� Orientation$ 
Horizontal=�.+��� -   $	 add��$��0q�$��50��
������ .���� $��/Resource/addGrade.png���� -   $ delete��$��0q�$��	80 0 80 0q�$��60��
������ .���� $��/Resource/deleteGrade.png���� -   $ print��$��0q�$��60��
������ .���� $��/Resource/print.png��