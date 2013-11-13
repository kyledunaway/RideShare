begin  
  namespace :db do  
    desc "Populate the development database with some fake data"  
    task :populate => :environment do  
      for i in 0..10
        User.create! :username => "user" + i.to_s, :password => "123"
      end
    end  
  end  
rescue LoadError  
  puts "Please run: sudo gem install forgery"  
end  

