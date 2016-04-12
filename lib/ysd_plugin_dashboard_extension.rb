module Huasi

  class DashboardExtension < Plugins::ViewListener


    # ========= Routes ===================
    
    # routes
    #
    # Define the module routes, that is the url that allow to access the funcionality defined in the module
    #
    #
    def routes(context={})    
      routes = [{:path => '/dashboard',
      	         :parent_path => '/admin',
      	         :regular_expression => /^\/dashboard/, 
                 :title => 'Dashboard' , 
                 :description => 'Dashboard',
                 :fit => 1,
                 :module => :cms},
                {:path => '/admin/site/config',
                 :parent_path => '/admin',
      	         :regular_expression => /^\/admin\/site/, 
                 :title => 'Datos de la web', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard}, 
                {:path => '/admin/site/structure',
                 :parent_path => '/admin',
                 :regular_expression => /^\/admin\/site\/structure/, 
                 :title => 'Estructura', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard},
                {:path => '/admin/site/style',
                 :parent_path => '/admin',
                 :regular_expression => /^\/admin\/site\/style/, 
                 :title => 'Estilo', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard},
                {:path => '/admin/site/configuration',
                 :parent_path => '/admin',
                 :regular_expression => /^\/admin\/site\/configuration/, 
                 :title => 'Configuración', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard},                                                                     
                ]
    end


  end

end