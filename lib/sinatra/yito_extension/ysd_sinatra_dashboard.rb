module Sinatra
  module YitoExtension
  	#
  	# Dashboard
  	#
    module Dashboard


      def self.registered(app)

        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'i18n')))       

        #
        # Admin page
        #
        app.get '/admin', :allowed_usergroups => ['staff'] do
          load_page(:admin)
        end

        #
        # Site structure
        #
        app.get '/admin/site/structure', :allowed_usergroups => ['staff'] do
          main_menu = Site::Menu.get('primary_links')
          load_page(:site_structure, :locals => {:main_menu => main_menu})
        end
 
        #
        # Site structure
        #
        app.get '/admin/site/style', :allowed_usergroups => ['staff'] do
          load_page(:site_style)
        end

        #
        # Serves static content
        #
        app.get '/dashboard/*' do

           serve_static_resource(request.path_info.gsub(/^\/dashboard/,''), 
              File.join(File.dirname(__FILE__), '..', '..', '..', 'static'),'dashboard') 

        end

      end

    end

  end
end