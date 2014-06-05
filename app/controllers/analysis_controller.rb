require 'nokogiri'
require 'open-uri'
class AnalysisController < ApplicationController
  def result_analysis
    good_things = Array.new
    bad_things = Array.new
    doc = params[:content]
    score_sum  = 0
    arr = doc.split(" ")
    arr.pop

    wordvals=Wordval.arel_table
    arr.each do |ar|
      gg = Wordval.where(:score => 1)
      bb = Wordval.where(:score => -1)
      if (gg.where("content LIKE ? ", "#{ar}" ).count > 0) || (ar.length > 5 && gg.where("content LIKE ?" , "%#{ar[0..-3]}%").count > 0 )
          score_sum = score_sum + 1
          good_things << ar
      elsif (bb.where("content LIKE ? ", "#{ar}" ).count > 0 )|| (ar.length > 5 && bb.where("content LIKE ?" , "%#{ar[0..-3]}%").count > 0 )
          score_sum = score_sum -1
          bad_things << ar
        end
    end
    render :text => "good#{good_things}<br>bad#{bad_things}"

  end
end
