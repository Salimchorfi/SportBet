class LogicController < ApplicationController

  def topPicks

    ScrapingController.new.scrap("nfl")

    Matchup.order('consensus DESC').limit(10).each do |element|

      if element.betType == "spread"
        puts "#{element.consensus}% love #{element.lineType} at #{element.team1} (#{element.line1}) vs #{element.team2} (#{element.line2})"
      else
        puts "#{element.consensus}% love: #{element.team1} vs #{element.team2} (#{element.lineType} #{element.line1})"
      end

    end

  end

end
