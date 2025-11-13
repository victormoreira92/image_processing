class ImagesController < ApplicationController
  include ActiveStorage::SetCurrent
  before_action :authenticate_user!
  before_action :set_image, only: %i[ show ]

  # GET /images/1
  def show
    render json: {
      image: @image,
      file_image_url: @image.file_image.url
    }, status: :ok
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      render json: {
        message: "Image was upload successfully.",
        image: @image
      }, status: :created
    else
      render json: {
        message: "Image upload failed.",
        errors: @image.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:user_id, :file_image)
    end
end
