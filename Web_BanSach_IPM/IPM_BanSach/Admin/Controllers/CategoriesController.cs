using Microsoft.AspNetCore.Mvc;
using Model.Models;

namespace Admin.Controllers
{
    [Route("api/categories")]
    public class CategoriesController : Controller
    {
        private BanSachContext db = new BanSachContext();
        [Route("create")]
        [HttpPost]
        public IActionResult create([FromBody] Loaisp category)
        {
            try
            {
                var x = db.Loaisps.Add(category);
                db.SaveChanges();
                return Ok();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("count")]
        public IActionResult CountCategory()
        {
            try
            {
                var data = db.Loaisps.Count();
                return Ok(data);
            }
            catch { 
                return BadRequest(); 
            }
        }
        [HttpPost]
        [Route("update")]
        public IActionResult update(Loaisp category)
        {
            try
            {
                var data = db.Loaisps.FirstOrDefault(x => x.LoaiId == category.LoaiId);
                if(data == null)
                {
                    return NotFound($"category with id {category.LoaiId} not found");
                }
                data.LoaiName = category.LoaiName;
                db.SaveChanges();
                return Ok(data);

            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet]
        [Route("getAll/{pageIndex}/{pageSize}")]
        public List<Loaisp> getAll(int pageIndex, int pageSize)
        {
            try
            {
                var data = db.Loaisps.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                return data;
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("getById/{id}")]
        public Loaisp getById(int id)
        {
            try
            {
                var data = db.Loaisps.FirstOrDefault(x => x.LoaiId == id);
                return data;
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpGet]
        [Route("search/{name}/{pageIndex}/{pageSize}")]
        public List<Loaisp> search(string name, int pageIndex, int pageSize)
        {
            try
            {
                var data = db.Loaisps.Where(x => x.LoaiName.Contains(name)).Skip(pageIndex*pageSize).Take(pageSize).ToList();
                return data;
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        
    }
}
