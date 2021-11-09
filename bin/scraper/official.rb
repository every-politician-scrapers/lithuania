#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    field :name do
      noko.css('h4').text.tidy
    end

    field :position do
      noko.css('p').text.tidy
    end
  end

  class Members
    def member_container
      noko.css('.grid_item')
    end
  end
end

file = Pathname.new 'html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
