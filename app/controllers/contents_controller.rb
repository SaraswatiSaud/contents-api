require 'nokogiri'
require 'open-uri'

class ContentsController < ApplicationController
  def index
    @contents = Content.page params[:page]
    render json: { contents: @contents, per_page: @contents.limit_value, total_pages: @contents.total_pages, total_records: @contents.total_count }
  end

  def create
    if params[:url].present?
      # Scrape website and store
      response = Nokogiri::HTML(open(params[:url]))
      if response.present?
        h1 = []
        response.css('h1').each { |head| h1 << head.content.strip if head.content.strip.present? }
        h2 = []
        response.css('h2').each { |head| h2 << head.content.strip if head.content.strip.present? }
        h3 = []
        response.css('h3').each { |head| h3 << head.content.strip if head.content.strip.present? }
        link = []
        response.css('a').each { |a| link << a.attributes['href'].value if a.attributes['href'].value.present? }

        # response = HTTParty.get(params[:url])
        @content = Content.find_by(url: params[:url])
        if @content.present?
          @content.update(h1: h1, h2: h2, h3: h3, link: link)
        else
          @content = Content.create(url: params[:url], h1: h1, h2: h2, h3: h3, link: link)
        end
      end
    end
    render json: @content, status: :ok
  end
end
