@states = 
[ "Alabama",
"Arizona",
"Arkansas",
"California",
"Colorado",
"Connecticut",
"Delaware",
"Florida",
"Georgia",
"Idaho",
"Illinois",
"Indiana",
"Iowa",
"Kansas",
"Kentucky",
"Louisiana",
"Maine",
"Maryland",
"Massachusetts",
"Michigan",
"Minnesota",
"Mississippi",
"Missouri",
"Montana",
"Nebraska",
"Nevada",
"New Hampshire",
"New Jersey",
"New Mexico",
"New York",
"North Carolina",
"North Dakota",
"Ohio",
"Oklahoma",
"Oregon",
"Pennsylvania",
"Rhode Island",
"South Carolina",
"South Dakota",
"Tennessee",
"Texas",
"Utah",
"Vermont",
"Virginia",
"Washington",
"West Virginia",
"Wisconsin",
"Wyoming" ]

begin  
  namespace :db do  
    desc "Populate the development database with some fake data"  
    task :populate => :environment do  
      for i in 0..100
        Trip.create! :origin => @states[rand(0..48)].to_s, :destination => @states[rand(0..48)].to_s, :user_id => rand(0..10), :seat_number => 1
      end

      for i in 0..10
        User.create! :username => "user" + i.to_s, :password => "123"
      end
    end  
  end  
rescue LoadError  
  puts "Please run: sudo gem install forgery"  
end  

