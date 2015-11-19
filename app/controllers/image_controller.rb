

class ImageController < ApplicationController

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])
    imp = ImageProcessor.new
    imp.delay.processImg(uploader.current_path,uploader.filename)
    session[:image] = uploader.filename
    redirect_to :back
  end

end
