class RegistroController < ApplicationController
  def index
  end


  def save
    @empleado = Empleado.new
    @empleado.paterno = params[:paterno] if params[:paterno]
    @empleado.materno = params[:materno] if params[:materno]
    @empleado.nombre = params[:nombre] if params[:nombre]
    @empleado.correo = params[:correo] if params[:correo]
    @empleado.telefono = params[:telefono] if params[:telefono]

    @empleado.funcion = params[:funcion] if params[:funcion]
    @empleado.cct = params[:cct] if params[:cct]
    @empleado.cct_nombre = params[:cct_nombre] if params[:cct_nombre]
    # with relations
    @empleado.municipio = Municipio.find(params[:municipio][0]) if params[:municipio]
    @empleado.nivel = Nivel.find(params[:nivel][0]) if params[:nivel]
    if @empleado.save
      EmpleadoMailer.deliver_empleado_registrado(@empleado) if @empleado
      flash[:notice] = "Usuario registrado"
      redirect_to  :action => 'success'

    else
      flash[:notice] = "No se pudo guardar, verifique sus datos"
      render :action => "index"
    end

  end

end
