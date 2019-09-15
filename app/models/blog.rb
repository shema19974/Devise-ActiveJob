class Blog < ApplicationRecord
    def title_change
        sleep 200
        update(title :"Student")
    end
end
