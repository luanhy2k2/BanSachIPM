using Microsoft.AspNetCore.Mvc;
using Model.Models;
using Model.Models.entity;

namespace Admin.Controllers
{
    [Route("api/product")]
    public class ProductController : Controller
    {
        private BanSachContext db = new BanSachContext();
        [Route("create")]
        [HttpPost]
        public IActionResult create([FromBody] addProduct product)
        {
            try
            {
                var x = db.Sanphams.Add(product.sanpham);
                db.SaveChanges();
                var giaCa = new GiaCa();
                giaCa.SanpId = product.sanpham.SanpId;
                giaCa.Gia = product.gia;
                giaCa.NgayBatDau = DateTime.Now;
                db.GiaCas.Add(giaCa);
                db.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPost]
        [Route("update")]
        public IActionResult update(Sanpham product, int gia)
        {
            try
            {
                var data = db.Sanphams.FirstOrDefault(x => x.SanpId == product.SanpId);
                if (data == null)
                {
                    return NotFound($"product with id {product.SanpId} not found");
                }
                data.SanpName = product.SanpName;
                data.Namsx = product.Namsx;
                data.Sotrang = product.Sotrang;
                data.NsxId = product.NsxId;
                data.Size = product.Size;
                data.Image = product.Image;
                data.TgId = product.TgId;
                data.LoaiId = product.LoaiId;
                data.Tomtat = product.Tomtat;
                db.SaveChanges();
                var giaCa = db.GiaCas.FirstOrDefault(x => x.SanpId == product.SanpId);
                if (giaCa == null)
                {
                    var price = new GiaCa();
                    price.SanpId = product.SanpId;
                    price.Gia = gia;
                    price.NgayBatDau = DateTime.Now;
                    db.GiaCas.Add(price);
                    db.SaveChanges();
                }
                else
                {
                    giaCa.Gia = gia;
                    db.SaveChanges();
                }

                return Ok(data);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet]
        [Route("count")]
        public IActionResult count()
        {
            try
            {
                var data = db.Sanphams.Count();
                return Ok(data);
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet]
        [Route("getAll/{pageIndex}/{pageSize}")]
        public IActionResult getAll(int pageIndex, int pageSize)
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
            var products = x.Skip(pageIndex * pageSize).Take(pageSize).ToList();
            return Ok(products);

        }
        [HttpGet]
        [Route("getById/{id}")]
        public IActionResult getById(int id)
        {
            try
            {
                var data = from sp in db.Sanphams
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

                return Ok(data.FirstOrDefault(x=>x.SanpId == id));
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("search/{name}/{pageIndex}/{pageSize}")]
        public IActionResult search(string name, int pageIndex, int pageSize)
        {
            try
            {
                var data = from sp in db.Sanphams
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
                var x = data.Where(x => x.SanpName.Contains(name)).Skip(pageIndex * pageSize).Take(pageSize).ToList();
                return Ok(x);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpDelete]
        [Route("delete/{id}")]
        public IActionResult delete(int id)
        {
            try
            {
                var data = db.Sanphams.FirstOrDefault(x => x.LoaiId == id);
                if (data == null)
                {
                    return NotFound($"category with id {id} not found");
                }
                db.Sanphams.Remove(data);
                db.SaveChanges();
                var gia = db.GiaCas.FirstOrDefault(x => x.SanpId == id);
                db.GiaCas.Remove(gia);
                db.SaveChanges();
                return Ok(data);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
