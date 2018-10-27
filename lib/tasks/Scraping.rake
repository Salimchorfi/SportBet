namespace :db do

  desc "Scraping sport bet"

  task :scraping => :environment do

    require "Nokogiri"
    require "open-uri"

    # doc = open("https://www.oddsshark.com/nfl/odds")
    # parsed = Nokogiri::HTML(doc)
    # teams = []

    # parsed.search('.op-matchup-team-text').each do |element|
    #   teams << element.text.strip
    # end

    # #Match up
    # for i in 0..((teams.count / 2) -1)
    #     puts "#{teams[i + i]} vs #{teams[i + 1 + i]}"
    # end

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

        short = [long.text.strip, line.text.strip, price.text.strip]
        results << short

      end

      i += 1
    end

    p results






  end

end
