//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ControlStudy
{
    using System;
    using System.Collections.Generic;
    
    public partial class Session
    {
        public int IdSession { get; set; }
        public int IdPerson { get; set; }
        public System.DateTime DateSession { get; set; }
        public string Time { get; set; }
    
        public virtual Person Person { get; set; }
    }
}