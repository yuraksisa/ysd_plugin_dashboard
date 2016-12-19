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
                {:path => '/admin/seo',
                 :parent_path => '/admin',
                 :regular_expression => /^\/admin\/seo/, 
                 :title => 'SEO', 
                 :description => 'SEO console',
                 :fit => 1,
                 :module => :dashboard},                  
                {:path => '/admin/site',
                 :parent_path => '/admin',
                 :regular_expression => /^\/admin\/site/, 
                 :title => 'Sitio web', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard}, 
                {:path => '/admin/site/config',
                 :parent_path => '/admin/site',
      	         :regular_expression => /^\/admin\/site\/config/, 
                 :title => 'Datos de la web', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard}, 
                {:path => '/admin/site/structure',
                 :parent_path => '/admin/site',
                 :regular_expression => /^\/admin\/site\/structure/, 
                 :title => 'Estructura', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard},
                {:path => '/admin/site/style',
                 :parent_path => '/admin/site',
                 :regular_expression => /^\/admin\/site\/style/, 
                 :title => 'Estilo', 
                 :description => 'Inicio',
                 :fit => 1,
                 :module => :dashboard},
                {:path => '/admin/site/webmaster',
                 :parent_path => '/admin/site',
                 :regular_expression => /^\/admin\/site\/webmaster/, 
                 :title => 'Herramientas webmaster', 
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

  # ----------- Blocks ------------------------------------

    # Retrieve all the blocks defined in this module 
    # 
    # @param [Hash] context
    #   The context
    #
    # @return [Array]
    #   The blocks defined in the module
    #
    #   An array of Hash which the following keys:
    #
    #     :name         The name of the block
    #     :module_name  The name of the module which defines the block
    #     :theme        The theme
    #
    def block_list(context={})
    
      app = context[:app]
    
      [{:name => 'webmaster_admin_menu',
        :module_name => :dashboard,
        :theme => Themes::ThemeManager.instance.selected_theme.name}        
      ]
        
    end

    # Get a block representation 
    #
    # @param [Hash] context
    #   The context
    #
    # @param [String] block_name
    #   The name of the block
    #
    # @return [String]
    #   The representation of the block
    #    
    def block_view(context, block_name)    
      app = context[:app]
      case block_name
        when 'webmaster_admin_menu'
          app.partial :admin_menu
      end

    end
  end

end