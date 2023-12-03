using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Models.entity
{
    public class product {
        public int SanpId { get; set; }

        public string SanpName { get; set; } = null!;

        public string Size { get; set; } = null!;
        public DateTime? Namsx { get; set; }

        public string? Image { get; set; }
        public int LoaiId { get; set; }

        public int NsxId { get; set; }
        public int gia { get; set; }
        public int sotrang { get; set; }
    }
    public class GetAllProduct
    {
        public List<product> products { get; set; }
        public int total { get; set; }
    }
}
