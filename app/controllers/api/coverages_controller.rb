# frozen_string_literal: true

module Api
  class CoveragesController < ApplicationController
    def show
      coverage = Nokogiri::XML(File.read(Rails.root.join('config', 'data', 'coverage.kml')))

      polygons = coverage.css('coordinates').map do |coordinates|
        coordinates.children.first.to_s.split("\n").reject(&:blank?).map do |line|
          line.split(',').map(&:strip)[0..1]
        end
      end

      render json: polygons
    end
  end
end
