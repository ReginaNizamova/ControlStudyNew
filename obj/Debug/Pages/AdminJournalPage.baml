   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ControlStudy.PagesControlStudy.Pages  5      )    #ControlStudy.Pages.AdminJournalPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ControlStudy.Pages     5        N� Title$  AdminJournalPage��5	      .��5      �  � ColumnDefinitions 5   
   �� 5      $
��191* �6   �� 5      $
��209* �6    � RowDefinitions 5   
   �� 5      �� 5      $	��11* �6   .+�5   
   �� $��0 10 0 0q�6   .+�5      �� -   5         ��Name$ 
filterText��5      $
��Left=�6*   $��25 0 0 0q�6E   $	��400��6W   $	��200��6f   $��25��6u   $��Center=�6�    � ToolTip$8 2Фильтрация по фамилии, дате��6�   $��16(�6�   �� 5      $��30 0 0 0q�6    J� IsHitTestVisible .  $��Comic Sans MS)�6C   $��Фильтр��6^   
�������$��16(�6�   ��5      �� 5       �� 
TargetType" ��6   .�5      ��  �� Property � y� �� Value$ 	Collapsed=�67   	 �� Triggers	 5      �� 5      
 �� Binding
 6*   �� *Text+ �� ElementName$ 
filterText�� �� Value  6[   .a�5   "   ��  � y�$ Visible=�6?   5      5!      5#      5$      &   System.Windows.Controls.DataGrid  5&   
   -   5          Name$ dataGridAdmin��5&   �   $��1��6      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 6!   $   HorizontalScrollBarVisibility$
 Auto=�61      AutoGenerateColumns .     
IsReadOnly . $��25 10 15 15q�6�   $��15(�6�    J� Opacity$
 0.85Q�6�   
�������   AlternatingRowBackground �#9ACeeb �� AlternationCount$ 2��6  $��2��6     Columns 5'      0  *System.Windows.Controls.DataGridTextColumn  5(      ,  &System.Windows.Controls.DataGridColumn   Header$ 
Логин��6%      Width$
 0.7* 6[   1  +System.Windows.Controls.DataGridBoundColumn   Binding 66   �� *Person.LoginUser+6[     5)      $ Фамилия��6%   $
 0.8* 6Z    68   �� *Person.Family+6Z     5*      $ Имя��6%   $
 0.6* 6X    68   �� *Person.Name+6X     5+      $' !Дата и время входа��6%   $
 1.5* 6�    6A   �� *DateSession+ �� StringFormat$ dd.MM.yy HH:mm:ss��6�     5,      $ Время в сети��6%   $ * 6X    6?   �� *Time+6X     5-      $) #Дата и время выхода��6%   $
 1.5* 6�    6B   �� *EndDateSession+$ dd.MM.yy HH:mm:ss��6�    � 	Resources 5/      =  7System.Windows.Controls.Primitives.DataGridColumnHeader��%�   '        �� 50      "  6   .�51      ��  � �� �#9ACeeb63   �� 52       � ��$
 Bold"�63   �� 53       � ��$ 30��6/   54      55      56      57      58      