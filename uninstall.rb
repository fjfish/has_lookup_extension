# Install hook code here
# remove the migration
RAILS_ROOT = "."
puts "Destroying the migration"
system "ruby script/destroy rspec_model lookup_codes"
# Create the loader
# Create helpers/admin directory
require 'ftools'
puts "removing the loader"
target_loader = "#{RAILS_ROOT}/app/helpers/admin/lookup_codes_loader.rb"
if File.file?(target_loader)
  File.delete(target_loader)
else
  puts "loader does not exist?"
end
puts "removing app/helpers/admin directory if it isn't already there"
Dir.rmdir("#{RAILS_ROOT}/app/helpers/admin") if File.directory?("#{RAILS_ROOT}/app/helpers/admin") rescue puts "Caught error $!"
# Create the model
puts "lookup codes uninstalled"
