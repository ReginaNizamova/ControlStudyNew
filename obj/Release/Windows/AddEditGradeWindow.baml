   M S B A M L   `   `   `  ���� G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy  %    ControlStudy.AddEditGradeWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ,localclr-namespace:ControlStudy     -     � Title$#  Добавить оценку�� � Icon$ /Resource/icon.ico�� � WindowStartupLocation$ CenterScreen=�$	��300��$	��500��$	��300��$	��500��$	��300��$	��500�����#031745.��� .+�(�  (� Stretch$ Uniform=�$	��170��.����  �� Orientation$ 
Horizontal=�.+��� -    ��Name$ textStackPanel��$	��150��$��0 0 30 0q�.+��� $��0 0 0 30q�.+��� -    ��Name$ comboBoxGroup��$��16(� �� DisplayMemberPath$ Group1��$��Comic Sans MS)�$	��150��$��25�� �� SelectedItem �� *Person.Group+�� 	 J� IsHitTestVisible	 .  $��Comic Sans MS)�$��группа��
�������$��16(����� 
 �� 
TargetType"
 ��.���  �� Property � y� �� Value$ 	Collapsed=� �� Triggers ��  �� Binding �� *Text+ �� ElementName$ comboBoxGroup�� �� Value  .a���  � y�$ Visible=��� $��	0 30 0 30q�.+��� -   $ comboBoxPerson��$��16(�$��Comic Sans MS)�$	��150��$��25�� �� *Person.Family+�� 	 .  $��Comic Sans MS)�$��фамилия��
�������$��16(����� "
 ��.���  � y�$ 	Collapsed=� ��  �� *Text+$ comboBoxPerson��  .a���  � y�$ Visible=��� -   $ textStackPanel2��$	��150��.+��� $��0 0 0 30q�.+��� -   $ comboBoxDiscipline��$��16(�$ Discipline1��$	��150��$��25��$��Comic Sans MS)� �� *
Discipline+�� 	 .  $��Comic Sans MS)�$��дисциплина��
�������$��16(����� "
 ��.���  � y�$ 	Collapsed=� ��  �� *Text+$ comboBoxDiscipline��  .a���  � y�$ Visible=��� $��	0 30 0 30q�.+��� -    ��Name$ 	gradeText�� � ToolTip$ Цифры от 2 до 5��$��Comic Sans MS)�   textBox#��[  $	��150������ *Grade+�� 	 .  $��Comic Sans MS)�$��оценка��
�������$��16(����� "
 ��.���  � y�$ 	Collapsed=� ��  �� *Text+$ 	gradeText��  .a���  � y�$ Visible=��� -    ��Name$ addGrade��$��0 30 0 5q�$��25��$��Добавить��
�������$��14(��� -	   $ 	idStudent��$��0q�$��0��$��0��
������ 
������ 