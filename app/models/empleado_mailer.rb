class EmpleadoMailer < ActionMailer::Base
  def empleado_registrado(empleado)
    setup_email(empleado)
    @subject    += 'Gracias por registrarte'
    @body[:url]  = "http://www.educacionchiapas.gob.mx"
  end

  
  protected

  def setup_email(empleado)
      @recipients = empleado.correo
      @from = "Secretaría de Educación de Chiapas <noreply@educacion.chiapas.gob.mx>"
      @subject  = ""
      @sent_on  = Time.now
      @body[:empleado] = empleado
      @content_type = "text/html"
  end

end
