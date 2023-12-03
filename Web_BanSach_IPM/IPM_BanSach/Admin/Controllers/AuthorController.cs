using Microsoft.AspNetCore.Mvc;
using Model.Models;

namespace Admin.Controllers
{
    [Route("api/author")]
    public class AuthorController : Controller
    {
        private BanSachContext db = new BanSachContext();
        [Route("create")]
        [HttpPost]
        public IActionResult create(Tg author)
        {
            try
            {
                var x = db.Tgs.Add(author);
                db.SaveChanges();
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet]
        [Route("count")]
        public IActionResult Count()
        {
            try
            {
                var count = db.Tgs.Count();
                return Ok(count);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpPost]
        [Route("update")]
        public IActionResult update(Tg author)
        {
            try
            {
                var data = db.Tgs.FirstOrDefault(x => x.TgId == author.TgId);
                if (data == null)
                {
                    return NotFound($"category with id {author.TgId} not found");
                }
                data.TgName = author.TgName;
                data.Sdt = author.Sdt;
                data.TgDiachi = author.TgDiachi;
                data.Email = author.Email;
                db.SaveChanges();
                return Ok(data);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet]
        [Route("getAll/{pageIndex}/{pageSize}")]
        public List<Tg> getAll(int pageIndex, int pageSize)
        {
            try
            {
                var data = db.Tgs.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                return data;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("getById/{id}")]
        public Tg getById(int id)
        {
            try
            {
                var data = db.Tgs.FirstOrDefault(x => x.TgId == id);
                return data;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("search/{name}/{pageIndex}/{pageSize}")]
        public List<Tg> search(string name, int pageIndex, int pageSize)
        {
            try
            {
                var data = db.Tgs.Where(x => x.TgName.Contains(name)).Skip(pageIndex * pageSize).Take(pageSize).ToList();
                return data;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
