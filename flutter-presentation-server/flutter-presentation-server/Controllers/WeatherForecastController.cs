using System.Collections.Generic;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Mvc;

namespace flutter_presentation_server.Controllers
{
	[ApiController]
	[Route("contents")]
	public class WeatherForecastController : ControllerBase
	{
		private static readonly ShopItem[] Items = new[]
		{
			new ShopItem("Beer", 5, Category.Essential),
			new ShopItem("Cucumber", 1, Category.Grocery),
			new ShopItem("Boardgame", 5, Category.Leisure),
			new ShopItem("Wine", 5, Category.Essential),
			new ShopItem("Pie", 5, Category.Grocery),
			new ShopItem("Sketchbook", 5, Category.Leisure),
		};

		[HttpGet]
		public IEnumerable<ShopItem> Get()
		{
			return Items;
		}
	}

	public class ShopItem
	{
		public string Name { get; set; }
		public int Stock { get; set; }
		[JsonConverter(typeof(JsonStringEnumConverter))]
		public Category Category { get; set; }

		public ShopItem(string name, int stock, Category category)
		{
			Name = name;
			Stock = stock;
			Category = category;
		}
}

	public enum Category
	{
		Essential,
		Leisure,
		Grocery
	}
}
