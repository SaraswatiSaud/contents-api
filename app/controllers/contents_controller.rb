require 'nokogiri'
require 'open-uri'

class ContentsController < ApplicationController
  def index
    @contents = Content.page params[:page]
    render json: { contents: @contents, per_page: @contents.limit_value, total_pages: @contents.total_pages, total_records: @contents.total_count }
  end

  def extract_content(element)
    arr = []
    @response.css(element).each do |head|
      content = (element == 'a') ? head.attributes['href'].value : head.content.strip
      arr << content if content.present?
    end
    arr
  end

  def create
    if params[:url].present?
      # Scrape website and store
      @response = Nokogiri::HTML(open(params[:url]))
      if @response.present?
        h1 = extract_content('h1')
        h2 = extract_content('h2')
        h3 = extract_content('h3')
        a = extract_content('a')

        content_params = {
          url: params[:url],
          h1: h1,
          h2: h2,
          h3: h3,
          link: a
        }

        # response = HTTParty.get(params[:url])
        @content = Content.find_by(url: params[:url])
        if @content.present?
          @content.update(content_params)
        else
          @content = Content.create(content_params)
        end
      end
    end
    render json: @content, status: :ok
  end
end
