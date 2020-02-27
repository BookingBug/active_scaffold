# TODO: clean up extensions. some could be organized for autoloading, and others could be removed entirely.
Dir["#{File.dirname __FILE__}/active_scaffold/extensions/*.rb"].each { |file| require file }
module ActiveScaffold
  autoload :Tableless, 'active_scaffold/tableless'
end

ActionController::Base.send(:include, ActiveScaffold)
ActionController::Base.send(:include, RespondsToParent)
ActionController::Base.send(:include, ActiveScaffold::Helpers::ControllerHelpers)
ActionView::Base.send(:include, ActiveScaffold::Helpers::ViewHelpers)

ActionController::Base.class_eval {include ActiveRecordPermissions::ModelUserAccess::Controller}
ActiveRecord::Base.class_eval     {include ActiveRecordPermissions::ModelUserAccess::Model}

# needed by active_scaffold_sortable '3.3.8'
module ActiveScaffold
  Routing = ActionDispatch::Routing
end
