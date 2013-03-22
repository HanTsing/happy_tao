class CrawlerSitesController < ApplicationController
  # GET /crawler_sites
  # GET /crawler_sites.json
  def index
    @crawler_sites = CrawlerSite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @crawler_sites }
    end
  end

  # GET /crawler_sites/1
  # GET /crawler_sites/1.json
  def show
    @crawler_site = CrawlerSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @crawler_site }
    end
  end

  # GET /crawler_sites/new
  # GET /crawler_sites/new.json
  def new
    @crawler_site = CrawlerSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @crawler_site }
    end
  end

  # GET /crawler_sites/1/edit
  def edit
    @crawler_site = CrawlerSite.find(params[:id])
  end

  # POST /crawler_sites
  # POST /crawler_sites.json
  def create
    @crawler_site = CrawlerSite.new(params[:crawler_site])

    respond_to do |format|
      if @crawler_site.save
        format.html { redirect_to @crawler_site, notice: 'Crawler site was successfully created.' }
        format.json { render json: @crawler_site, status: :created, location: @crawler_site }
      else
        format.html { render action: "new" }
        format.json { render json: @crawler_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crawler_sites/1
  # PUT /crawler_sites/1.json
  def update
    @crawler_site = CrawlerSite.find(params[:id])

    respond_to do |format|
      if @crawler_site.update_attributes(params[:crawler_site])
        format.html { redirect_to @crawler_site, notice: 'Crawler site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @crawler_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawler_sites/1
  # DELETE /crawler_sites/1.json
  def destroy
    @crawler_site = CrawlerSite.find(params[:id])
    @crawler_site.destroy

    respond_to do |format|
      format.html { redirect_to crawler_sites_url }
      format.json { head :no_content }
    end
  end
end
