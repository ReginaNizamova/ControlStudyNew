   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy  5   	       ControlStudy.FrameWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ControlStudy     5   	     � Title$  ControlStudy��5   	    � Icon$ /Resource/icon.ico��6    � WindowStartupLocation$ CenterScreen=�68   $	��480��6]   $	��850��6j   $	��480��6v   $	��850��6�    � 	Resources 5       �� 
TargetType   textBox �� Property �� Value 
 images �� Type �� 	UriSource��%�  &	        &	 n     �� 5   
   " ��6   .�5      ��  � ��$ 18(�6)   �� 5       � ��
 �����6+   5      �� 5   
   " ��6!   .s�5      �� $! /Resource/Background/01.jpg?�6   �� 5      $! /Resource/Background/02.jpg?�6   �� 5      $! /Resource/Background/03.jpg?�6   �� 5      $! /Resource/Background/04.jpg?�6   �� 5      $! /Resource/Background/05.jpg?�6   5      5      .��5      � 	 � ColumnDefinitions	 5   
   �� 5      $
��0.7* �6   �� 5      $��2* �6   �� 5      $��2* �6   .+�5    
   �� -   5        
 ��Name$
 backgroundImage��5       $��3��6)   $��UniformToFill=�6=    � 5"   
   -   5          �Name$ frame��5"   7   $��3��6F     � NavigationUIVisibility$ Hidden=�6Z   �� 5$   
   -   5        $��
buttonBack��5$   t   
������ $��0q�6*   $��35��6>   $	��Top=�6J   $��5 0 0  0q�6b   $
��Left=�6�   $��35��6�    � ToolTip 5%      _� 5&      .��5'      �� $��
Назад��6    5(      .��5*      �� $��/Resource/back.png��6   5+      5,      5-      