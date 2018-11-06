class LogicController < ApplicationController

  def topPicks

    Matchup.order('consensus DESC').limit(6).each do |element|
      if element.betType == "spread"
        puts "#{element.consensus}% love: #{element.team1} (#{element.line1}) vs #{element.team2} (#{element.line2})"
      else
        puts "#{element.consensus}% love: #{element.team1} vs #{element.team2} (#{element.lineType} #{element.line1})"
      end
    end


  end

end
