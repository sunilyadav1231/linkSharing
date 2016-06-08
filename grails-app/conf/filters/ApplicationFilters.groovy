package filters

class ApplicationFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                log.info "Params in before filter for controller: $controllerName      action: $actionName    params:  $params"
            }
            after = { Map model ->
                log.info "Params in after filter for controller: $controllerName      action: $actionName    params:  $params"
            }
            afterView = { Exception e ->
                log.error "Error: ${e.message}", e
            }
        }
    }
}
