class ImportController < ApplicationController
  def new
  end

  def create
  	importer = Importer.new current_user
  	importer.import params[:file]
  	redirect_to new_import_path, :flash => { :success => "Data importada"}
  end
end
