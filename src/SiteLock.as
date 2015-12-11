package 
{
	import flash.display.LoaderInfo;
	import flash.net.LocalConnection;
	/**
	 * ...
	 * @author ...
	 */
	public class SiteLock 
	{
		/**
		 * Определяет на каком домене мы запущены
		 * @param	loaderInfo
		 * @return Имя домена на котором мы запущены
		 */
		public static function getDomain(loaderInfo:LoaderInfo):String
		{
			var local:LocalConnection = new LocalConnection()
			  
			if (local.domain == "localhost")
				return "localhost";
			  
			var url:String = loaderInfo.loaderURL;
			var urlStart:int = url.indexOf("://") + 3;
			var wwwPart:String = url.substr(urlStart, 4);
			  
			if (wwwPart == "www.")
				urlStart += 4;
			   
			var urlEnd:Number = url.indexOf("/", urlStart);
			var domain:String = url.substring(urlStart, urlEnd);
			 
			return domain;
		}
		
		/**
		 * Проверяет разрешено ли запускаться на текущем домене (домены должны быть без www)
		 * @param	currentDomain
		 * @param	urls
		 * @return 
		 */
		public static function checkDomain(currentDomain: String, urls: Array): Boolean
		{
		 for (var i: int = 0; i < urls.length; i++)
		 {
		  var index: int = currentDomain.indexOf(urls[i]);
		   
		  if (index != -1)
		  {
		   if (index == 0)
		   {
			// main domain (domain.com)
			return true;
		   }
		   else if (currentDomain.charAt(index - 1) == ".")
		   {
			// subdomain (sub.domain.com)
			return true;
		   }
		   else
		   {
			// fake domain (fakedomain.com)
		   }
		  }
		 }
		 
		 return false;
		}
		
	}

}