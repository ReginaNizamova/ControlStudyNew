﻿#pragma checksum "..\..\..\Windows\AddEditGradeWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "B33F6878DBB768DD9D196D9F355C3741721A1A8905F6710FCCC3C761C47C90CA"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using ControlStudy;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace ControlStudy {
    
    
    /// <summary>
    /// AddEditGradeWindow
    /// </summary>
    public partial class AddEditGradeWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 12 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.StackPanel textStackPanel;
        
        #line default
        #line hidden
        
        
        #line 14 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox comboBoxGroup;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox comboBoxPerson;
        
        #line default
        #line hidden
        
        
        #line 49 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.StackPanel textStackPanel2;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox comboBoxDiscipline;
        
        #line default
        #line hidden
        
        
        #line 68 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox gradeText;
        
        #line default
        #line hidden
        
        
        #line 82 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button addGrade;
        
        #line default
        #line hidden
        
        
        #line 83 "..\..\..\Windows\AddEditGradeWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox idStudent;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/ControlStudy;component/windows/addeditgradewindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Windows\AddEditGradeWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 8 "..\..\..\Windows\AddEditGradeWindow.xaml"
            ((ControlStudy.AddEditGradeWindow)(target)).Closed += new System.EventHandler(this.WindowClosed);
            
            #line default
            #line hidden
            return;
            case 2:
            this.textStackPanel = ((System.Windows.Controls.StackPanel)(target));
            return;
            case 3:
            this.comboBoxGroup = ((System.Windows.Controls.ComboBox)(target));
            
            #line 14 "..\..\..\Windows\AddEditGradeWindow.xaml"
            this.comboBoxGroup.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.СomboBoxGroupOnSelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.comboBoxPerson = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 5:
            this.textStackPanel2 = ((System.Windows.Controls.StackPanel)(target));
            return;
            case 6:
            this.comboBoxDiscipline = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 7:
            this.gradeText = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            this.addGrade = ((System.Windows.Controls.Button)(target));
            
            #line 82 "..\..\..\Windows\AddEditGradeWindow.xaml"
            this.addGrade.Click += new System.Windows.RoutedEventHandler(this.AddEditGradeClick);
            
            #line default
            #line hidden
            return;
            case 9:
            this.idStudent = ((System.Windows.Controls.TextBox)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

