class DebtsController < ApplicationController
    acts_as_token_authentication_handler_for User
    before_action :authenticate_user!

    def index
        @debts = Debt.all.order('id DESC')
        render json: @debts
    end

    def show
        render json: debt
    end

    def create
        require 'json'
        @debt = debt_params
        # Mongodb require JSON format instead of JSON string
        @debt[:client] = JSON.parse(debt_params[:client])

        #Verifiy if record doesn't exist, otherwise create a new 
        if @debt[:id] == 0 #CREATE
             @debt.delete(:id) # This allow Mongo to create it's own ID
             create = Debt.create! @debt
            if create
                render json: { debt: create }, status: 200
                return
            else
                render json: { message: "Error" }, status: 422
                return
            end
        else # UPDATE
            @update = Debt.find(@debt[:id])
            @debt.delete(:id)
            update = @update.update @debt
            if update
                render json: { debt: update }, status: 200
                return
            else
                render json: { message: "Error" }, status: 422
                return
            end
        end
    end

    def update
        if debt.update(debt_params)
            render json: { debt: debt }, status: 200
        else
            render json: { status: 422, debt: debt.errors.full_messages }, status: 422
        end
    end

    def destroy
        debt = Debt.find(params)
        if debt.destroy!
            render json: { debt: "Registro com id #{debt._id} destruido com sucesso!" }, status: 200
        else
            render json: { status: 422, debt: debt.errors.full_messages }, status: 422
        end
    end

    private
    def debt
        debt = Debt.find(params)
    end
    def debt_params
        params.require(:debt).permit(:id, :client, :reason, :when, :amount)
    end

end
