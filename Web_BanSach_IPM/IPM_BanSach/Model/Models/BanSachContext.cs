using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Model.Models;

public partial class BanSachContext : DbContext
{
    public BanSachContext()
    {
    }

    public BanSachContext(DbContextOptions<BanSachContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ChiTietAnh> ChiTietAnhs { get; set; }

    public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }

    public virtual DbSet<ChiTietHoaDonBan> ChiTietHoaDonBans { get; set; }

    public virtual DbSet<ChiTietHoaDonNhap> ChiTietHoaDonNhaps { get; set; }

    public virtual DbSet<ChiTietKho> ChiTietKhos { get; set; }

    public virtual DbSet<Danhmuc> Danhmucs { get; set; }

    public virtual DbSet<DonHang> DonHangs { get; set; }

    public virtual DbSet<GiaCa> GiaCas { get; set; }

    public virtual DbSet<HoaDonBan> HoaDonBans { get; set; }

    public virtual DbSet<HoaDonNhap> HoaDonNhaps { get; set; }

    public virtual DbSet<KhachHang> KhachHangs { get; set; }

    public virtual DbSet<Kho> Khos { get; set; }

    public virtual DbSet<Loaisp> Loaisps { get; set; }

    public virtual DbSet<NguoiDung> NguoiDungs { get; set; }

    public virtual DbSet<Nhasx> Nhasxes { get; set; }

    public virtual DbSet<Sanpham> Sanphams { get; set; }

    public virtual DbSet<Slide> Slides { get; set; }

    public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }

    public virtual DbSet<Tg> Tgs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=ADMIN;Database=BanSach;Trusted_Connection=True;Encrypt=False;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ChiTietAnh>(entity =>
        {
            entity.HasKey(e => e.MaAnhChiTiet);

            entity.ToTable("ChiTietAnh");

            entity.Property(e => e.Anh).HasMaxLength(2000);
            entity.Property(e => e.SanpId).HasColumnName("sanp_id");

            entity.HasOne(d => d.Sanp).WithMany(p => p.ChiTietAnhs)
                .HasForeignKey(d => d.SanpId)
                .HasConstraintName("FK__ChiTietAn__sanp___70DDC3D8");
        });

        modelBuilder.Entity<ChiTietDonHang>(entity =>
        {
            entity.HasKey(e => e.MaChiTietDonHang);

            entity.ToTable("ChiTietDonHang");

            entity.Property(e => e.SanpId).HasColumnName("sanp_id");

            entity.HasOne(d => d.MaDonHangNavigation).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.MaDonHang)
                .HasConstraintName("FK__ChiTietDo__MaDon__71D1E811");

            entity.HasOne(d => d.Sanp).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.SanpId)
                .HasConstraintName("FK__ChiTietDo__sanp___72C60C4A");
        });

        modelBuilder.Entity<ChiTietHoaDonBan>(entity =>
        {
            entity.HasKey(e => e.MaChiTietHoaDonBan);

            entity.ToTable("ChiTietHoaDonBan");

            entity.Property(e => e.SanpId).HasColumnName("sanp_id");

            entity.HasOne(d => d.Sanp).WithMany(p => p.ChiTietHoaDonBans)
                .HasForeignKey(d => d.SanpId)
                .HasConstraintName("FK__ChiTietHo__sanp___73BA3083");

            entity.HasOne(d => d.SoHoaDonNavigation).WithMany(p => p.ChiTietHoaDonBans)
                .HasForeignKey(d => d.SoHoaDon)
                .HasConstraintName("FK__ChiTietHo__SoHoa__74AE54BC");
        });

        modelBuilder.Entity<ChiTietHoaDonNhap>(entity =>
        {
            entity.HasKey(e => e.MaChiTietHoaDonNhap);

            entity.ToTable("ChiTietHoaDonNhap");

            entity.Property(e => e.SanpId).HasColumnName("sanp_id");

            entity.HasOne(d => d.Sanp).WithMany(p => p.ChiTietHoaDonNhaps)
                .HasForeignKey(d => d.SanpId)
                .HasConstraintName("FK__ChiTietHo__sanp___75A278F5");

            entity.HasOne(d => d.SoHoaDonNavigation).WithMany(p => p.ChiTietHoaDonNhaps)
                .HasForeignKey(d => d.SoHoaDon)
                .HasConstraintName("FK__ChiTietHo__SoHoa__76969D2E");
        });

        modelBuilder.Entity<ChiTietKho>(entity =>
        {
            entity.HasKey(e => e.MaChiTietKho);

            entity.ToTable("ChiTietKho");

            entity.Property(e => e.SanpId).HasColumnName("sanp_id");

            entity.HasOne(d => d.MaKhoNavigation).WithMany(p => p.ChiTietKhos)
                .HasForeignKey(d => d.MaKho)
                .HasConstraintName("FK__ChiTietKh__MaKho__778AC167");

            entity.HasOne(d => d.Sanp).WithMany(p => p.ChiTietKhos)
                .HasForeignKey(d => d.SanpId)
                .HasConstraintName("FK__ChiTietKh__sanp___787EE5A0");
        });

        modelBuilder.Entity<Danhmuc>(entity =>
        {
            entity.HasKey(e => e.MaDanhMuc).HasName("PK__danhmucs__6B0F914CC7971A65");

            entity.ToTable("danhmucs");

            entity.Property(e => e.MaDanhMuc).HasColumnName("maDanhMuc");
            entity.Property(e => e.TenDanhMuc)
                .HasMaxLength(50)
                .HasColumnName("tenDanhMuc");
        });

        modelBuilder.Entity<DonHang>(entity =>
        {
            entity.HasKey(e => e.MaDonHang);

            entity.ToTable("DonHang");

            entity.Property(e => e.NgayDat).HasColumnType("date");
            entity.Property(e => e.TrangThai).HasMaxLength(50);

            entity.HasOne(d => d.MaNguoiDungNavigation).WithMany(p => p.DonHangs)
                .HasForeignKey(d => d.MaNguoiDung)
                .HasConstraintName("FK__DonHang__MaNguoi__4D5F7D71");
        });

        modelBuilder.Entity<GiaCa>(entity =>
        {
            entity.HasKey(e => e.MaSo);

            entity.ToTable("GiaCa");

            entity.Property(e => e.NgayBatDau).HasColumnType("date");
            entity.Property(e => e.NgayKetThuc).HasColumnType("date");
            entity.Property(e => e.SanpId).HasColumnName("sanp_id");

            entity.HasOne(d => d.Sanp).WithMany(p => p.GiaCas)
                .HasForeignKey(d => d.SanpId)
                .HasConstraintName("FK__GiaCa__sanp_id__7A672E12");
        });

        modelBuilder.Entity<HoaDonBan>(entity =>
        {
            entity.HasKey(e => e.SoHoaDon);

            entity.ToTable("HoaDonBan");

            entity.Property(e => e.NgayBan).HasColumnType("date");

            entity.HasOne(d => d.MaNguoiDungNavigation).WithMany(p => p.HoaDonBans)
                .HasForeignKey(d => d.MaNguoiDung)
                .HasConstraintName("FK__HoaDonBan__MaNgu__4E53A1AA");
        });

        modelBuilder.Entity<HoaDonNhap>(entity =>
        {
            entity.HasKey(e => e.SoHoaDon);

            entity.ToTable("HoaDonNhap");

            entity.Property(e => e.NgayNhap).HasColumnType("date");
            entity.Property(e => e.NsxId).HasColumnName("nsx_id");

            entity.HasOne(d => d.MaNguoiDungNavigation).WithMany(p => p.HoaDonNhaps)
                .HasForeignKey(d => d.MaNguoiDung)
                .HasConstraintName("FK__HoaDonNha__MaNgu__7C4F7684");

            entity.HasOne(d => d.Nsx).WithMany(p => p.HoaDonNhaps)
                .HasForeignKey(d => d.NsxId)
                .HasConstraintName("FK__HoaDonNha__nsx_i__7D439ABD");
        });

        modelBuilder.Entity<KhachHang>(entity =>
        {
            entity.HasKey(e => e.MaKhachHang);

            entity.ToTable("KhachHang");

            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Sdt)
                .HasMaxLength(50)
                .HasColumnName("SDT");
            entity.Property(e => e.TenKhachHang).HasMaxLength(50);
        });

        modelBuilder.Entity<Kho>(entity =>
        {
            entity.HasKey(e => e.MaKho);

            entity.ToTable("Kho");

            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.TenKho).HasMaxLength(50);
        });

        modelBuilder.Entity<Loaisp>(entity =>
        {
            entity.HasKey(e => e.LoaiId).HasName("PK__Loaisp__25B10ED8CFF4A13C");

            entity.ToTable("Loaisp");

            entity.Property(e => e.LoaiId).HasColumnName("loai_id");
            entity.Property(e => e.LoaiName)
                .HasMaxLength(50)
                .HasColumnName("loai_name");
        });

        modelBuilder.Entity<NguoiDung>(entity =>
        {
            entity.HasKey(e => e.MaNguoiDung);

            entity.ToTable("NguoiDung");

            entity.Property(e => e.DiaChi).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.GioiTinh).HasMaxLength(50);
            entity.Property(e => e.HoTen).HasMaxLength(50);
            entity.Property(e => e.NgaySinh).HasColumnType("date");
            entity.Property(e => e.Sdt)
                .HasMaxLength(50)
                .HasColumnName("SDT");
        });

        modelBuilder.Entity<Nhasx>(entity =>
        {
            entity.HasKey(e => e.NsxId).HasName("PK__Nhasx__298823BF63C9F7C9");

            entity.ToTable("Nhasx");

            entity.Property(e => e.NsxId).HasColumnName("nsx_id");
            entity.Property(e => e.Diachi)
                .HasMaxLength(50)
                .HasDefaultValueSql("((0))")
                .HasColumnName("diachi");
            entity.Property(e => e.NsxName)
                .HasMaxLength(50)
                .HasColumnName("nsx_name");
            entity.Property(e => e.Sdt)
                .HasDefaultValueSql("((0))")
                .HasColumnName("sdt");
        });

        modelBuilder.Entity<Sanpham>(entity =>
        {
            entity.HasKey(e => e.SanpId).HasName("PK__Sanpham__FBCD4D6E2FFB617E");

            entity.ToTable("Sanpham");

            entity.Property(e => e.SanpId).HasColumnName("sanp_id");
            entity.Property(e => e.Image)
                .HasMaxLength(50)
                .HasColumnName("image");
            entity.Property(e => e.LoaiId).HasColumnName("loai_id");
            entity.Property(e => e.Namsx)
                .HasColumnType("datetime")
                .HasColumnName("namsx");
            entity.Property(e => e.NsxId).HasColumnName("nsx_id");
            entity.Property(e => e.SanpName)
                .HasMaxLength(250)
                .HasColumnName("sanp_name");
            entity.Property(e => e.Size)
                .HasMaxLength(50)
                .HasColumnName("size");
            entity.Property(e => e.Sotrang).HasColumnName("sotrang");
            entity.Property(e => e.TgId).HasColumnName("TG_id");
            entity.Property(e => e.Tomtat)
                .HasMaxLength(2000)
                .HasDefaultValueSql("((0))")
                .HasColumnName("tomtat");

            entity.HasOne(d => d.Loai).WithMany(p => p.Sanphams)
                .HasForeignKey(d => d.LoaiId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Sanpham__loai_id__7F2BE32F");

            entity.HasOne(d => d.Nsx).WithMany(p => p.Sanphams)
                .HasForeignKey(d => d.NsxId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Sanpham__nsx_id__00200768");

            entity.HasOne(d => d.Tg).WithMany(p => p.Sanphams)
                .HasForeignKey(d => d.TgId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Sanpham__TG_id__01142BA1");
        });

        modelBuilder.Entity<Slide>(entity =>
        {
            entity.HasKey(e => e.MaSlide);

            entity.ToTable("Slide");

            entity.Property(e => e.Link).HasMaxLength(200);
            entity.Property(e => e.Slide1)
                .HasMaxLength(2000)
                .HasColumnName("Slide");
        });

        modelBuilder.Entity<TaiKhoan>(entity =>
        {
            entity.HasKey(e => e.MaTaiKhoan);

            entity.ToTable("TaiKhoan");

            entity.Property(e => e.LoaiQuyen).HasMaxLength(50);
            entity.Property(e => e.MatKhau).HasMaxLength(50);
            entity.Property(e => e.NgayBatDau).HasColumnType("date");
            entity.Property(e => e.NgayKetThuc).HasColumnType("date");
            entity.Property(e => e.TaiKhoan1)
                .HasMaxLength(50)
                .HasColumnName("TaiKhoan");
            entity.Property(e => e.TrangThai).HasMaxLength(50);

            entity.HasOne(d => d.MaNguoiDungNavigation).WithMany(p => p.TaiKhoans)
                .HasForeignKey(d => d.MaNguoiDung)
                .HasConstraintName("FK__TaiKhoan__MaNguo__02084FDA");
        });

        modelBuilder.Entity<Tg>(entity =>
        {
            entity.HasKey(e => e.TgId).HasName("PK__TG__3C5C20862CD58364");

            entity.ToTable("TG");

            entity.Property(e => e.TgId).HasColumnName("TG_id");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .HasColumnName("email");
            entity.Property(e => e.Sdt)
                .HasDefaultValueSql("((0))")
                .HasColumnName("sdt");
            entity.Property(e => e.TgDiachi)
                .HasMaxLength(50)
                .HasDefaultValueSql("((0))")
                .HasColumnName("TG_diachi");
            entity.Property(e => e.TgName)
                .HasMaxLength(50)
                .HasColumnName("TG_name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
