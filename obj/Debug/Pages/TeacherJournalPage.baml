   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy  5      %    ControlStudy.TeacherJournalPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:ControlStudy     5        N� Title$  TeacherJournalPage��5	       � 	Resources 5       �� 
TargetType   textBox �� Property �� Value��%x   &	        �� 5   
   " ��6   .�5      ��  � ��$ 18(�6)   �� 5       � ��
 �����6+   5      5      .��5      � -   5         �Name$
 grid��5       � RowDefinitions 5   
   �� 5      $
��0.5* �6   �� 5      $��6* �6   �� 5      $��* �6   .+�5   
   �� $��0 10 0 0q�6   .+�5      �� -   5         ��Name$ 
filterText��5      $
��Left=�6*   $��25 0 0 0q�6E   $	��400��6W   $	��200��6f   $��25��6u   $��Center=�6�    � ToolTip$\ VФильтрация по группе, фамилии, дисциплине, дате��6�   $��16(�6  �� 5      $��30 0 0 0q�6   	 J� IsHitTestVisible	 .  $��Comic Sans MS)�6C   $��Фильтр��6^   
�������$��16(�6�   ��5      �� 5      " ��6   .�5       ��  � y�$ 	Collapsed=�67   
 �� Triggers
 5!      �� 5"       �� Binding 6*   �� *Text+ �� ElementName$ 
filterText�� �� Value  6[   .a�5#   "   ��  � y�$ Visible=�6?   5$      5&      5(      5)      &   System.Windows.Controls.DataGrid  5*   
   -   5          Name$ dataGridProgress��5*   ~   $��0q�6   $��1��6'      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 64      
IsReadOnly .    AutoGenerateColumns .  $��25q�6r   $��15(�6�    J� Opacity$
 0.85Q�6�   
�������   AlternatingRowBackground �#9ACeeb �� AlternationCount$ 2��6�      Columns 5+      0  *System.Windows.Controls.DataGridTextColumn  5,      ,  &System.Windows.Controls.DataGridColumn   Header$ Группа��6%      Width$ * 6]   1  +System.Windows.Controls.DataGridBoundColumn   Binding 65   �� *Person.Group.Group1+6]     5-      $ Фамилия��6%   $
 1.5* 6X    66   �� *Person.Family+6X     5.      $ Имя��6%   $
 1.5* 6R    62   �� *Person.Name+6R     5/      $ Дисциплина��6%   $ 2* 6d    69   �� *Discipline.Discipline1+6d     50      $ Оценка��6%   $
 1.5* 6O    65   �� *Grade+6O     51      $ Дата��6%   $ 2* 6o    63   �� *DateGrade.Date+ �� StringFormat$ 
dd.MM.yyyy��6o   4  .System.Windows.Controls.DataGridTemplateColumn  52      $	 100 6)      CellTemplate 53      �� 54      .R�55      ��  ��Name$
 edit��6�   -   5        $	��100��55   %   $��0q�61   
������ $��14(�6^   $ ��Редактировать��6l   6�   56      58       5:      =  7System.Windows.Controls.Primitives.DataGridColumnHeader��%�   '        �� 5;      "  6   .�5<      ��  � �� �#9ACeeb63   �� 5=       � ��$
 Bold"�63   �� 5>       � ��$ 30��6/   5?      5@      5A      �� 5C   
   $��2��6   
���   �$	 0.5Q�61   �� 5E   
   $��Center=�6   $��2��62    �� Orientation$ 
Horizontal=�6?   .+�5F      �� -   5        $	 add��5F      $��0q�63   $��50��6H   
������ .��5G      �� $��/Resource/addGrade.png��6   5H      �� 5J      -   5        $ delete��5J      $��0q�69   $��	80 0 80 0q�6M   $��60��6`   
������ .��5K      �� $��/Resource/deleteGrade.png��6   5L      �� 5N      -   5        $ print��5N      $��0q�67   $��60��6K   
������ .��5O      �� $��/Resource/print.png��6   5P      5Q      5R      5S      