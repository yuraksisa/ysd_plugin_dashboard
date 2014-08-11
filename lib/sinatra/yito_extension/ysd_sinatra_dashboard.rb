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
        # Dashboard
        #
        #app.get '/dashboard', :allowed_usergroups => ['user', 'staff'] do 
        #
        #  load_page(:dashboard)
        #
        #end

        app.get '/admin', :allowed_usergroups => ['staff'] do
          load_page(:admin)
        end
 
      end

    end

  end
end