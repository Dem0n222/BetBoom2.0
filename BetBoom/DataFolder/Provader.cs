//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BetBoom.DataFolder
{
    using System;
    using System.Collections.Generic;
    
    public partial class Provader
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Provader()
        {
            this.Order = new HashSet<Order>();
        }
    
        public int IdProvader { get; set; }
        public string NameProvader { get; set; }
        public int IdCantri { get; set; }
        public int IdCite { get; set; }
        public int IdStrit { get; set; }
    
        public virtual Cantri Cantri { get; set; }
        public virtual Cite Cite { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
        public virtual Strit Strit { get; set; }
    }
}
