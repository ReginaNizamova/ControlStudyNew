   M S B A M L   `   `   `  ����G  CControlStudy, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ControlStudyControlStudy  5      $    ControlStudy.AuthorizationPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:ControlStudy     5        � 	Resources  5	       �� 
TargetType   textBox �� Property �� Value  	textBlock��%�   &	        &	 n     �� 5
   
   " ��6   .�5      ��  � ��$ 18(�6)   �� 5       � ��
 �����6+   5      �� 5   
   " ��6   .�5      ��  � ��$ 18(�6)   �� 5       � ��
 �����6+   5      5      .��5      � .+�5   
   (�  (� Stretch$ Uniform=�6   $��1��6$   $	��250��64   $��	70 0 70 0q�6C   .��5      ��  �� Orientation$ Vertical=�6   .+�5      �� $	��150��6   .+�5      �� $��0 0 0 30q�6   .+�5      �� -   5         ��Name$ 	loginText��5   D   #��[  6#   $	��150��6W   �� 5       J� IsHitTestVisible .  $��
Логин��6=   
�������$��18(�6`   ��5      �� 5   "   " ��6(   .�5   &   ��  � y�$ 	Collapsed=�6C    �� Triggers 5   &   �� 5    *   	 �� Binding	 66   �� *Text+
 �� ElementName$
 	loginText�� �� Value  6f   .a�5!   .   ��  � y�$ Visible=�6K   5"   +   5$   #   5&      5'      �� 5)      $��	0 30 0 30q�6   .+�5*      G� -   5         G�Name$ passwordPersonText��5*   8    G� PasswordChar$ ~��6&   $	��150��6T   $��18(�6`   
�������6�   �� 5+      -   5         ��Name$ passwordText��5+   $   #��[ 6:   $��Пароль��6]   5,      5-      �� 5.      -   5        $��0 30 0 0q�5.      
������ $��
Войти��6D   $��18(�6T   $
��Bold"�6b   6u   5/      50      51      52      