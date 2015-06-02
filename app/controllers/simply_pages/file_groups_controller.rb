class SimplyPages::FileGroupsController < SimplyPages::ApplicationController

  layout 'simply_pages/application'

  before_action :set_file_group, only: [:edit, :update, :destroy]

  # GET /files/new
  def new
    @file_group = SimplyPages::FileGroup.new
  end

  # GET /files/1/edit
  def edit
  end

  # POST /files
  def create
    @file_group = SimplyPages::FileGroup.new(file_params)

    if @file_group.save
      redirect_to files_url, notice: "Folder '#{@file_group.title}' was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /files/1
  def update
    if @file_group.update(file_params)
      redirect_to files_url, notice: "Folder '#{@file_group.title}' was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /files/1
  def destroy
    notice = "Folder '#{@file_group.title}' was successfully deleted."
    begin
      @file_group.destroy
    rescue StandardError
      notice = 'Only a folder without contents may be deleted.'
    end
    redirect_to files_url, notice: notice
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_file_group
    @file_group = SimplyPages::FileGroup.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def file_params
    params.require(:file_group).permit(:title, :parent_id)
  end

end