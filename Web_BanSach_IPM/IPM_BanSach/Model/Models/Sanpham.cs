﻿using System;
using System.Collections.Generic;

namespace Model.Models;

public partial class Sanpham
{
    public int SanpId { get; set; }

    public string SanpName { get; set; } = null!;

    public string Size { get; set; } = null!;

    public int TgId { get; set; }

    public int LoaiId { get; set; }

    public int NsxId { get; set; }

    public int Sotrang { get; set; }

    public string Tomtat { get; set; } = null!;

    public DateTime? Namsx { get; set; }

    public string? Image { get; set; }

    public virtual ICollection<ChiTietAnh> ChiTietAnhs { get; set; } = new List<ChiTietAnh>();

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual ICollection<ChiTietHoaDonBan> ChiTietHoaDonBans { get; set; } = new List<ChiTietHoaDonBan>();

    public virtual ICollection<ChiTietHoaDonNhap> ChiTietHoaDonNhaps { get; set; } = new List<ChiTietHoaDonNhap>();

    public virtual ICollection<ChiTietKho> ChiTietKhos { get; set; } = new List<ChiTietKho>();

    public virtual ICollection<GiaCa> GiaCas { get; set; } = new List<GiaCa>();
    public virtual ICollection<ProductComment> ProductComments { get; set; } = new List<ProductComment>();

    public virtual Loaisp Loai { get; set; } = null!;

    public virtual Nhasx Nsx { get; set; } = null!;

    public virtual Tg Tg { get; set; } = null!;
}
