using Microsoft.AspNetCore.Mvc;
using Model.Models;
using Model.Models.entity;

namespace Client.Controllers
{
    [Route("api/donhang")]
    public class PaymentController : Controller
    {
        private BanSachContext db = new BanSachContext();
        [Route("createDonHang")]
        [HttpPost]
        public IActionResult CreateDonHang([FromBody] CreateDonHang donhang)
        {
            try
            {

                var x = db.KhachHangs.Add(donhang.khach);
                db.SaveChanges();
                var donHang = new DonHang
                {
                    MaKhachHang = donhang.khach.MaKhachHang,
                    NgayDat = DateTime.Now, // You can change this as needed
                    TrangThai = "Chưa xác nhận", // You can change this as needed
                    ToTal = donhang.total,


                };
                db.DonHangs.Add(donHang);
                db.SaveChanges();
                foreach (var chitiet in donhang.ct)
                {
                    var chiTietDonHang = new ChiTietDonHang
                    {
                        MaDonHang = donHang.MaDonHang,
                        SanpId = chitiet.sanpId,
                        SoLuong = chitiet.quantity,
                        GiaMua = chitiet.gia
                    };
                    db.ChiTietDonHangs.Add(chiTietDonHang);
                    db.SaveChanges();
                }
                
                return Ok();


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
