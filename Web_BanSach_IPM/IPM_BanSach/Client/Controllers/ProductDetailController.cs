using Microsoft.AspNetCore.Mvc;
using Model.Models;

namespace Client.Controllers
{
    [Route("api/productDetail")]
    public class ProductDetailController : Controller
    {
        private BanSachContext db = new BanSachContext();
        [Route("productDetail/{id}")]
        [HttpGet]
        public IActionResult getSanPhamById(int id)
        {
            try
            {
                var x = from sp in db.Sanphams join gia in db.GiaCas on sp.SanpId equals gia.SanpId
                        
                        select new
                        {
                            sp.SanpId,
                            sp.SanpName,
                            sp.Image,
                            sp.Namsx,
                            sp.Size,
                            sp.Tomtat,
                            sp.Sotrang,
                            gia.Gia,
                            sp.Loai.LoaiName,
                            sp.Nsx.NsxName,
                            sp.Tg.TgName,
                            sp.TgId,
                            sp.LoaiId,
                            sp.NsxId
                        };
                var data = x.FirstOrDefault(x => x.SanpId == id);
                return Ok(data);
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("productSameAuthor/{id}")]
        public IActionResult getProductSameAuthor(int id)
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
                            sp.Tomtat,
                            sp.Sotrang,
                            gia.Gia,
                            sp.LoaiId,
                            sp.NsxId,
                            sp.TgId
                        };
                var data = x.Where(x => x.TgId == id).ToList();
                return Ok(data);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
