   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:ControlStudy.WindowsControlStudy.Windows  5   	   *    $ControlStudy.Windows.ReferenceWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:ControlStudy.Windows     5   	     � Title$/  )Справочная информация��5   	    � Icon$ /Resource/icon.ico��6'    � WindowStartupLocation$ CenterScreen=�6A   $	��300��6g   $	��500��6t   $	��300��6�   $	��500��6�   ���#031745.��5	      �  � RowDefinitions 5
   
   �� 5      �� 5      $��2* �6   .+�5   
   �� $��Center=�6   .+�5      �� $(��"1. Выберите семестр��6   $��	0 15 0 15q�63   $��14(�6F   
�������$��Comic Sans MS)�6g   �� 5      $.��(2. Выберите дисциплину��6   $��14(�66   
�������$��Comic Sans MS)�6W   5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ referenceData��5   j      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 6   $��1��6#      
IsReadOnly .    AutoGenerateColumns .  $��10q�6^   $��14(�6�    J� Opacity$
 0.85Q�6�   
�������	   AlternatingRowBackground	 �#9ACeeb
 �� AlternationCount$
 2��6�      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Семестр��6%      Width$
 0.5* 66   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6C   �� *
Semester+  5      $ Даты��6%   $ * 64    6>   �� *Dates+ � 	Resources 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� 
TargetType �� Property �� Value��%�   '        �� 5      "  6   .�5      ��  � �� �#9ACeeb63   �� 5       � ��$
 Bold"�63   �� 5       � ��$ 20��6/   5      5      5       5!      5"      