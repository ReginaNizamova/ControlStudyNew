   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ControlStudy.PagesControlStudy.Pages  5      '    !ControlStudy.Pages.AdminUsersPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ControlStudy.Pages     5        N� Title$  	UsersPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��7* �6   �� 5      $��* �6   .+�5   
   �� $��0 10 0 0q�6   .+�5      �� -   5         ��Name$ 
filterText��5      $
��Left=�6*   $��25 0 0 0q�6E   $	��400��6W   $	��200��6f   $��25��6u   $��Center=�6�    � ToolTip$T NФильтрация по роли, логину, группе, фамилии��6�   $��16(�6   �� 5      $��30 0 0 0q�6    J� IsHitTestVisible .  $��Comic Sans MS)�6C   $��Фильтр��6^   
�������$��16(�6�   ��5      �� 5       �� 
TargetType" ��6   .�5      ��  �� Property � y� �� Value$ 	Collapsed=�67    �� Triggers 5      �� 5      	 �� Binding	 6*   �� *Text+
 �� ElementName$
 
filterText�� �� Value  6[   .a�5   "   ��  � y�$ Visible=�6?   5      5      5       5!      �� 5#   
   $��2��6   
���   � J� Opacity$	 0.5Q�61   &   System.Windows.Controls.DataGrid  5%   
   -   5          Name$ dataGridAdmin��5%   �   $��1��6      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 6    $   HorizontalScrollBarVisibility$
 Auto=�60      AutoGenerateColumns .     
IsReadOnly . $��1��6�   $��25 10 15 15q�6�   $��15(�6�   $
 0.85Q�6�   
�������   AlternatingRowBackground �#9ACeeb �� AlternationCount$ 2��6     Columns 5&      0  *System.Windows.Controls.DataGridTextColumn  5'      ,  &System.Windows.Controls.DataGridColumn   Header$ Роль��6%      Width$
 1.5* 6W   1  +System.Windows.Controls.DataGridBoundColumn   Binding 68   �� *
Role.Role1+6W     5(      $ 
Логин��6%   $ * 6V    68   �� *	LoginUser+6V     5)      $ Пароль��6%   $ * 6U    68   �� *
Password+6U     5*      $ Группа��6%   $ * 6Y    68   �� *Group.Group1+6Y     5+      $ Фамилия��6%   $
 1.5* 6S    68   �� *Family+6S     5,      $ Имя��6%   $ * 6Q    68   �� *Name+6Q     5-      $ Отчество��6%   $ * 6W    68   �� *
Patronimic+6W   4  .System.Windows.Controls.DataGridTemplateColumn  5.      $	 100 6)      CellTemplate 5/      �� 50      .R�51      ��  ��Name$
 edit��6�   -   5        $	��100��51   %   $��0q�61   
������ $��14(�6^   $ ��Редактировать��6l   6�   52      54       � 	Resources 56      =  7System.Windows.Controls.Primitives.DataGridColumnHeader��%�   '        �� 57      "  6   .�58      ��  � �� �#9ACeeb63   �� 59       � ��$
 Bold"�63   �� 5:       � ��$ 30��6/   5;      5<      5=      �� 5?   
   $��Center=�6   $��1��62   $��2��6B    �� Orientation$ 
Horizontal=�6O   .+�5@      �� -   5        $	 add��5@      $��0q�63   $��0 0 70 0q�6G   $��50��6Y   
������ .��5A      �� $��/Resource/addUser.png��6   5B      �� 5D      -   5        $ delete��5D      $��0q�69   $��60��6M   
������ .��5E      �� $��/Resource/deleteUser.png��6   5F      5G      5H      5I      