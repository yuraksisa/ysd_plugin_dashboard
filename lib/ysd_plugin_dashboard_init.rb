require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :dashboard do

   name=        'dashboard'
   author=      'yurak sisa'
   description= 'Dashboard'
   version=     '0.1'
   
   hooker Huasi::DashboardExtension
   sinatra_extension Sinatra::YitoExtension::Dashboard
   sinatra_extension Sinatra::YitoExtension::YitoCoreConfiguration


end