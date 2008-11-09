# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  load 'tasks/setup.rb'
end

ensure_in_path 'lib'
require 'ruby-config'

task :default => 'spec:run'

Object.send(:remove_const, :SUDO) if defined? SUDO
Object.send(:remove_const, :HAVE_GIT) if defined? HAVE_GIT
SUDO = ''
HAVE_GIT = true

PROJ.name = 'ruby-config'
PROJ.authors = 'Leon Bogaert'
PROJ.email = 'leon@tim-online.nl'
PROJ.url = 'www.vanutsteen.nl'
PROJ.version = RubyConfig::VERSION
PROJ.rubyforge.name = 'ruby-config'
PROJ.exclude = %w(.git pkg/ nbproject/ doc/  website/ )
PROJ.gem.dependencies << 'metaid'
PROJ.gem.dependencies << 'user-choices'

#PROJ.rdoc.remote_dir = 'docs/'
PROJ.rcov.opts << "--exclude rcov.rb"

PROJ.spec.opts << '--color'

# EOF
