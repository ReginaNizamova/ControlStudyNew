   M S B A M L   `   `   `  ���� G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy  $    ControlStudy.AddEditUserWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ,localclr-namespace:ControlStudy     -     � Title$/  )Добавить пользователя�� � Icon$ /Resource/icon.ico�� � WindowStartupLocation$ CenterScreen=�$	��300��$	��500��$	��300��$	��500�����#031745.��� .+�(�  (� Stretch$ Uniform=�$	��230��.����  �� Orientation$ 
Horizontal=�.+��� -    ��Name$ textStackPanel��$	��150��$��0 0 50 0q�.+��� $��0 0 0 30q�.+��� -    ��Name$ 
familyText��$��Comic Sans MS)�   textBox#��[  $	��150������ *Person.Family+��  J� IsHitTestVisible .  $��фамилия��$��Comic Sans MS)�
�������$��16(�����  �� 
TargetType" ��.��� 	 �� Property	 � y�
 �� Value$
 	Collapsed=� �� Triggers ��  �� Binding �� *Text+ �� ElementName$ 
familyText�� �� Value  .a��� 	 � y�$
 Visible=��� $��	0 30 0 30q�.+��� -   $ nameText��$��Comic Sans MS)�#��[  $	��150������ *Person.Name+��  .  $��Comic Sans MS)�$��имя��
�������$��16(����� " ��.��� 	 � y�$
 	Collapsed=� ��  �� *Text+$ nameText��  .a��� 	 � y�$
 Visible=��� $��	0 30 0 30q�.+��� -   $ patronimicText��$��Comic Sans MS)�#��[  $	��150������ *Person.Patronimic+��  .  $��Comic Sans MS)�$�� отчество��
�������$��16(����� " ��.��� 	 � y�$
 	Collapsed=� ��  �� *Text+$ patronimicText��  .a��� 	 � y�$
 Visible=��� $��	0 30 0 30q�.+��� -    ��Name$ comboBoxGroup��$��16(� �� DisplayMemberPath$ Group1��$��Comic Sans MS)�$	��150��$��25�� �� SelectedItem �� *Person.Group+��  .  $��Comic Sans MS)�$��группа��
�������$��16(����� " ��.��� 	 � y�$
 	Collapsed=� ��  �� *Text+$ comboBoxGroup��  .a��� 	 � y�$
 Visible=��� -   $ textStackPanel2��$	��150��.+��� $��0 0 0 30q�.+��� -   $ comboBoxRole��$��16(�$ Role1��$	��150��$��25��$��Comic Sans MS)� �� *Role+��  .  $��Comic Sans MS)�$��роль��
�������$��16(����� " ��.��� 	 � y�$
 	Collapsed=� ��  �� *Text+$ comboBoxRole��  .a��� 	 � y�$
 Visible=��� $��	0 30 0 30q�.+��� -	   $ 	loginText��$��Comic Sans MS)�#��[  $	��150������ *	LoginUser+��  .  $��Comic Sans MS)�$��
логин��
�������$��16(����� " ��.��� 	 � y�$
 	Collapsed=� ��  �� *Text+$ 	loginText��  .a��� 	 � y�$
 Visible=��� $��	0 30 0 30q�.+��� -
   $ passwordPersonText�� � ToolTip$�  Не менее 8 символов 
 Строчные буквы 
 Заглавные буквы 
 Цифры 
 Символы��$��Comic Sans MS)�#��[  $	��150������ *
Password+��  .  $��Comic Sans MS)�$��пароль��
�������$��16(����� " ��.��� 	 � y�$
 	Collapsed=� ��  �� *Text+$ passwordPersonText��  .a��� 	 � y�$
 Visible=��� -    ��Name$ addUser��$��0 30 0 5q�$��25��$��Добавить��
�������$��14(�