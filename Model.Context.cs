﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ControlStudyEntities : DbContext
    {
        private static ControlStudyEntities _context;

        public ControlStudyEntities()
            : base("name=ControlStudyEntities")
        {
        }

        public static ControlStudyEntities GetContext ()
        {
            if (_context == null)
                _context = new ControlStudyEntities();
            return _context;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Discipline> Disciplines { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Progress> Progresses { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Session> Sessions { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}
