class ContentsController < ApplicationController
  def index
    @contents = Content.page params[:page]
    render json: { contents: @contents, per_page: @contents.limit_value, total_pages: @contents.total_pages, total_records: @contents.total_count }
  end

  def create
    if params[:url].present?
      # Scrape website and store
      response = HTTParty.get(params[:url])
      @content = Content.find_by(url: params[:url])
      if @content.present?
        @content.update(content: response.body)
      else
        @content = Content.create(url: params[:url], content: response.body)
      end
    end
    render json: @content, status: :ok
  end
end
