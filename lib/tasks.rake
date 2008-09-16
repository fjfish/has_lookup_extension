namespace :codes do
  desc "Load the lookup codes"
  task :load => :environment do
    puts "Loading lookup codes #{Time.now}"
    puts "====================================================="
    Admin::LookupCodesLoader.create_default_list
    puts "Finished"
  end
end

