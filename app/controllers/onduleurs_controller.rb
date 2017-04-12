class OnduleursController < ApplicationController
  def index
    filter_onduleurs if params[:query].present?
    @onduleurs ||= Onduleur.all
  end

  def import
    Onduleur.import(params[:file])
    redirect_to root_url, notice: "File uploaded"
  end

  private

  def filter_onduleurs
    @onduleurs = Onduleur.where('identifier LIKE ?', params[:query][:identifier]) if params[:query][:identifier].present?
    @onduleurs = Onduleur.where('datetime LIKE ?', params[:query][:datetime]) if params[:query][:datetime].present?
  end
end
