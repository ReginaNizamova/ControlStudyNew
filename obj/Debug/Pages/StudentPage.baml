   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy  5          ControlStudy.StudentPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:ControlStudy     5        N� Title$  StudentPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      $	��19* �6   �� 5      $	��36* �6   �� 5      $
��170* �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ dataGridProgress��5   j      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 6   $��1��6#      
IsReadOnly .    AutoGenerateColumns .  $��25q�6^   $��15(�6�    J� Opacity$
 0.85Q�6�   
�������   AlternatingRowBackground �#9ACeeb �� AlternationCount$ 2��6�   $��2��6�   	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn
   Header$
 Дисциплина��6%      Width$
 1.5* 6d   1  +System.Windows.Controls.DataGridBoundColumn   Binding 69   �� *Discipline.Discipline1+6d     5      $
 Оценка��6%   $ * 6S    69   �� *Grade+6S     5      $
 Дата��6%   $ * 6n    66   �� *	DateGrade+ �� StringFormat$ 
dd.MM.yyyy��6n    � 	Resources 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� 
TargetType �� Property �� Value��%�   '        �� 5      "  6   .�5      ��  � �� �#9ACeeb63   �� 5       � ��$
 Bold"�63   �� 5       � ��$ 30��6/   5      5      5      �� 5!   
   
���   �$	 0.5Q�6$   (� 5#   
    (� Stretch$ Uniform=�6   $��15��6$   $��70��63   $	��400��6B   $��55 0 0 0q�6R   $
��Left=�6d   .��5$      ��  �� Orientation$ 
Horizontal=�6   .+�5%      �� $��0 1 70 1q�6   .+�5&      �� -   5         ��Name$ 
semesterCB��5&      $��Center=�63   $��16(�6z   $	��120��6�   5'      �� 5(       J� IsHitTestVisible .  $��Comic Sans MS)�69   $��Семестер��6T   
�������$��16(�6z   ��5)      �� 5*      " ��6$   .�5+   "   ��  � y�$ 	Collapsed=�6?    �� Triggers 5,   "   �� 5-   &    �� Binding 62   �� *Text+ �� ElementName$ 
semesterCB�� �� Value  6c   .a�5.   *   ��  � y�$ Visible=�6G   5/   '   51      53      54      �� 56      $��100 0 150 0q�6   .+�57      �� -   5        $ disciplineCB��57      $��16(�6b   $	��200��6p    �� DisplayMemberPath$ Discipline1��6�    �� SelectedItem 6|   �� *
Discipline+6�   �� 59       .  $��Comic Sans MS)�69   $��Дисциплина��6T   
�������$��16(�6|   ��5:      �� 5;      " ��6$   .�5<   "   ��  � y�$ 	Collapsed=�6?    5=   "   �� 5>   &    62   �� *Text+$ disciplineCB��  6e   .a�5?   *   ��  � y�$ Visible=�6G   5@   '   5B      5D      5E      �� 5G      -   5         ��Name$ referenceButton��5G      $��0q�62   
������ $��	100 0 0 0q�6|   $��30��6�   $��30��6�   .��5H      �� $��/Resource/reference.png��6   5I      5J      5K      5L      5M      