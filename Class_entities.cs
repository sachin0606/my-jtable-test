using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace myapp_webform
{
    public class Class_entities
    {
    }

    public class cls_Area
    {
        [Key]
        public int Area_id { get; set; }
        [Required]
        public string AreaName { get; set; }

        [Required]
        public string Description { get; set; }

    }

    public class cls_customer
    {
        [Key]
        public int id { get; set; }
        [Required]
        public string cust_id { get; set; }

        [Required]
        public string First_Name { get; set; }

        public string MiddleName { get; set; }

        public string LastName { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        public decimal BalanceAmt { get; set; }
        [Required]
        public string stbno { get; set; }

        [Required]
        public string vcno { get; set; }
        [Required]
        public int MobileNo { get; set; }

        public int Area_id { get; set; }
        [Required]
        public DateTime connectionDate { get; set; }

        [Required]
        public bool isactive { get; set; }

        public string remarks { get; set; }
    }
}