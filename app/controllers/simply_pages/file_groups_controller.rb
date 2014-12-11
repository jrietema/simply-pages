class SimplyPages::FileGroupsController < SimplyPages::ApplicationController

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
      redirect_to files_url, notice: 'Folder was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /files/1
  def update
    if @file_group.update(file_params)
      redirect_to files_url, notice: 'Folder was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /files/1
  def destroy
    @file_group.destroy
    redirect_to files_url, notice: 'Folder was successfully deleted.'
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