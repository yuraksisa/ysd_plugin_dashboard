module Sinatra
  module YitoExtension
    #
    # Core configuration
    #
    module YitoCoreConfiguration

      def self.registered(app)

        app.get '/admin/config/site', :allowed_usergroups => ['staff'] do
    
          load_page :config_site

        end

      end

    end
  end
end