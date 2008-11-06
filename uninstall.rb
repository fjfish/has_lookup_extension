require 'ftools'
# Install hook code here
# create the migration
puts "Removing the migration"
lookup_name = Dir.glob("db/migrate/*lookup_code*.rb").first
lookup_name = lookup_name.split(/\//).last
lookup_name = lookup_name.split(/_/).first
system "rake db:migrate:down VERSION=#{lookup_name}" rescue puts "Could not remove table!!"
system "ruby script/destroy model lookup_code"
# Find the lookup codes file and replace it with this
# Create the loader
# Create helpers/admin directory
puts "removing the loader"
target_loader = "#{RAILS_ROOT}/app/helpers/admin/lookup_codes_loader.rb"
if File.file?(target_loader)
  File.delete(target_loader)
else
  puts "loader did not exist?"
end
# Create the model
puts "Lookup codes removed"
