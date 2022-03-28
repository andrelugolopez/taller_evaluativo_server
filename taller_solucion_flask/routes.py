from controllers import RegisterControllers, LoginControllers, CrearProductoControllers, ProductosArrayControllers

routes = {
"register": "/register", "register_controllers": RegisterControllers.as_view("register_api"),
"login": "/login", "login_controllers": LoginControllers.as_view("login_api"),
"producto": "/crearproducto", "producto_controllers": CrearProductoControllers.as_view("producto_api"),
"productos_array": "/productos", "productos_array_controllers": ProductosArrayControllers.as_view("productosarray_api")
}
