class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
    @ip = remoteIP()
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end
  

  # GET /pages/new
  def new
    @page = Page.new
    @images=Dir.glob("app/assets/images/icons/*.png")
  end

  # GET /pages/1/edit
  def edit
    @images=Dir.glob("app/assets/images/icons/*.png")
  end
  
  def main
    if Page.roots.nil?
      render :index
    else
      Page.roots.each do |page| 
        if page.isrootview?
          @page=page 
        end
      end
      render :show
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
      @rip=remoteIP()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :content, :parent_id,:icon,:mappable,:searchable,:keywords,:isrootview)
    end
end
