class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  before_action :check_authorized, only: [:show, :destroy, :download]

  before_action :authenticate_user!


  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = current_user.uploads.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = current_user.uploads.find(params[:id])
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create

    unless upload_params
      redirect_to action: "index" and return
      return
    end

    @upload = current_user.uploads.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Rapid file uploaded successfully !!' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    # respond_to do |format|
    #   if @upload.update(upload_params)
    #     format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @upload }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @upload.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def download
  #   @upload = Upload.find(params[:id])
  #   send_file @upload.path, type: @upload.content_type, disposition: 'attachment'
  # end

  def download
    puts "andalksdnalskdnlasdlaskd----------"
    @upload= Upload.find(params[:id])

    send_file @upload.file.path,
              :filename => @upload.file_file_name,
              :type => @upload.file_content_type,
              :disposition => 'attachment'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:file)
      # render plain: "test"
      # return
    end
end
