$LOAD_PATH.unshift '.'
require 'config/environment'

use Rack::Static, urls: ['/css'], root: 'public' # Rack fix allows seeing the css folder.

#if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride

use FiguresController
use LandmarksController
run ApplicationController
