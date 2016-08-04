class GuidesController < Devise::RegistrationsController
  def show
    @guide = Guide.find(params[:id])
  end

  def index
    @guides = Guide.all
    flash[:notice] = 'Nenhum Guia cadastrado.' if @guides.empty?
  end
end
