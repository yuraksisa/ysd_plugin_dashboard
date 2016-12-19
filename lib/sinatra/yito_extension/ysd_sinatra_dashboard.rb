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
        app.get '/admin', :allowed_usergroups => ['staff','webmaster','user'] do
          load_page(:admin)
        end

        #
        # SEO
        #
        app.get '/admin/seo', :allowed_usergroups => ['staff','webmaster'] do 

          @cms_page_count = ContentManagerSystem::Content.count({type: 'page'})
          @cms_page_published_count = ContentManagerSystem::Content.count({type: 'page', publishing_state_id: 'published'})
          @cms_articles_count = ContentManagerSystem::Content.count({type: 'story'})
          @cms_articles_published_count = ContentManagerSystem::Content.count({type: 'story', publishing_state_id: 'published'})

          load_page :site_seo

        end

        #
        # Site definition
        #
        app.get '/admin/site', :allowed_usergroups => ['staff','webmaster'] do 

          load_page :site

        end

        #
        # Site configuration : Site name, description and logo
        #
        app.get '/admin/site/config', :allowed_usergroups => ['staff','webmaster'] do
    
          load_page :config_site

        end

        #
        # Site structure
        #
        app.get '/admin/site/structure', :allowed_usergroups => ['staff','webmaster'] do
          main_menu = Site::Menu.get('primary_links')
          load_page(:site_structure, :locals => {:main_menu => main_menu})
        end
 
        #
        # Site structure
        #
        app.get '/admin/site/style', :allowed_usergroups => ['staff','webmaster'] do
          load_page(:site_style)
        end

        #
        # Site webmaster tools
        #
        app.get '/admin/site/webmaster', :allowed_usergroups => ['staff','webmaster'] do
          load_page(:site_webmaster)
        end

        app.get '/admin/users', :allowed_usergroups => ['staff'] do
          load_page(:admin_users)
        end

        app.get '/admin/system', :allowed_usergroups => ['staff'] do
          load_page(:admin_system)
        end

        app.get '/admin/site/configuration', :allowed_usergroups => ['staff'] do
          load_page(:admin_configuration)
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