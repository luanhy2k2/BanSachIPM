using System;
using System.Collections.Generic;

namespace Model.Models;

public partial class DonHang
{
    public int MaDonHang { get; set; }

    public int? MaNguoiDung { get; set; }

    public DateTime? NgayDat { get; set; }

    public string? TrangThai { get; set; }

    public int? ToTal { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual NguoiDung? MaNguoiDungNavigation { get; set; }
}
