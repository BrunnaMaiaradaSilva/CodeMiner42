class Infected < ActiveRecord::Type::Boolean

    # do objeto para o banco
    def serialize(value)
        return value if value.kind_of?(String)
         value ? 'S' : 'N'
    end
    
    # do banco para o objeto
    def deserialize(value)
        return value if [ true, false ].include?(value)
        value.to_s.upcase == 'S'
    end
end