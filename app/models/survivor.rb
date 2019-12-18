class Survivor < ApplicationRecord
    has_one :inventory #relação do inventário com o survivor
    attribute :ativa, Infected.new
end
