namespace :dev do
  desc "Set up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Drop DB...") { %x(rails db:drop) }
      show_spinner("Creating DB...") { %x(rails db:create) }
      show_spinner("Migrating DB...") { %x(rails db:migrate) }
      show_spinner("Updating DB...") { %x(rails db:seed) }
    else
      puts "You aren't on development environment"
  end
end

    private

    def show_spinner(msg_start, msg_end = "Done!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")

end
end
