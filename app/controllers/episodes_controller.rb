class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all

    respond_to do |format|
      format.html
      format.atom  { @episodes }
    end
  end

  def show
    @episode = Episode.find params[:id]
  end
end