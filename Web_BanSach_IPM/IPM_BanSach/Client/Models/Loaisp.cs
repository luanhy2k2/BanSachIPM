using System;
using System.Collections.Generic;

namespace Client.Models;

public partial class Loaisp
{
    public int LoaiId { get; set; }

    public string LoaiName { get; set; } = null!;

    public virtual ICollection<Sanpham> Sanphams { get; set; } = new List<Sanpham>();
}
