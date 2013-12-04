module Katello

  class Engine < ::Rails::Engine

    initializer 'katello.mount_engine', :after=> :build_middleware_stack do |app|
      app.routes_reloader.paths << "#{Katello::Engine.root}/config/routes/mount_engine.rb"
    end

    isolate_namespace Katello

    initializer "katello.load_app_instance_data" do |app|
      app.config.paths['db/migrate'] += Katello::Engine.paths['db/migrate'].existent
      app.config.autoload_paths += Dir["#{config.root}/app/lib)"]
    end

    initializer 'katello.register_plugin', :after => :disable_dependency_loading do |app|
      katello = Katello.railtie_routes_url_helpers
      Foreman::Plugin.register :new_system do
        menu(:top_menu, :hosts, { :caption => 'LIST OF HOSTS', :parent => :monitor_menu, :first => :menu, :engine_name => 'main_app' }  )
        menu(:top_menu, :listofhosts, {:url_hash => {:controller => :hosts, :action => :new }, :caption => 'NEW HOSTS URL', :parent => :hosts_menu, :first => :menu, :engine_name => 'main_app'  } )
        menu(:top_menu, :listofsystems, {:url_hash => {:controller => 'katello/systems', :action => :index, :use_route=>"systems" }, :caption => 'List SYSTEMS URL', :parent => :configure_menu, :first => :menu, :engine_name => 'katello'  } )
        menu(:top_menu, :systems, { :caption => 'LIST OF SYSTEMS', :parent => :infrastructure_menu, :first => :menu, :engine_name => 'katello'  } )
      end
    end
  end

end
