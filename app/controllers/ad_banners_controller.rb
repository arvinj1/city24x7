class AdBannersController < ApplicationController
  before_action :set_ad_banner, only: [:show, :edit, :update, :destroy]

  # GET /ad_banners
  # GET /ad_banners.json
  def index
    @ad_banners = AdBanner.all
    @pages = Page.all
  end

  # GET /ad_banners/1
  # GET /ad_banners/1.json
  def show
  end

  # GET /ad_banners/new
  def new
    @ad_banner = AdBanner.new
  end

  # GET /ad_banners/1/edit
  def edit
  end

  # POST /ad_banners
  # POST /ad_banners.json
  def create
    @ad_banner = AdBanner.new(ad_banner_params)

    respond_to do |format|
      if @ad_banner.save
        format.html { redirect_to @ad_banner, notice: 'Ad banner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ad_banner }
      else
        format.html { render action: 'new' }
        format.json { render json: @ad_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_banners/1
  # PATCH/PUT /ad_banners/1.json
  def update
    respond_to do |format|
      if @ad_banner.update(ad_banner_params)
        format.html { redirect_to @ad_banner, notice: 'Ad banner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ad_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_banners/1
  # DELETE /ad_banners/1.json
  def destroy
    @ad_banner.destroy
    respond_to do |format|
      format.html { redirect_to ad_banners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_banner
      @ad_banner = AdBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_banner_params
      params.require(:ad_banner).permit(:name, :counter, :selected, :see)
    end
end
