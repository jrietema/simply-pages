require_dependency "simply_pages/application_controller"

module SimplyPages
  class FilesController < ApplicationController
    before_action :set_file, only: [:show, :edit, :update, :destroy]

    # GET /files
    def index
      @files = File.all
    end

    # GET /files/1
    def show
    end

    # GET /files/new
    def new
      @file = File.new
    end

    # GET /files/1/edit
    def edit
    end

    # POST /files
    def create
      @file = File.new(file_params)

      if @file.save
        redirect_to @file, notice: 'File was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /files/1
    def update
      if @file.update(file_params)
        redirect_to @file, notice: 'File was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /files/1
    def destroy
      @file.destroy
      redirect_to files_url, notice: 'File was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_file
        @file = File.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def file_params
        params.require(:file).permit(:title, :media_file_name, :media_content_type, :media_file_size)
      end
  end
end
