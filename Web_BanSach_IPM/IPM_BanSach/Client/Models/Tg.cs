using System;
using System.Collections.Generic;

namespace Client.Models;

public partial class Tg
{
    public int TgId { get; set; }

    public string TgName { get; set; } = null!;

    public string? TgDiachi { get; set; }

    public int? Sdt { get; set; }

    public string? Email { get; set; }

    public virtual ICollection<Sanpham> Sanphams { get; set; } = new List<Sanpham>();
}
