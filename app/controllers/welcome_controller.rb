class WelcomeController < ApplicationController
  def ping
    respond_to do |format|
      format.json { render json: {status: 'ok'} }
    end
  end
  
  def accueil
  end

  def hotel
  end

  def restaurant
  end

  def seminaires
  end

  def activites
  end
end
