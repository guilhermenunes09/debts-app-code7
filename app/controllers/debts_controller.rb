class DebtsController < ApplicationController
    def index
        @debts = Debt.all
        render json: @debts
    end
end
