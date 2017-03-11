class LinksController < ApplicationController
  def create
    success, @link = Links::Commands.perform_default_pipeline_for(
      Link.new(link_params)
    )

    if success
      @short_url = Links::Commands::EncodeSlug.execute(@link.id)
      render :show
    else
      render :new
    end
  end

  def new
    @link = Link.new
  end

  def redirect
    id = Links::Commands::DecodeSlug.execute(params[:link_slug])
    url = Link
      .find(id)
      .decoded_url

    # Monitoring callbacks

    redirect_to url
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
