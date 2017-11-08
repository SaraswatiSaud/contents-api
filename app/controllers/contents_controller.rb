class ContentsController < ApplicationController
  def index
    @contents = Content.all
    render json: @contents, status: :ok
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
