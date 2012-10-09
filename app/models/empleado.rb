class Empleado < ActiveRecord::Base
  belongs_to :nivel
  belongs_to :municipio

  def nombre_completo
    string = ""
    string << "#{self.nombre} " if self.nombre
    string << "#{self.paterno} " if self.paterno
    string << "#{self.materno}" if self.materno
    return string
  end
end
