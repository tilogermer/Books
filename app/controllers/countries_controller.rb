class CountriesController < ApplicationController
  before_action :find_country, only: [:show, :edit, :update, :destroy]

  def index
    @page_title = 'Countries'
    @countries = Country.all.order("name ASC")
  end

  def new
    @page_title = 'Add country'
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
     if @country.save
      flash[:notice] = "Country Created"
      redirect_to countries_path
    else
      render 'new'
    end
  end

  def show
    @countries = Country.all
    @books = @country.books
  end

  def edit
  end

  def update
    @country.update(country_params)
    flash[:notice] = "Country updated"
    redirect_to countries_path
  end

  def destroy
    @country.destroy
    flash[:notice] = "Country removed"
    redirect_to countries_path
  end

  private 
  def country_params
    params.require(:country).permit(:name)
  end
  
  def find_country
    @country = Country.find(params[:id])
  end
end
