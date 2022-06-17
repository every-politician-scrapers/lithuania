#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class OfficeholderList < OfficeholderListBase
  decorator RemoveReferences
  decorator UnspanAllTables
  decorator WikidataIdsDecorator::Links

  def header_column
    'Ministras'
  end

  class Officeholder < OfficeholderBase
    def columns
      %w[no name party start end].freeze
    end

    def empty?
      (tds[1].text == tds[2].text) || too_early?
    end

    def raw_end
      super.gsub('†', '').tidy
    end
  end
end

url = ARGV.first
puts EveryPoliticianScraper::ScraperData.new(url, klass: OfficeholderList).csv
