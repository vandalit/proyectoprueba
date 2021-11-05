class Product < ApplicationRecord
    #save
    before_save :validar_producto
    after_save :mandar_notificacion
    after_save :notifica_precio_bajo, if: :validar_precio?

    #validates :nombre, presence: true
    validates :nombre, presence: {message: 'el nombre del prodycto es  obligatorio'}
    validates :codigo, uniqueness: {message: "el codigo %{value} ya se encuentra asignado a toro producto"}
    #validates :nombre, length: {in: 5..20, message "el nombre debe tener entre 5 y 20 caracteres"}

    validate :codigo_validate
    #para generar validaciones no prestablecidas en rails
    #en este ejemplo tenemos presence, uniqueness, length, 
    #pero podriamos establecer cualquier condicionante nueva o especifica para que sume un mensaje de error.

    def codigo_validate
        if self.codigo.nil? || self.codigo.length < 4
            self.errors.add(:codigo, "el codigo debe ser dde almenos 4 caracteres")
        end
    end

    def validar_precio?
        self.precio < 10
    end

    def validar_producto
        puts "***esta agregando un producto"
    end

    def mandar_notificacion
        puts "***se ha agregado #{self.nombre} - #{self.stock} unidades."
    end

    def notifica_precio_bajo
        puts "*** el producto #{self.nombre} esta em descuento a $#{self.precio}"
    end
end
