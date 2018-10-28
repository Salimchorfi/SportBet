namespace :db do

  desc "Scraping sport bet"

  task :scraping => :environment do

    require "Nokogiri"
    require "open-uri"

    html = open("https://www.oddsshark.com/nfl/consensus-picks")
    doc = Nokogiri::HTML(html, nil, 'UTF-8')

    table = doc.at('.consensus-table')
    results = []
    i = 0

    table.search('tr').each do |tr|
      if i % 3 != 0

        cells = tr.search('td')

        consensus = cells.search('.consensus')
        long = cells.search('.name-long')
        line = cells.search('.line')
        short = cells.search('.name-short')
        price = cells.search('.price')

        short = [long.text.strip, line.text.strip, price.text.strip, consensus.text.strip]
        results << short

      end

      i += 1
    end

    Matchup.delete_all

    for i in 0..(results.count - 2)

      # p results[i][0]
      # p results[i + 1][0]
      # p results[i][1]
      # p results[i + 1][1]
      # p results[i][2]
      # p results[i + 1][2]
      # p results[i][3]

      matchup = Matchup.new(team1: results[i][0],
                            team2: results[i + 1][0],
                            line1: results[i][1],
                            line2: results[i + 1][1],
                            price1: results[i][2],
                            price2: results[i + 1][2],
                            consensus: results[i][3])

      matchup.save

    end

  end

end
