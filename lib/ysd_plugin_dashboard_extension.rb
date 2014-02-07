module Huasi

  class DashboardExtension < Plugins::ViewListener

    
      routes = [{:path => '/dashboard',
      	         :regular_expression => /^\/dashboard/, 
                 :title => 'Dashboard' , 
                 :description => 'Dashboard',
                 :fit => 1,
                 :module => :cms}
                ]

  end

end