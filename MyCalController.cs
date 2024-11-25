using Microsoft.AspNetCore.Mvc;

namespace IntelDemo.Controllers
{
    public class MyCalController : Controller
    {
        public IActionResult CalPage()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add()
        {
            try
            {
                int num1 = Convert.ToInt32(HttpContext.Request.Form["Text1"]);
                int num2 = Convert.ToInt32(HttpContext.Request.Form["Text2"]);
                ViewBag.Result = (num1 + num2).ToString();
            }
            catch (Exception)
            {
                ViewBag.Result = "Worng Input";
            }
            return View("CalPage");
        }

        [HttpPost]
        public IActionResult Minus()
        {
            try
            {
                int num1 = Convert.ToInt32(HttpContext.Request.Form["Text1"]);
                int num2 = Convert.ToInt32(HttpContext.Request.Form["Text2"]);
                ViewBag.Result = (num1 - num2).ToString();
            }
            catch (Exception)
            {
                ViewBag.Result = "Worng Input";
            }
            return View("CalPage");
        }

        [HttpPost]
        public IActionResult Multiply()
        {
            try
            {
                int num1 = Convert.ToInt32(HttpContext.Request.Form["Text1"]);
                int num2 = Convert.ToInt32(HttpContext.Request.Form["Text2"]);
                ViewBag.Result = (num1 * num2).ToString();
            }
            catch (Exception)
            {
                ViewBag.Result = "Worng Input";
            }
            return View("CalPage");
        }

        [HttpPost]
        public IActionResult Divide()
        {
            try
            {
                int num1 = Convert.ToInt32(HttpContext.Request.Form["Text1"]);
                int num2 = Convert.ToInt32(HttpContext.Request.Form["Text2"]);
                ViewBag.Result = (num1 / num2).ToString();
            }
            catch (Exception)
            {
                ViewBag.Result = "Worng Input";
            }
            return View("CalPage");
        }
    }
}
                                                                                  