namespace :db do

  desc "Scraping sport bet"

  task :scraping => :environment do

    require "Nokogiri"
    require "open-uri"

    html = open("https://www.oddsshark.com/nfl/consensus-picks")
    doc = Nokogiri::HTML(html, nil, 'UTF-8')

    #table = doc.at('.consensus-table')
    tableSpread = doc.css('.consensus-table').first
    tableTotal = doc.css('.consensus-table').last

    spread = []
    total = []
    i = 0
    x = 0

    #SPREAD
    tableSpread.search('tr').each do |tr|
      if i % 3 != 0

        cells = tr.search('td')

        consensus = cells.search('.consensus')
        long = cells.search('.name-long')
        line = cells.search('.line')
        short = cells.search('.name-short')
        price = cells.search('.price')

        short = [long.text.strip, line.text.strip, price.text.strip, consensus.text.strip]
        spread << short

      end

      i += 1
    end

    #TOTAL
    tableTotal.search('tr').each do |tr|
      if x % 3 != 0

        cells = tr.search('td')

        consensus = cells.search('.consensus')
        long = cells.search('.name-long')
        line = cells.search('.total')
        short = cells.search('.name-short')
        price = cells.search('.price')
        lineType = cells.search('.ou-wrap-top')

        short = [long.text.strip, line.text.strip, price.text.strip, consensus.text.strip, lineType.text.strip]
        total << short

      end

      x += 1
    end

    Matchup.delete_all

    #SPREAD
    for i in 0..(spread.count - 2)

      matchup = Matchup.new(team1: spread[i][0],
                            team2: spread[i + 1][0],
                            line1: spread[i][1],
                            line2: spread[i + 1][1],
                            price1: spread[i][2],
                            price2: spread[i + 1][2],
                            consensus: spread[i][3],
                            betType: "spread")

      matchup.save

    end

    #Total
    for i in 0..(total.count - 2)

      matchup = Matchup.new(team1: total[i][0],
                            team2: total[i + 1][0],
                            line1: total[i][1],
                            line2: total[i + 1][1],
                            price1: total[i][2],
                            price2: total[i + 1][2],
                            consensus: total[i][3],
                            betType: "total",
                            lineType: total[i][4])

      matchup.save

    end

  end

end
