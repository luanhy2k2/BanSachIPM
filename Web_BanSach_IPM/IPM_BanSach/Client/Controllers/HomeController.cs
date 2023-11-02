using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Model.Models;
using Model.Models.entity;

namespace Client.Controllers
{
    [Route("api/Home")]
    public class HomeController : Controller
    {
        private BanSachContext db = new BanSachContext();
        [HttpGet]
        [Route("getLoaiSp")]
        public List<Loaisp> GetLoaiSp()
        {
            try
            {
                var data =  db.Loaisps.ToList();
                return data;
            }
            catch
            {
                throw new Exception();
            }
        }
        [HttpGet]
        [Route("banChay/{sl}")]
        public IActionResult HomeBanChay(int sl)
        {
            var query = from sanPham in db.Sanphams
                        join chiTietHoaDonBan in db.ChiTietHoaDonBans on sanPham.SanpId equals chiTietHoaDonBan.SanpId
                        join giaCa in db.GiaCas on sanPham.SanpId equals giaCa.SanpId
                        group new
                        {
                            chiTietHoaDonBan,
                            sanPham,
                            giaCa
                        } by new
                        {
                            chiTietHoaDonBan.SanpId,
                            sanPham.SanpName,
                            sanPham.Size,
                            sanPham.TgId,
                            sanPham.LoaiId,
                            sanPham.NsxId,
                            sanPham.Sotrang,
                            sanPham.Tomtat,
                            sanPham.Namsx,
                            sanPham.Image,
                            giaCa.Gia
                        } into g
                        select new 
                        {
                            g.Key.SanpId,
                            g.Key.SanpName,
                            g.Key.Size,
                            g.Key.TgId,
                            g.Key.LoaiId,
                            g.Key.NsxId,
                            g.Key.Sotrang,
                            g.Key.Tomtat,
                            g.Key.Namsx,
                            g.Key.Image,
                            g.Key.Gia,
                            SL = g.Sum(x => x.chiTietHoaDonBan.SoLuong)
                        }
                        into grouped
                        orderby grouped.SL descending
                        select grouped;

            var data =  query.Take(sl).ToList();
            return Ok(data);
        }
        [HttpGet]
        [Route("sanPhamMoi/{sl}")]
        public IActionResult HomSanPhamMoi(int sl)
        {
            try
            {
                var x = from cthdn in db.ChiTietHoaDonNhaps join sp in db.Sanphams on cthdn.SanpId equals sp.SanpId
                        join hdn in db.HoaDonNhaps on cthdn.SoHoaDon equals hdn.SoHoaDon join gia in db.GiaCas on sp.SanpId equals gia.SanpId
                        group new
                        {
                            cthdn, hdn, sp
                        }
                        by new
                        {
                            sp.SanpId, sp.SanpName, sp.Image, sp.Namsx, sp.Sotrang, gia.Gia, hdn.NgayNhap

                        } into g
                        select new
                        {
                            g.Key.SanpId, g.Key.SanpName, g.Key.Image, g.Key.Namsx, g.Key.Sotrang, g.Key.Gia, g.Key.NgayNhap
                        }
                        into grouped orderby grouped.NgayNhap descending
                        select grouped;
                var data = x.Take(sl).ToList();
                return Ok(data);
                        
            }
            catch(Exception ex) 
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("getSpByLoai/{id}/{sl}")]
        public IActionResult GetSpByLoai(int id, int sl)
        {
            try
            {
                var x = from sp in db.Sanphams join gia in db.GiaCas on sp.SanpId equals gia.SanpId
                        select new
                        {
                            sp.SanpId, sp.SanpName, sp.Image, sp.Namsx, sp.Size, sp.Sotrang, gia.Gia, sp.LoaiId
                        };
                var data = x.Where(x => x.LoaiId == id).ToList().Take(sl);
                return Ok(data);
            }
            catch(Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        [HttpGet]
        [Route("getSanPham/{PageIndex}/{PageSize}")]
        public IActionResult GetSanPham(int PageIndex, int PageSize)
        {
            try
            {
                var x = from sp in db.Sanphams
                        join gia in db.GiaCas on sp.SanpId equals gia.SanpId
                        select new
                        {
                            sp.SanpId,
                            sp.SanpName,
                            sp.Image,
                            sp.Namsx,
                            sp.Size,
                            sp.Sotrang,
                            gia.Gia,
                            sp.LoaiId,
                            sp.NsxId
                        };
                var products = x.Skip(PageIndex*PageSize).Take(PageSize).ToList();
                
                return Ok(products);

            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [HttpGet]
        [Route("productCount")]
        public int CountProduct()
        {
            try
            {
                var total = db.Sanphams.Count();
                return total;
            }
            catch(Exception er)
            {
                throw new Exception(er.Message);

            }
        }

        [HttpGet]
        [Route("GetSpByName/{name}")]
        

        public IActionResult GetSanPhamByName(string name)
        {
            try
            {
                var x = from sp in db.Sanphams
                        join gia in db.GiaCas on sp.SanpId equals gia.SanpId
                        select new
                        {
                            sp.SanpId,
                            sp.SanpName,
                            sp.Image,
                            sp.Namsx,
                            sp.Size,
                            sp.Sotrang,
                            gia.Gia,
                            sp.LoaiId,
                            sp.NsxId
                        };
                var data = x.Where(x => x.SanpName.Contains(name)).ToList();
                return Ok(data);

            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        
    }
}
