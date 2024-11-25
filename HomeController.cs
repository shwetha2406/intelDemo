using IntelDemo.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace IntelDemo.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult sum()
        {
            return View();
        }

        [HttpPost]
        public IActionResult add()
        {
            int num1 = Convert.ToInt32(HttpContext.Request.Form["text1"]);
            int num2 = Convert.ToInt32(HttpContext.Request.Form["text2"]);
            int result = num1 + num2;
            ViewBag.SumResult = result.ToString();
            return View("sum"); 
        }

        public IActionResult Customer()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CustomerAdd() 
        {
            string Name = HttpContext.Request.Form["Name1"];
            string CompanyName = HttpContext.Request.Form["Company"];
            string DepartmentName = HttpContext.Request.Form["Department"];
            ViewBag.Name = Name;
            ViewBag.CompanyName = CompanyName;
            ViewBag.DepartmentName = DepartmentName;
            return View("Customer");
        }
    }
}
