namespace :dev do
  desc "Set up the development environment"
  task setup: :environment do
    puts  %x(rails db:drop db:create db:migrate db:seed)
  end

end
