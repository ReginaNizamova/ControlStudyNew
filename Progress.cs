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
    
    public partial class Progress
    {
        public int IdProgress { get; set; }
        public int IdPerson { get; set; }
        public int IdDiscipline { get; set; }
        public int Grade { get; set; }
        public System.DateTime DateGrade { get; set; }

        private DateTime _endDate;
        public DateTime EndDate
        { 
            get
            {
                _endDate = DateTime.Today.Date;
                return _endDate;
            }

            set
            {
                EndDate = _endDate;
            }
        }

        public int Semester { get; set; }
    
        public virtual Discipline Discipline { get; set; }
        public virtual Person Person { get; set; }
    }
}