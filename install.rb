# Install hook code here
# create the migration
puts "Creating the migration"
system "ruby script/generate model lookup_code"
# Find the lookup codes file and replace it with this
lookup_name = Dir.glob("db/migrate/*lookup_code*.rb").first
lookup_text = <<-EOT
class CreateLookupCodes < ActiveRecord::Migration
  def self.up
    create_table "lookup_codes", :force => true do |t|
      t.string  "domain",    :null => false
      t.integer "lookup_id", :null => false
      t.string  "value",     :null => false
    end
    add_index :lookup_codes, :domain
    add_index :lookup_codes, [:domain, :lookup_id], :unique=>false
    add_index :lookup_codes, [:domain, :value], :unique => true
  end

  def self.down
    drop_table :lookup_codes
  end
end
EOT
File.open(lookup_name,"w") { |f| f << lookup_text }
# Create the loader
# Create helpers/admin directory
require 'ftools'
puts "creating app/helpers/admin directory if it isn't already there"
Dir.mkdir("#{RAILS_ROOT}/app/helpers/admin") unless File.directory?("#{RAILS_ROOT}/app/helpers/admin")
puts "creating the loader"
target_loader = "#{RAILS_ROOT}/app/helpers/admin/lookup_codes_loader.rb"
unless File.file?(target_loader)
  File.copy("#{RAILS_ROOT}/vendor/plugins/has_lookup_extension/lib/lookup_codes_loader.rb",target_loader,true)
else
  puts "loader already exists!"
end
# Create the model
puts "creating the model, any file already there will be overwritten"
File.copy("#{RAILS_ROOT}/vendor/plugins/has_lookup_extension/lib/lookup_code.rb","#{RAILS_ROOT}/app/models/lookup_code.rb",true)
puts "Lookup codes installed, run rake db:migrate to create the model, rake codes:load to populate it"
puts "review the supplied codes in #{target_loader}"
