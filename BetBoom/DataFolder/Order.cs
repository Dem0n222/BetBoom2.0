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
    
    public partial class Order
    {
        public int IdOrder { get; set; }
        public int IdProdukt { get; set; }
        public System.DateTime DataOrder { get; set; }
        public decimal Price { get; set; }
        public string PriceAll { get; set; }
        public Nullable<int> IdProvider { get; set; }
        public Nullable<int> QuantityOrder { get; set; }
    
        public virtual Produkts Produkts { get; set; }
        public virtual Provider Provider { get; set; }
    }
}
