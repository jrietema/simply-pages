require_dependency "simply_pages/application_controller"

module SimplyPages
  class FilesController < ApplicationController

    layout 'simply_pages/application'

    before_action :set_file, only: [:show, :edit, :update, :destroy]
    before_action :init_file_groups, only: [:edit, :new]

    # GET /files
    # Renders the top-tier file groups and contents in html, and
    # per-node sublists in js/json format for ajax widgets/requests
    def index
      @node = params[:node].blank? ? nil : SimplyPages::FileGroup.find(params[:node])
      @node_id = !@node.nil? ? @node.id : nil
      @group = @node.is_a?(SimplyPages::FileGroup) ? @node.children : SimplyPages::FileGroup.where(parent_id: @node_id).all
      @items = @group + SimplyPages::File.where(file_group_id: @node_id).all
      respond_to do |format|
        format.html do
          # request the 'whole' list
          render :action => :index
        end
        format.js do
          # ajax sub-list request
          if @node.nil?
            render nothing: true
          else
            render partial: 'grouped', layout: false, collection: @items
          end
        end
        format.json do
          # json data for file chooser (fancychooser)
          render partial: 'grouped', layout: false
        end
      end
    end

    # GET /files/1
    def show
    end

    # GET /files/new
    def new
      @file = File.new(file_group_id: file_group_id_parameter)
    end

    # GET /files/1/edit
    def edit
    end

    # POST /files
    def create
      @file = File.new(file_params)

      if @file.save
        redirect_to files_path, notice: "File '#{@file.title}' was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /files/1
    def update
      if @file.update(file_params)
        redirect_to files_path, notice: "File '#{@file.title}' was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /files/1
    def destroy
      @file.destroy
      redirect_to files_path, notice: "File '#{@file.title}' was successfully deleted."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_file
        @file = File.find(params[:id])
      end

      # Retrieve available FileGroups for assignment
      def init_file_groups
        @file_groups = FileGroup.all
      end

      # Only allow a trusted parameter "white list" through.
      def file_params
        params.require(:file).permit(:title, :media, :media_file_name, :media_content_type, :media_file_size, :file_group_id)
      end

      def groups_by_parent
        @groups = FileGroup.group_by(&:parent_id)
      end

      def file_group_id_parameter
        value = (params[:file_group_id] || '').to_s.to_i
        (value > 0) ? value : nil
      end
  end
end
