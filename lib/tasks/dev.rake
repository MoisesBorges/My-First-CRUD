namespace :dev do
  desc "Set up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Drop the DB...") { %x(rails db:drop) }
      show_spinner("Creating DB...") { %x(rails db:create) }
      show_spinner("Migrating DB...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "You aren't on development environment"
    end
  end

      desc "Coins registration"
      task add_coins: :environment do
        show_spinner("Coins registration...") do
        coins = [
                  {
                    description: "Bitcoin",
                    acronym: "BTC",
                    url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"
                  },

                  {
                    description: "Ethereum",
                    acronym: "ETH",
                    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png"
                  },

                  {
                    description: "DASH",
                    acronym: "DASH",
                    url_image: "https://pngimage.net/wp-content/uploads/2018/05/dash-png-9.png"
                  },

                  {
                    description: "Iota",
                    acronym: "Iota",
                    url_image: "https://s2.coinmarketcap.com/static/img/coins/64x64/1720.png?_=cb31027"
                  },

                  {
                    description: "ZCash",
                    acronym: "ZEC",
                    url_image: "https://www.cryptocompare.com/media/351360/zec.png"
                  }
                ]

        coins.each do |coin|
            Coin.find_or_create_by!(coin)
          end
        end
      end

      desc "Registration of mining types"
      task add_mining_types: :environment do
        show_spinner("Registration of mining types...") do
        mining_types = [
          {description: "Proof of Work", acronym: "Pow"},
          {description: "Proof of Stake", acronym: "PoS"},
          {description: "Proof of Capacity", acronym: "PoC"},
        ]

        mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
      end
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
