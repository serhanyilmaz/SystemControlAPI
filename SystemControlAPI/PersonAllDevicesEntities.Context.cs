﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SystemControlAPI
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class PersonAllDevicesEntities : DbContext
    {
        public PersonAllDevicesEntities()
            : base("name=PersonAllDevicesEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
    
        public virtual ObjectResult<PersonAllDevices_Result> PersonAllDevices(Nullable<int> pid)
        {
            var pidParameter = pid.HasValue ?
                new ObjectParameter("pid", pid) :
                new ObjectParameter("pid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<PersonAllDevices_Result>("PersonAllDevices", pidParameter);
        }
    }
}
