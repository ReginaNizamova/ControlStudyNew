   M S B A M L   `   `   `  ���� G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ControlStudy.PagesControlStudy.Pages  '    !ControlStudy.Pages.AdminUsersPage   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     2local clr-namespace:ControlStudy.Pages       N� Title$  	UsersPage��.���  � RowDefinitions �� $��7* ��� $��* �.+��� $��1��
���   � J� Opacity$	 0.5Q�&   System.Windows.Controls.DataGrid  -     Name$ dataGridAdmin��   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * $   HorizontalScrollBarVisibility$
 Auto=�   AutoGenerateColumns .     
IsReadOnly . $��1��$��25q�$��15(�$
 0.85Q�
�������   AlternatingRowBackground �#9ACeeb	 �� AlternationCount$	 2��
   Columns
 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Роль��   Width$
 1.5* 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
Role.Role1+  $ 
Логин��$ *  �� *	LoginUser+  $ Пароль��$ *  �� *
Password+  $ Группа��$ *  �� *Person.Group.Group1+  $ Фамилия��$
 1.5*  �� *Person.Family+  $ Имя��$ *  �� *Person.Name+  $ Отчество��$ *  �� *Person.Patronimic+4  .System.Windows.Controls.DataGridTemplateColumn  $	 100    CellTemplate �� .R���  ��Name$
 edit��-   $	��100��$��0q�
������ $��14(�$ ��Редактировать�� � 	Resources =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� 
TargetType �� Property �� Value��%a   '        �� "  .���  � �� �#9ACeeb��  � ��$
 Bold"���  � ��$ 30���� $��Center=�$��1��$��1�� �� Orientation$ 
Horizontal=�.+��� -   $	 add��$��0q�$��0 0 70 0q�$��50��
������ .���� $��/Resource/addUser.png���� -   $ delete��$��0q�$��60��
������ .���� $��/Resource/deleteUser.png��