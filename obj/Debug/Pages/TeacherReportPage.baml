   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy  5      ;"clr-namespace:ControlStudy.ClassesControlStudy.Classes  60   m iSystem.Windows.Forms.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35�mclr-namespace:System.Windows.Forms.DataVisualization.Charting;assembly=System.Windows.Forms.DataVisualization/System.Windows.Forms.DataVisualization.Charting 5      *    $ControlStudy.Pages.TeacherReportPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:ControlStudy     5      5local1"clr-namespace:ControlStudy.Classes     60   �chartsmclr-namespace:System.Windows.Forms.DataVisualization.Charting;assembly=System.Windows.Forms.DataVisualization     5        N� Title$  TeacherReportPage��5
      .��5      �  � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $	��10* �6   .+�5   
   �� 
���   � J� Opacity$	 0.5Q�6$   (� 5   
    (� Stretch$ Uniform=�6   $��16��6$   $	��850��63   $��8q�6B   $
��Left=�6M   .��5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $��0 1 70 1q�6   .+�5      �� -   5         ��Name$ groupCB��5      $��Center=�60   $��16(�6t   $	��120��6�    �� DisplayMemberPath$ Group1��6�    �� SelectedItem 6�   �� *Person.Group+6�   �� 5       J� IsHitTestVisible .  $��Comic Sans MS)�69   $��Группа��6T   
�������$��16(�6x   ��5      �� 5      	 �� 
TargetType"	 ��6$   .�5   "   �� 
 �� Property
 � y� �� Value$ 	Collapsed=�6?    �� Triggers 5   "   �� 5   &    �� Binding 62   �� *Text+ �� ElementName$ groupCB�� �� Value  6`   .a�5   *   �� 
 � y�$ Visible=�6G   5   '   5!      5#      5$      �� 5&      $��100 0 150 0q�6   .+�5'      �� -   5        $ disciplineCB��5'      $��16(�6_   $	��200��6m   $ Discipline1��6�    6y   �� *
Discipline+6�   �� 5)       .  $��Comic Sans MS)�69   $��Дисциплина��6T   
�������$��16(�6|   ��5*      �� 5+      "	 ��6$   .�5,   "   �� 
 � y�$ 	Collapsed=�6?    5-   "   �� 5.   &    62   �� *Text+$ disciplineCB��  6e   .a�5/   *   �� 
 � y�$ Visible=�6G   50   '   52      54      55      �� 57      $��100 0 150 0q�6   .+�58      �� -   5        $ 
semesterCB��58      $��16(�6]   $	��120��6k    6w   �� *
Semester+.@�59      �� $��1��6'   �� 5:      $��2��6'   5;      �� 5=       .  $��Comic Sans MS)�69   $��Семестр��6T   
�������$��16(�6y   ��5>      �� 5?      "	 ��6$   .�5@   "   �� 
 � y�$ 	Collapsed=�6?    5A   "   �� 5B   &    62   �� *Text+$ 
semesterCB��  6c   .a�5C   *   �� 
 � y�$ Visible=�6G   5D   '   5F      5H      5I      �� 5K      $��
20 0 180 0q�6   .+�5L      �� -   5        $ chartCB��5L      $��16(�6Z   $	��150��6h    6t   �� *
Semester+�� 5N       .  $��Comic Sans MS)�69   $��Вид диаграммы��6T   
�������$��16(�6   ��5O      �� 5P      "	 ��6$   .�5Q   "   �� 
 � y�$ 	Collapsed=�6?    5R   "   �� 5S   &    62   �� *Text+$ chartCB��  6`   .a�5T   *   �� 
 � y�$ Visible=�6G   5U   '   5W      5Y      5Z      �� 5[      -   5         ��Name$ 	saveExcel��5[      $��30��6,   $��0q�6O   $��
20 0 150 0q�6c   
������ .��5\      �� $��/Resource/save.png��6   5]      5^      5_      7  1System.Windows.Forms.Integration.WindowsFormsHost  5a   
   $��1��6   $��10q�6(      Child. 5b      ;  5System.Windows.Forms.DataVisualization.Charting.Chart  -   5        chartGrades��   Legends 5c      <  6System.Windows.Forms.DataVisualization.Charting.Legend  5d      5f      5h      5i      5j      5k      