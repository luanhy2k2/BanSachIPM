using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Models.entity
{
    public class ct
    {
        public int sanpId { get; set; }
        public int gia { get; set; }
        public int quantity { get; set; }
    }
    public class CreateDonHang
    {
        public KhachHang khach { get; set; }
 
        public List<ct> ct { get; set; }
        public int total { get; set; }
    }
}
