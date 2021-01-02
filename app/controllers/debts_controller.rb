class DebtsController < ApplicationController
    def index
        @debts = Debt.all
        render json: @debts
    end

    def show
        @debt = Debt.where(_id: params).first
        render json: @debt
    end

    def create
        debt = Debt.create! debt_params
        if debt
            render json: { debt: debt }, status: 200
        else
            render json: { 
                errors: debt.errors.full_messages
            }, status: 403
        end
    end

    private
    def debt_params
        params.require(:debt).permit(:client, :reason, :when, :amount)
    end
end
