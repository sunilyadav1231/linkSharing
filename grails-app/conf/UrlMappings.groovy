class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'login',action: 'index')
        "500"(view:'/errorPage/500_error_page')
        "404"(view:'/errorPage/404_error_page')
	}
}
