class CreateEmpleados < ActiveRecord::Migration
  def self.up
    create_table :empleados do |t|
      t.string :paterno, :limit => 40
      t.string :materno, :limit => 40
      t.string :nombre, :limit => 60
      t.string :funcion, :limit => 60
      t.string :correo, :limit => 60
      t.integer :telefono
      t.string :cct, :limit => 25
      t.string :cct_nombre, :limit => 100
      #--- Relaciones con otras tablas ---
      t.integer :nivel_id
      t.integer :municipio_id
      t.timestamps
    end
  end

  def self.down
    drop_table :empleados
  end
end
