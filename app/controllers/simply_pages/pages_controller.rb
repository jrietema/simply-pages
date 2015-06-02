require_dependency "simply_pages/application_controller"

module SimplyPages
  class PagesController < ApplicationController

    layout 'simply_pages/application'

    before_action :set_page, only: [:show, :edit, :update, :destroy]
    before_action :authenticate!, except: :public_render

    # this renders the page from the application
    def public_render
      @page = Page.where(slug: params[:slug]).first
      if @page.nil?
        render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      else
        render :show, layout: "/layouts/#{SimplyPages.application_layout}"
      end
    end

    # GET /pages
    def index
      @pages = SimplyPages.navigation_types.map{|t| [t, Page.for_nav(SimplyPages::Page.nav_index(t)).all]}
      #@pages = Page.all
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = Page.new
      @page.navigation_type = params[:navigation_type].to_i unless params[:navigation_type].blank?
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to pages_url, notice: "Page '#{@page.title}' was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to pages_url, notice: "Page '#{@page.title}' was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to pages_url, notice: "Page '#{@page.title}' was successfully deleted."
    end

    def reorder
      (params[:page] || []).each_with_index do |id, index|
        Page.where(id: id).update_all(position: index)
      end
      render nothing: true
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:title, :slug, :content, :navigation_type)
      end
  end
end
